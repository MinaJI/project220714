package com.bitcamp.project220714.controller;

import com.bitcamp.project220714.model.UserDTO;
import com.bitcamp.project220714.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/logIn", method = RequestMethod.GET)
    public String logIn() {
        return "user/logIn";
    }

    @RequestMapping(value = "/logIn", method = RequestMethod.POST)
    public String logInLogic(String username, String password, HttpSession session) {
        UserDTO u = new UserDTO();
        u.setUsername(username);
        u.setPassword(convertSha2(password));

        u = userService.auth(u);

        if (u != null) {
            session.setAttribute("logIn", u);
            return "index";
        }

        return "index";
    }

    @RequestMapping(value = "/logOut", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }


    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String register() {
        return "user/register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerLogic(UserDTO u) {
        u.setPassword(convertSha2(u.getPassword()));
        userService.register(u);

        return "redirect:/";
    }

    private String convertSha2(String password) {
        String converted = null;
        StringBuilder builder = null;

        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes("UTF-8"));

            builder = new StringBuilder();
            for (int i = 0; i < hash.length; i++) {
                builder.append(String.format("%02x", 255 & hash[i]));
            }

            converted = builder.toString();

        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return converted;
    }
}
