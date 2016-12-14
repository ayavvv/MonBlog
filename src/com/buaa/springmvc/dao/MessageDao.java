package com.buaa.springmvc.dao;

import java.util.List;


/**
 * @author theo
 *
 */
public interface MessageDao {

    public int insert(Msg message);

//    public int update(Message message);
//
    public int delete(int id);
//
//    public Message getById(int id);
//
//    public Message getByAuthor(String author);

    public List<Msg> getAll();
    
    public List<Msg> get5();

    public List<Msg> getAllPrivate();

    public List<Msg> getAllPublic();
}
