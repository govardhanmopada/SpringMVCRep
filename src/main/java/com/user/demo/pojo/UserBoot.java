package com.user.demo.pojo;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "UserBoot")

public class UserBoot  {

	@Id
	@Column(name = "userID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	

	
	private String userName;

	
	private String lastName;

	
	private String mobile;

	
	private String mail;

	
	private String password;

	
	private String userType;

	
	private Date entryDate;

	
	private Date updateDate;

	
	private Boolean  isActive;   // Boolean Warper Class Hibernet takes only Warper not boolean

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(Date entryDate) {
		this.entryDate = entryDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Boolean  isActive() {
		return isActive;
	}

	public void setActive(Boolean  isActive) {
		this.isActive = isActive;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", lastName=" + lastName + ", mobile=" + mobile
				+ ", mail=" + mail + ", password=" + password + ", userType=" + userType + ", entryDate=" + entryDate
				+ ", updateDate=" + updateDate + ", isActive=" + isActive + "]";
	}

}
