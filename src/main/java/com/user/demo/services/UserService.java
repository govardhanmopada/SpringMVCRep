package com.user.demo.services;


import com.user.demo.pojo.UserBoot;

public interface UserService {

	public UserBoot addUser(UserBoot obj);

	public UserBoot updateUser(UserBoot obj);

	public void deleteUser(int userID);

	public boolean checkMobile(String mobile);
}
