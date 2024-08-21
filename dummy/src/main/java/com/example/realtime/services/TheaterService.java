package com.example.realtime.services;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Theaters;
import com.example.realtime.repositories.TheaterRepositories;

@Service
public class TheaterService {

	@Autowired
	private TheaterRepositories theaterRepositories;
	
	public Theaters findTheaterById(Long id)
	{
		return theaterRepositories.findTheatersById(id);
	}
	
	public List<Theaters> findTheatersByCity(String city)
	{
		return theaterRepositories.findTheatersByCity(city);
	}
	
	public List<Theaters> getTheatersByNameAndCity(String theaterName,String city)
	{
		return theaterRepositories.getTheatersByNameAndCity(theaterName, city);
	}
	
	public Theaters getTheaterByTheaterName(String theaterName)
	{
		return theaterRepositories.getTheaterByTheaterName(theaterName);
	}
	public Theaters getTheaterByTheaterNameAndId(String theaterName,Long id)
	{
		return theaterRepositories.getTheaterByTheaterNameAndId(theaterName,id);
	}
	
//	public List<Theaters> getUniquetheatersByCity(String city) {
//	    List<Theaters> theaters = theaterRepositories.findTheatersByCity(city);
//	    
//	    Map<String, Theaters> uniqueTheaterMap = new HashMap<>();
//	    
//	    for (Theaters theater : theaters) {
//	        uniqueTheaterMap.put(theater.getTheaterName(), theater);
//	    }
//	    
//	    // Convert the unique values to a list
//	    return new List<>(uniqueTheaterMap.values());
//	}
}
