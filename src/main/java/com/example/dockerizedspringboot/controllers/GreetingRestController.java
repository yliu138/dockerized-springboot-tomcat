package com.example.dockerizedspringboot.controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@RequestMapping("/greeting")
public class GreetingRestController extends AbstractRestController {
    @GetMapping(path="")
    public String home() {
        return "Hello Docker world";
    }
}
