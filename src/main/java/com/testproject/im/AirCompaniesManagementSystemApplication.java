package com.testproject.im;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
public class AirCompaniesManagementSystemApplication {

    public static void main(String[] args) {
        SpringApplication.run(AirCompaniesManagementSystemApplication.class, args);
    }

}
