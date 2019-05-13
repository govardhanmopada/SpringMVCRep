package com.user.demo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.demo.pojo.UserBoot;
import com.user.demo.repositories.MasterDaoRepository;

import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class UserServiceImpl implements UserService {
	static Logger logger = Logger.getLogger(UserServiceImpl.class.getName());

	@Autowired
	MasterDaoRepository masterDaoRepository;

	public UserBoot addUser(UserBoot obj) {

		masterDaoRepository.save(obj);
		return obj;
	}

	public UserBoot updateUser(UserBoot obj) {

		masterDaoRepository.save(obj);
		return obj;
	}

	public void deleteUser(int userID) {

		masterDaoRepository.deleteById(userID);

	}

	public boolean checkMobile(String mobile) {
		boolean result = true;
		UserBoot obj = masterDaoRepository.findBymobile(mobile);
		logger.info("Mobileobj-->" + obj);
		if (obj == null) {
			result = false;
		} else {
			result = true;
		}
		return result;
	}

}
