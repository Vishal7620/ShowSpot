package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.TheaterTimmings;
import com.example.realtime.repositories.TheaterTimmingsRepository;

@Service
public class TheaterTimmingServices {

	@Autowired
	private TheaterTimmingsRepository theaterTimmingsRepository;
	
	
	public List<TheaterTimmings> getTimmings(Long theaterId)
	{
		return theaterTimmingsRepository.getTheaterTimmings(theaterId);
	}
}
