package com.user.demo.repositories;



import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import org.springframework.stereotype.Component;

import com.user.demo.pojo.UserBoot;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.Repository;

//Repository
//JpaRepository<User, Integer> 
//CrudRepository
//PagingAndSortingRepository


public interface MasterDaoRepository extends   PagingAndSortingRepository<UserBoot, Integer> {

	
	//@Query(value="SELECT * from User  where MobileNumber=?1",nativeQuery=true)
	//public User checkMobile(String mobile);
	
	                       /* Same */
	
	/*@Query(value="SELECT * from user_boot  where mobile=:mobile",nativeQuery=true)
		public UserBoot checkMobile(@Param("mobile") String mobile);*/
	
	public UserBoot findBymobile(String mobile);
}
