package com.polyglot;

import com.polyglot.services.CourseService; // Ensure the correct package and capitalization for the service
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class PyglotApplication {

    public static void main(String[] args) {
        SpringApplication.run(PyglotApplication.class, args);
    }

    @Bean
    public CommandLineRunner dataLoader(CourseService courseService) { // Fix capitalization of parameter
        return args -> {
            // Add data to the database
            courseService.addCourses();
        };
    }
}
