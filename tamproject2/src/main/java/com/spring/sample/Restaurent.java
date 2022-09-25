package com.spring.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@RequiredArgsConstructor
public class Restaurent {

	
	private final Chef chef;
	
}
