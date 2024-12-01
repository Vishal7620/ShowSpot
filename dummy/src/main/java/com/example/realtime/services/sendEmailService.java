package com.example.realtime.services;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Seats;

@Service
public class sendEmailService {

	@Autowired
	private JavaMailSender javaMailSender;
	
	@Value("$(showspotentertainment@gmail.com)")
	private String fromEmailId;
	
	public void sendEmail(String recipient, String movieName,String theaterAddress,List<Seats>seatNumbers)
	{
		SimpleMailMessage simplemailMessage = new SimpleMailMessage();
		
		String seatNumbersFormatted=seatNumbers.stream().map(Seats::getSeatNumber).collect(Collectors.joining(", "));
		
		 String subject = "🎬 Your Movie Seats are Booked!";
	        String message = String.format(
	            "Hello,\n\nYour booking is confirmed! 🎉\n\n" +
	            "Here are your details:\n" +
	            "🎥 Movie: %s\n" +
	            "📍 Theater: %s\n" +
	            "💺 Seats: %s\n\n" +
	            "Enjoy the show and have a great time! 🍿\n\n" +
	            "Regards,\nShowSpot Team", movieName, theaterAddress, seatNumbersFormatted);
		
		simplemailMessage.setFrom(fromEmailId);
		simplemailMessage.setTo(recipient);
		simplemailMessage.setText(message);
		simplemailMessage.setSubject(subject);
		
		javaMailSender.send(simplemailMessage);
		
	}
}
