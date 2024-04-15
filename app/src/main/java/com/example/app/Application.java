package com.docker.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class Application {

    @GetMapping("/path1")
    public String path1() {
        return "path1";
    }

    @GetMapping("/path2")
    public String path2() {
        return "path2";
    }

    @GetMapping("/path3")
    public String path3() {
        return "path3";
    }

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}