package com.bitcamp.project220714.controller;

import com.bitcamp.project220714.model.NoticeDTO;
import com.bitcamp.project220714.model.UserDTO;
import com.bitcamp.project220714.service.NoticeService;
import com.bitcamp.project220714.service.UserService;
import com.mysql.cj.protocol.x.Notice;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import javax.swing.plaf.PanelUI;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;
    @Autowired
    private UserService userService;

    @RequestMapping("/write")
    public String write(Model model, HttpSession session) {
        if (session.getAttribute("logIn") == null) {
            model.addAttribute("msg", "작성 권한이 없습니다.");
            model.addAttribute("url", "/notice/showAll");
            return "alert";
        }
        return "/notice/write";
    }

    @PostMapping("/write")
    public String write(String content, String title, HttpSession session, Model model) {

        if (session.getAttribute("logIn") == null) {
            return "redirect:/";
        }

        int logInId = ((UserDTO) session.getAttribute("logIn")).getId();
        NoticeDTO n = new NoticeDTO();
        n.setWriterId(logInId);
        n.setContent(content);
        n.setTitle(title);

        noticeService.insert(n);


        return "redirect:/notice/showAll";
    }

    @RequestMapping("/showAll")
    public String showFirstPage() {
        return "redirect:/notice/showAll/1";
    }

    @RequestMapping("/showAll/{pageNo}")
    public String showAll(Model model, HttpSession session, @PathVariable int pageNo) {

        List<NoticeDTO> list = noticeService.selectAll(pageNo);

        HashMap<Integer, String> nicknameMap = new HashMap<>();
        for (NoticeDTO n : list) {
            nicknameMap.put(n.getWriterId(), userService.selectOne(n.getWriterId()).getNickname());
        }

        model.addAttribute("list", list);
        model.addAttribute("nicknameMap", nicknameMap);
        model.addAttribute("currentPage", pageNo);
        model.addAttribute("lastPageNo", noticeService.selectLastPage());

        return "/notice/showAll";
    }

    @RequestMapping("/showOne/{id}")
    public String showOne(@PathVariable int id, HttpSession session, Model model) {
        if (session.getAttribute("logIn") == null) {
            return "redirect:/";
        }

        NoticeDTO n = noticeService.selectOne(id);
        if (n == null) {
            return "redirect:/notice/showAll";
        }

        model.addAttribute("n", n);
        model.addAttribute("nickname", userService.selectOne(n.getWriterId()).getNickname());
        UserDTO logIn = (UserDTO) session.getAttribute("logIn");
        model.addAttribute("logInId", logIn.getId());

        return "/notice/showOne";
    }
}
