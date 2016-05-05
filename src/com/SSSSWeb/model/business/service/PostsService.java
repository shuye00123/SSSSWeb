package com.SSSSWeb.model.business.service;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.SSSSWeb.model.business.dao.PostsDAO;
import com.SSSSWeb.model.domain.Posts;

public class PostsService {
	private PostsDAO postsDAO;

	public PostsDAO getPostsDAO() {
		return postsDAO;
	}

	public void setPostsDAO(PostsDAO postsDAO) {
		this.postsDAO = postsDAO;
	}
	@Transactional
	public ArrayList<Posts> postList(){
		ArrayList list = postsDAO.postList();
        ArrayList resultList = new ArrayList();
        for(int i=0;i<list.size();i++){
            Object[] obj = (Object[]) list.get(i);
            Posts p = new Posts();
            p.setPostid(Integer.valueOf(obj[0].toString()));
            p.setPost(obj[1].toString());
            p.setTask(obj[2].toString());
            resultList.add(p);
        }
        return resultList;
	}
}
