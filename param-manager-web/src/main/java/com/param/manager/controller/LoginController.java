package com.param.manager.controller;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Security;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/login")
public class LoginController {
    @RequestMapping("/name")
    public Map getLoginName(){
        Map map = new HashMap<>();
        map.put("name",SecurityContextHolder.getContext().getAuthentication().getName());
        return map;
    }
}
