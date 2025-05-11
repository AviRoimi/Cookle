package com.harel.cookle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Controller for handling main application routes
 */
@Controller
public class HomeController {
    
    /**
     * Maps the /project path to the main recipe search page.
     * 
     * @return Forward directive to the index.html page
     */
    @GetMapping("/project")
    public String projectPage() {
        return "forward:/index.html";
    }
} 