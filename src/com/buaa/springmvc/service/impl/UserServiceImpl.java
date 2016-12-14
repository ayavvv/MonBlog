package com.buaa.springmvc.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buaa.springmvc.dao.User;
import com.buaa.springmvc.dao.UserDao;
import com.buaa.springmvc.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public int isUserTrue(String Name, String psswd) {
		// TODO Auto-generated method stub
		User user = userDao.getUserByName(Name);
		if (user == null) {
			return 0;
		} else {
			if (userDao.getUserByName(Name).getPsswd().equals(psswd)) {
				return 1;
			} else {
				return 0;
			}
		}
	}
}
