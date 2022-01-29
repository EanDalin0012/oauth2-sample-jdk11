package com.example.demooauth2.config.oauth2;

import com.example.demooauth2.core.customauthenticationprovider.DefaultAuthenticationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.provisioning.JdbcUserDetailsManagerConfigurer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.error.DefaultOAuth2ExceptionRenderer;
import org.springframework.security.oauth2.provider.error.OAuth2AccessDeniedHandler;
import org.springframework.security.oauth2.provider.error.OAuth2AuthenticationEntryPoint;
import org.springframework.security.oauth2.provider.error.OAuth2ExceptionRenderer;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import javax.sql.DataSource;
import java.util.Arrays;

/**
 * Created by Sokkheang Huo
 */

@Configuration
@EnableWebSecurity
@Order(SecurityProperties.BASIC_AUTH_ORDER)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
	private static final String TOKEN_END_POINT = "/oauth/token";

	@Autowired
	private DataSource ds;

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Autowired
	private DefaultAuthenticationProvider authProvider;

	/*
	 * @Bean
	 *
	 * @Override public UserDetailsService userDetailsServiceBean() throws Exception
	 * { return new JdbcUserDetails(); }
	 */

	    @Override
    public void configure(WebSecurity webSecurity) throws Exception {
        webSecurity
                .ignoring()
                .antMatchers(
                        "/api/image/**"
                        , "/unsecure/**"
                        , "/401.html"
                        , "/404.html"
                        , "/500.html");
    }

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
				.anonymous().disable()
				.antMatcher(TOKEN_END_POINT)
				.authorizeRequests()
				.anyRequest()
				.authenticated()
				.and()
				.httpBasic()
				.authenticationEntryPoint(this.authenticationEntryPoint())
				.and()
				.csrf()
				.requireCsrfProtectionMatcher(new AntPathRequestMatcher(TOKEN_END_POINT))
				.disable()
				.exceptionHandling()
				.accessDeniedHandler(this.accessDeniedHandler())
				.and()
				.sessionManagement()
				.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.exceptionHandling()
				.accessDeniedHandler(this.accessDeniedHandler())
				.authenticationEntryPoint(this.authenticationEntryPoint());
	}

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		JdbcUserDetailsManagerConfigurer<AuthenticationManagerBuilder> cfg = auth.jdbcAuthentication()
				.passwordEncoder(passwordEncoder()).dataSource(ds);
		cfg.getUserDetailsService().setEnableGroups(true);
		cfg.getUserDetailsService().setEnableAuthorities(false);

		auth.authenticationProvider(authProvider);
	}

	@Bean
	public AccessDeniedHandler accessDeniedHandler() {
		OAuth2AccessDeniedHandler accessDeniedHandler = new OAuth2AccessDeniedHandler();
		accessDeniedHandler.setExceptionRenderer(this.exceptionRenderer());
		return accessDeniedHandler;
	}

	@Bean
	public OAuth2ExceptionRenderer exceptionRenderer() {
		DefaultOAuth2ExceptionRenderer exceptionRenderer = new DefaultOAuth2ExceptionRenderer();
		exceptionRenderer.setMessageConverters(Arrays.asList(new HttpMessageConverter<?>[] {new MappingJackson2HttpMessageConverter()}));
		return exceptionRenderer;
	}

	@Bean
	public AuthenticationEntryPoint authenticationEntryPoint() {
		OAuth2AuthenticationEntryPoint authEntryPoint = new OAuth2AuthenticationEntryPoint();
		authEntryPoint.setTypeName("Basic");
		authEntryPoint.setRealmName("security/basic");
		authEntryPoint.setExceptionRenderer(this.exceptionRenderer());
		return authEntryPoint;
	}

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
}
