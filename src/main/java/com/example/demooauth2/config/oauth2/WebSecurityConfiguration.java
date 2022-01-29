package com.example.demooauth2.config.oauth2;

import com.example.demooauth2.core.customauthenticationprovider.DefaultAuthenticationProvider;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Created by Sokkheang Huo
 */

@Configuration
@EnableWebSecurity
@Order(SecurityProperties.BASIC_AUTH_ORDER)
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {
	private static final String TOKEN_END_POINT = "/oauth/token";

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
    	http.authorizeRequests()
			.anyRequest().authenticated().and().httpBasic()
			.and().csrf().disable();
    }

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		// auth.userDetailsService(userDetailsServiceBean())
		// .passwordEncoder(passwordEncoder());

		auth.authenticationProvider(authProvider);
	}

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		return super.authenticationManagerBean();
	}
}
