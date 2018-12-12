package com.jaspreet.money.planner.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author jaspreet
 *
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getHomePage() {
        return "index";
    }

}
