package com.buaa.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.buaa.springmvc.dao.MessageDao;
import com.buaa.springmvc.dao.Msg;
import com.buaa.springmvc.service.MessageService;

@Service
public class MessageServiceImple implements MessageService {

	@Autowired
	MessageDao messageDao;

	public List<Msg> getAllPublicMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAllPublic();
	}

	public List<Msg> getAllPrivateMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAllPrivate();
	}

	public List<Msg> getAllMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAll();
	}

	public void createAMessage(Msg message) {
		// TODO Auto-generated method stub
		messageDao.insert(message);
	}

	public List<Msg> get5Message() {
		// TODO Auto-generated method stub
		return messageDao.get5();
	}
}
