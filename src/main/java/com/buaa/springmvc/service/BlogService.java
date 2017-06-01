package com.buaa.springmvc.service;

import java.util.List;

import com.buaa.springmvc.dao.Blog;

/**
 * @author theo
 * blogservice interface
 */
public interface BlogService {
	
	//д����
	public void createBlog(Blog blog);
	
	//���²��� by id
	public void updateBlog(Blog blog);
	
	//ɾ������ by id
	public void deleteBlogbyId(int id);
	
	//ɾ�����в���
	public void deleteAllBlog(Blog blog);
	
	//�鿴���в���
	public List<Blog> getAllBlog();
	
	
	public List<Blog> get5Blog();
	
	//�鿴����by id
	public Blog getBlogbyId(int id);
	
	//�鿴����by category
	public List<Blog> getBlogbyCategory(String category);
	
}
