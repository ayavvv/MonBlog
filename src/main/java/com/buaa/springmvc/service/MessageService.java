package com.buaa.springmvc.service;

import java.util.List;

import com.buaa.springmvc.dao.Msg;

/**
 * @author theo
 *
 */
public interface MessageService {

	public List<Msg> getAllPublicMessage();
	public List<Msg> getAllPrivateMessage();
	public List<Msg> getAllMessage();
	public List<Msg> get5Message();
	public void createAMessage(Msg message);

}
