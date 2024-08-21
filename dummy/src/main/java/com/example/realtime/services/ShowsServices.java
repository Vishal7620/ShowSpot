package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Shows;
import com.example.realtime.repositories.ShowsRepositories;

@Service
public class ShowsServices {

	@Autowired
    private ShowsRepositories showsRepositories;
	
	public List<Shows> getfindAllShows()
	{
		return showsRepositories.findAll();
	}
}
