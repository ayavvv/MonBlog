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

	@Override
	public List<Msg> getAllPublicMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAllPublic();
	}

	@Override
	public List<Msg> getAllPrivateMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAllPrivate();
	}

	@Override
	public List<Msg> getAllMessage() {
		// TODO Auto-generated method stub
		return messageDao.getAll();
	}

	@Override
	public void createAMessage(Msg message) {
		// TODO Auto-generated method stub
		messageDao.insert(message);
	}

	@Override
	public List<Msg> get5Message() {
		// TODO Auto-generated method stub
		return messageDao.get5();
	}
}
