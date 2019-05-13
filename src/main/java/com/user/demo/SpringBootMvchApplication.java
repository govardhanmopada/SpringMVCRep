package com.user.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@ComponentScan("com.user")
@ComponentScan(basePackages = { "com.user.demo" })


//@EnableJpaRepositories(basePackages = {"com.user"})
//@EnableJpaRepositories("com.user.repositories")

@EnableJpaRepositories
public class SpringBootMvchApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBootMvchApplication.class, args);
	}
}
