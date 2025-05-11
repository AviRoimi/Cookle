package com.harel.cookle;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Main application class for the Cookle application.
 * This is the entry point of the Spring Boot application that allows users
 * to search for recipes based on ingredients or recipe names.
 */
@SpringBootApplication
public class CookleApplication {

	/**
	 * Main method that starts the Spring Boot application.
	 * @param args Command line arguments passed to the application
	 */
	public static void main(String[] args) {
		SpringApplication.run(CookleApplication.class, args);
	}

}
