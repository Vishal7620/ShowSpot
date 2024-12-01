package com.example.realtime.services;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Bookings;
import com.example.realtime.entities.Seats;
import com.example.realtime.entities.User;
import com.example.realtime.repositories.BookingRepository;
import com.example.realtime.repositories.SeatsRepositories;

import ch.qos.logback.core.util.Duration;
import jakarta.transaction.Transactional;

@Service
public class SeatsService {

	@Autowired
	private SeatsRepositories seatsRepositories;
	
	@Autowired
	private BookingRepository bookingRepository;
	
//	public List<Seats> findSeatsByTheaterId(Long theater_id)
//	{
//		return seatsRepositories.findSeats(theater_id);
//	}
//	
	public List<Seats> findSeatsByLayout(String layout)
	{ String s1=layout.substring(0,2);
    
    String s2=layout.substring(2,4);
    String s3=layout.substring(4,6);
    
    return seatsRepositories.findSeatsByLayout(s1, s2, s3);
		
	}
	
	public Seats findSeatsById(Long id)
	{
		return seatsRepositories.findSeatBySeatId(id);
	}
	
	
	
//	@Transactional
//	public boolean bookSeat(Long seatId,Long userId)
//	{
//		Optional<Seats> seatOpt=seatsRepositories.findByIdForUpdates(seatId);
//		
//		if(seatOpt.isPresent())
//		{
//			Seats seat= seatOpt.get();
//			
//			// we have to fetch the user by userid
//			User user=new User();
//			Seats dummySeat=seatsRepositories.findSeatBySeatId(seatId);
//			if(!seat.isAvailable())
//			{
//				System.out.println("Seat Already booked");
//			}
//			
//			seat.setAvailable(false);
//			seatsRepositories.save(seat);
//			
//			Bookings booking=new Bookings();
//			booking.setUser(user);
//			booking.setSeat(dummySeat);
//			bookingRepository.save(booking);
//			
//			return true;
//		}
//		else
//		{
//			System.out.println("Seat not found");
//		}
//		
//		return false;
//	}
	
	
//	@Transactional
//	public boolean holdSeat(Long seatId)
//	{
//		Optional<Seats> seatOptional=seatsRepositories.findById(seatId);
//		
//		System.out.println("In the holdSeat-->"+seatId);
//		
//		if(seatOptional.isPresent())
//		{
//			Seats seat=seatOptional.get();
//			
//			System.out.println("present-->"+seat.getSeatId());
//			if(seat.isAvailable()&&! seat.isHeld())
//			{
//				seat.setHeld(true);
//				seat.setAvailable(false);
//				seat.setHoldExpirationTime(LocalDateTime.now().plusMinutes(3));
//				seatsRepositories.save(seat);
//				return true;
//			}
//		}
//		
//		return false;
//		
//	}
	
	@Transactional
	public boolean holdSeat(Long seatId)
	{
		Seats seat=seatsRepositories.findSeatBySeatId(seatId);
		
		System.out.println("In the holdSeat-->"+seatId);
		
		if(seat!=null)
		{
			
			System.out.println("present-->"+seat.getSeatId());
			if(seat.isAvailable()&&! seat.isHeld())
			{
				seat.setHeld(true);
				seat.setAvailable(false);
				seat.setHoldExpirationTime(LocalDateTime.now().plusMinutes(3));
				seatsRepositories.save(seat);
				return true;
			}
		}
		
		return false;
		
	}
	
	
	
	   @Transactional
	    public void releaseExpiredHolds(Long seatId) {
	        Optional<Seats> seatOptional = seatsRepositories.findById(seatId);

	        if (seatOptional.isPresent()) {
	            Seats seat = seatOptional.get();

	            // Release the hold manually if needed
	            seat.setHeld(false);
	            seat.setAvailable(true);
	            seatsRepositories.save(seat);
	        }
	    }
	   
	   @Transactional
	   public void makeAvailable(List<Seats>seats)
	   {
		   for(Seats seat:seats)
		   {
			   seat.setAvailable(false);
		   }
		   
		   seatsRepositories.saveAll(seats);
	   }
	 
	 
}