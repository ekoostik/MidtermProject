package com.skilldistillery.vigilance.data;

import java.util.List;

import com.skilldistillery.vigilance.entities.Comment;
import com.skilldistillery.vigilance.entities.Post;

public interface PostDAO {
	
	
	
	public Post findpostById(int id);
	public Post createpost(String description, String photo, int userId, int hoodId);
	public Post updatepost(String description, int userId, int postI);
	public boolean deletepost(int id);
	public List <Post> allposts();
	
	public List<Comment> viewComments(int postid);
	public Comment addComment(String description, int postId, int userId);
	public boolean likeComment(int postId, int userId);

}
