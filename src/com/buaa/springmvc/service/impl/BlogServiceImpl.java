package com.buaa.springmvc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.buaa.springmvc.dao.Blog;
import com.buaa.springmvc.dao.BlogDao;
import com.buaa.springmvc.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService {
	@Autowired
    private BlogDao blogDao;

	@Override
	public void createBlog(Blog blog) {
		blogDao.insert(blog);
	}

	@Override
	public void updateBlogbyId(int id, Blog blog) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteBlogbyId(int id) {
		// TODO Auto-generated method stub
		blogDao.delete(id);

	}

	@Override
	public void deleteAllBlog(Blog blog) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Blog> getAllBlog() {
		// TODO Auto-generated method stub
		return blogDao.getAll();
	}

	@Override
	public Blog getBlogbyId(int id) {
		// TODO Auto-generated method stub
		return blogDao.getById(id);
	}

	@Override
	public List<Blog> getBlogbyCategory(String category) {
		// TODO Auto-generated method stub
		return blogDao.getByCategory(category);
	}

	@Override
	public List<Blog> get5Blog() {
		// TODO Auto-generated method stub
		return blogDao.get5();
	}

}
