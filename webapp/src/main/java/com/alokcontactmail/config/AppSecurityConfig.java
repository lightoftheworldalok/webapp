package com.alokcontactmail.config;

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

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		UserBuilder user = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication().withUser(user.username("Alok").password("alok@123").roles("ADMIN"));
		auth.inMemoryAuthentication().withUser(user.username("lol").password("lol@123").roles("MANAGER"));
		auth.inMemoryAuthentication().withUser(user.username("gol").password("gol@123").roles("EMPLOYEE"));
		
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.anyRequest()
		.authenticated()
		.and()
		.formLogin()
		.loginPage("/showLoginPage")
		.loginProcessingUrl("/authenticateTheUser")
		.permitAll();
	}
	
	
}
