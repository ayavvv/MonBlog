package com.buaa.springmvc.dao;

import java.util.List;

/**
 * @author theo
 * 数据库访问接口
 */
public interface BlogDao {

    public int insert(Blog blog);

    public int update(Blog blog);

    public int delete(int id);

    public Blog getById(int id);

    public Blog getByTitle(String title);

    public List<Blog> getByCategory(String category);

    public List<Blog> getAll();
    
    public List<Blog> get5();
    

 
}
