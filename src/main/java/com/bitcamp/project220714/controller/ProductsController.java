package com.bitcamp.project220714.controller;

import com.bitcamp.project220714.model.ProductsDTO;
import com.bitcamp.project220714.service.ProductsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/products")
public class ProductsController {
    @Autowired
    private ProductsService productsService;

    @RequestMapping("/register")
    public String register() {
        return "/products/register";
    }

    @PostMapping("/register")
    public String register(String name, int price, String category, String info, String imgPath,
                           Model model, @RequestParam MultipartFile image) {

        String savePath = "/Users/mina/IdeaProjects/project220714/src/main/webapp/static/productsImages/";
        String loadPath = "/static/productsImages/";

        File temp = new File(savePath);
        temp.mkdir();

        try {
            image.transferTo(new File(savePath + image.getOriginalFilename()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        ProductsDTO p = new ProductsDTO();
        p.setName(name);
        p.setPrice(price);
        p.setCategory(category);
        p.setInfo(info);
        p.setImgPath(loadPath + image.getOriginalFilename());

        productsService.insert(p);

        return "redirect:/";
    }

    @RequestMapping("/showAll")
    public String showAll(Model model) {
        model.addAttribute("list", productsService.selectAll());

        return "products/showAll";
    }

    @RequestMapping("/showAllIndex")
    public String showAllIndex(Model model) {
        model.addAttribute("list", productsService.selectAll());

        return "index2";
    }

    @RequestMapping("/showOne/{id}")
    public String showOne(@PathVariable int id, HttpSession session, Model model) {
        ProductsDTO p =productsService.selectOne(id);

        model.addAttribute("p", p);

        return "products/showOne";
    }

}
