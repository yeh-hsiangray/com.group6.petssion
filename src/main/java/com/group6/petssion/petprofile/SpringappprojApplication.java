package com.group6.petssion.petprofile;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan(basePackages = {"com.group6.petssion.petprofile"})
public class SpringappprojApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringappprojApplication.class, args);
	}

}
