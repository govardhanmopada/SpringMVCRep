package com.user.demo.services;

import java.util.List;

import com.user.demo.pojo.UserBoot;

public interface UserGetInfoService {

	public UserBoot getUserInformation(int userID);

	public List<UserBoot> getAllInforamtion();

}
