package com.bloducspauter;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;

@SpringBootApplication
@EnableDiscoveryClient
@EnableFeignClients(basePackages = {"com.bloducspauter.api"})
public class FeBlogCategoryApp {
    public static void main(String[] args) {
        SpringApplication.run(FeBlogCategoryApp.class);
    }
}