package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Post;

public interface PostDAO {
	
	
	
	public Post findpostById(int id);
	public Post createpost(Post post);
	public Post updatepost(int id, Post post);
	public boolean deletepost(int id);
	public List <Post> allposts();

}
