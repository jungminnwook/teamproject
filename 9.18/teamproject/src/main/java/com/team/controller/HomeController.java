package com.team.controller;

//import java.text.DateFormat;
//import java.util.Date;
//import java.util.Locale;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.Mapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
   
   @GetMapping(value = {"/", "/index"})
   public String home() {
     // GET 요청 
      // http://localhost:8090/
      System.out.println("home() 호출됨...");
      
      
      return "index";// 실행할 jsp뷰 이름을 리턴함.
   }
   
  
}