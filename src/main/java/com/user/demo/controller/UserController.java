package com.user.demo.controller;

import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.user.demo.services.UserGetInfoService;

import com.user.demo.services.UserService;
import com.user.demo.pojo.UserBoot;

@Controller
public class UserController {
	static Logger logger = Logger.getLogger(UserController.class.getName());

	@Autowired
	UserService userService;

	@Autowired
	UserGetInfoService userGetInfoService;

	@PostMapping("/AddUserControler")
	public ModelAndView addUser(@ModelAttribute("user") UserBoot user, BindingResult result, ModelMap model) {
		logger.setLevel(Level.INFO);

		if(result.hasErrors()) {
			logger.info("BULID Error" + result);
			return null;
		}
		
		boolean checkMobile = userService.checkMobile(user.getMobile());

		if (checkMobile == false) { // Mobile number Not exists OK

			Date d1 = new Date();
			user.setEntryDate(d1);
			user.setUpdateDate(d1);
			user.setActive(true);
			userService.addUser(user);// call Add User

			return new ModelAndView("redirect:/"); // Redirect to another Controller
		} else {
			logger.info("add user Page");
			model.addAttribute("flag", 1); // Number Already Exists
			return new ModelAndView("redirect:/addUserPage");
		}

	}

	@GetMapping("/EditUserControler")
	public String editUser(@RequestParam String userId, Model model) {
		logger.setLevel(Level.INFO);
		int userID = Integer.parseInt(userId);
		logger.info("userID-->" + userID);

		UserBoot userObj = null;
		try {
			userObj = userGetInfoService.getUserInformation(userID);
		} catch (Exception e) {
			logger.info("Control Error-->" + e.getMessage());
		}
		logger.info("UserId-->" + userId);
		model.addAttribute("userId", userId);
		model.addAttribute("editUserInforamtion", userObj);
		model.addAttribute("user", new UserBoot());

		return "editUser";
	}

	@PostMapping("/UpdateUserControler")
	public ModelAndView updateUser(@ModelAttribute("user") UserBoot userObj, BindingResult result, Model model) {
		logger.setLevel(Level.INFO);
		logger.info("$$$userObj-->" + userObj);
		Date d1 = new Date();
		userObj.setEntryDate(d1);
		userObj.setUpdateDate(d1);
		userObj.setActive(true);
		userService.updateUser(userObj);

		return new ModelAndView("redirect:/"); // Redirect to another Controller

	}

	@PostMapping("/DeleteUserControler")
	public ModelAndView deleteUser(@RequestParam String userId, Model model) {
		logger.setLevel(Level.INFO);
		logger.info("UserId-->" + userId);
		int userID = Integer.parseInt(userId);

		userService.deleteUser(userID);

		return new ModelAndView("redirect:/"); // Redirect to another Controller

	}

}
