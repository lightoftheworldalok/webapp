package com.alokcontactmail.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class AppSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private DataSource securityDataSource;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		UserBuilder user = User.withDefaultPasswordEncoder();
//		auth.inMemoryAuthentication().withUser(user.username("Alok").password("trs@123").roles("ADMIN","EMPLOYEE"));
//		auth.inMemoryAuthentication().withUser(user.username("lol").password("lol@123").roles("MANAGER","EMPLOYEE"));
//		auth.inMemoryAuthentication().withUser(user.username("gol").password("gol@123").roles("EMPLOYEE"));
		
		auth.jdbcAuthentication().dataSource(securityDataSource);
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/").permitAll()  
        .antMatchers("/employees").hasRole("EMPLOYEE")
        .antMatchers("/leader/**").hasRole("MANAGER") // hasAnyRole
        .antMatchers("/system/**").hasRole("ADMIN")
		.and()
		.formLogin()
		.loginPage("/showLoginPage")
		.loginProcessingUrl("/authenticateTheUser")
		.permitAll()
        .and()
        .logout()
        .logoutSuccessUrl("/")  // after logout then redirect to landing page (root)
        .permitAll()
        .and()
        .exceptionHandling()
        .accessDeniedPage("/access-denied");
	}
	
	
}
