package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Theaters;
import com.example.realtime.entities.seats_layout;
import com.example.realtime.repositories.SeatLayoutRepository;

@Service
public class SeatLayoutService {

	@Autowired
	private SeatLayoutRepository seatLayoutRepository;
	
	public List<seats_layout> findLayoutByTheaterId(Theaters theater_id)
	{
		return seatLayoutRepository.findSeatLayoutByTheaterId(theater_id);
	}
}
