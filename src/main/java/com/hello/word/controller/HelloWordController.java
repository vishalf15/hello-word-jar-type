package com.hello.word.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloWordController {

	@GetMapping("/hello")
	public String sayHello() {
		return "Hello !!! How are you ?? Is Jar file prepared ??";
	}
}
