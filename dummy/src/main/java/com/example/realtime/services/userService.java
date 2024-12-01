package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.User;
import com.example.realtime.repositories.UserRepository;

@Service
public class userService {

	@Autowired
	private UserRepository userRepository;
	
	public void manageUser(String email,Long mob,String fullname)
	{
		int flag=1;
		
		try
		{
		User user=userRepository.findByEmailAndMob(email, mob);
		
		if(user==null)
		{
		
			User newUser=new User();
			newUser.setEmail(email);
			newUser.setMob(mob);
			newUser.setFullname(fullname);
			userRepository.save(newUser);
		}
		
		}
		catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
		}
		
		
	}
	
	public User getUserByMailId(String mail)
	{
		User user =new User();
		try {
			user=userRepository.findByEmai(mail);
								
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
		
	}
}
