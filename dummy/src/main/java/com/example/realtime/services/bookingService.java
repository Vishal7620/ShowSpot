package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Bookings;
import com.example.realtime.repositories.BookingRepository;

@Service
public class bookingService {

	@Autowired
	private BookingRepository bookingRepository;
	
	public List<Bookings> findAllBookings(String mail)
	{
		try {
			
		List<Bookings>bookings=	bookingRepository.findBookingsByMailId(mail);
		return bookings;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
}
