package com.user.demo.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.user.demo.pojo.UserBoot;
import com.user.demo.services.UserGetInfoService;

@Controller
public class HomeController {

	@Autowired
	UserGetInfoService userGetInfoService; // By Name,By Type

	@GetMapping("/")
	public String getInfo(Locale locale, Model model) {
		List<UserBoot> getObjList = userGetInfoService.getAllInforamtion();
		model.addAttribute("userInformation", getObjList);
		return "reports";
	}

	@GetMapping("/addUserPage")
	public String addUserPage(Model model) {
		model.addAttribute("user", new UserBoot());
		return "addUser"; // Redirect page
	}

	@GetMapping("/cancelBtn")
	public ModelAndView cancelBtn() {
		return new ModelAndView("redirect:/"); // Redirect to another Controller
	}

}
