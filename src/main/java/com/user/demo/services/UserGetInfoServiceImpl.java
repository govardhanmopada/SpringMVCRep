package com.user.demo.services;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.user.demo.pojo.UserBoot;
import com.user.demo.repositories.MasterDaoRepository;

@Service
public class UserGetInfoServiceImpl implements UserGetInfoService {
	static Logger logger = Logger.getLogger(UserGetInfoServiceImpl.class.getName());

	@Autowired
	MasterDaoRepository masterDaoRepository;

	public UserBoot getUserInformation(int userID) {
		logger.setLevel(Level.INFO);
		Optional<UserBoot> tblStockMaster = masterDaoRepository.findById(userID);
		if (tblStockMaster.isPresent()) {
			return tblStockMaster.get();
		} else {
			return null;
		}

	}

	public List<UserBoot> getAllInforamtion() {
		System.out.println("getAllInforamtion----------------->");
		List<UserBoot> userList = new ArrayList<UserBoot>();

		Pageable pageRequest = new PageRequest(0, 100, Sort.Direction.DESC, "UpdateDate");

		logger.info("pageRequest-->" + pageRequest.toString());

		Iterable<UserBoot> iteratableserviceNumList = masterDaoRepository.findAll(pageRequest);
		logger.info("itterable-->" + iteratableserviceNumList.toString());

		Iterator<UserBoot> iteratorServiceNumList = iteratableserviceNumList.iterator();

		while (iteratorServiceNumList.hasNext()) {
			userList.add(iteratorServiceNumList.next());
		}

		return userList;
	}

}
