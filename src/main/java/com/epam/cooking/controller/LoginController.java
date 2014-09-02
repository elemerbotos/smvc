package com.epam.cooking.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
    private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(ModelMap model, @RequestParam(defaultValue="false") boolean successfullRegistration) {
        model.addAttribute("successfullRegistration", successfullRegistration);

        return "login";
    }

    @RequestMapping(value = "/loginFailed", method = RequestMethod.GET)
    public String loginFailed(ModelMap model) {
        LOGGER.info("Login failed");
        model.addAttribute("error", true);
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(ModelMap model) {

        return "login";
    }
}
