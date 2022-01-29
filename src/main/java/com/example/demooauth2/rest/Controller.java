package com.example.demooauth2.rest;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    @GetMapping(value = "hello")
    public String index() {
        return "Hello";
    }
}
