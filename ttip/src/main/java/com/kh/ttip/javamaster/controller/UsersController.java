package com.kh.ttip.javamaster.controller;

import java.util.Set;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.ttip.javamaster.storage.UserStorage;

@RestController
@CrossOrigin
public class UsersController {
	
	@PostMapping("/registration")
	public ResponseEntity<Void> register(@RequestParam String userName){
	    System.out.println("handling register user request: " + userName);
	    try {
	        UserStorage.getInstance().setUser(userName);
	        return ResponseEntity.ok().build();
	    } catch (Exception e) {
	        return ResponseEntity.badRequest().build();
	    }
	}
	
	@PostMapping("/fetchAllUsers")
	public Set<String> fetchAll(){
		return UserStorage.getInstance().getUsers();
	}
}
