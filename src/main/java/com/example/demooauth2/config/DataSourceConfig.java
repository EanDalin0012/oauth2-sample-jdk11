package com.example.demooauth2.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.inject.Inject;
import javax.sql.DataSource;

@Configuration
@EnableTransactionManagement
public class DataSourceConfig {

    @Inject
    private Environment env;

//    @Bean
//    public HibernateTransactionManager transactionManager() throws IOException {
//        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
//        transactionManager.setSessionFactory(this.sessionFactoryBean().getObject());
//        return transactionManager;
//    }

//    @Bean
//    public LocalSessionFactoryBean sessionFactoryBean() throws IOException {
//        LocalSessionFactoryBean sessionFactoryBean = new LocalSessionFactoryBean();
//        sessionFactoryBean.setDataSource(this.dataSource());
//        sessionFactoryBean.setPackagesToScan(this.env.getProperty("wing.sqlite.packagesToScan"));
//        sessionFactoryBean.setHibernateProperties(this.hibernateProperties());
//        return sessionFactoryBean;
//    }

//    private Properties hibernateProperties() {
//        Properties properties = new Properties();
//        properties.setProperty("hibernate.dialect", "com.wingesb.config.common.CustomSQLiteDialect");
//        properties.setProperty("hibernate.cache.provider_class", "org.hibernate.cache.NoCacheProvider");
//        properties.setProperty("hibernate.cache.use_second_level_cache", "false");
//        properties.setProperty("hibernate.flushMode", this.env.getProperty("wing.sqlite.flushMode"));
//        properties.setProperty("hibernate.format_sql", this.env.getProperty("wing.sqlite.format_sql"));
//        properties.setProperty("hibernate.show_sql", this.env.getProperty("wing.sqlite.show_sql"));
//        return properties;
//    }

    @Primary
    @Bean
    public DataSource customDataSource() {

        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("custom.datasource.driver-class-name"));
        dataSource.setUrl(env.getProperty("custom.datasource.url"));
        dataSource.setUsername(env.getProperty("custom.datasource.username"));
        dataSource.setPassword(env.getProperty("custom.datasource.password"));

        return dataSource;

    }
}
