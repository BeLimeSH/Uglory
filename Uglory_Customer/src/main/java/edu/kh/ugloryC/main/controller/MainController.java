package edu.kh.ugloryC.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class MainController {

	@RequestMapping("/main")
	public String mainForward() {
		
		return "common/main";
	}
}