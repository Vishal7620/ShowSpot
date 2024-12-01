package com.example.realtime.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.realtime.entities.Seats;
import com.example.realtime.repositories.SeatsRepositories;
import com.example.realtime.services.SeatsService;

import ch.qos.logback.core.util.Duration;

@RestController
public class seatController {

	@Autowired
	private SeatsService seatService;
	
	@Autowired
	private SeatsRepositories seatsRepositories;

	@PostMapping("/hold-seat")
	public ResponseEntity<Map<String, Object>> holdSeat(@RequestBody Map<String,Long>request)
	{
		Long seatId=request.get("seatId");

		boolean isHeld=seatService.holdSeat(seatId);
		
	    Map<String, Object> response = new HashMap<>();
        response.put("success", isHeld);

        if (isHeld) {
            return ResponseEntity.ok(response);
        } else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);
        }
		
	}
	
	   @PostMapping("/release-seat")
	    public ResponseEntity<Map<String, Object>> releaseSeat(@RequestBody Map<String, Long> request) {
	        Long seatId = request.get("seatId");
	        seatService.releaseExpiredHolds(seatId);

	        Map<String, Object> response = new HashMap<>();
	        response.put("success", true);

	        return ResponseEntity.ok(response);
	    }
	   
	   @Scheduled(fixedRate = 60000)  // Runs every 60 seconds
	    public void releaseExpiredHolds() {
	        List<Seats> heldSeats = seatsRepositories.findHeldSeats(LocalDateTime.now());

	        System.out.println("Held seats: " + heldSeats.size());

	        for (Seats seat : heldSeats) {
	            // If the seat has been held for more than 3 minutes, release the hold
	            if (java.time.Duration.between(seat.getHoldExpirationTime(), LocalDateTime.now()).toMinutes() >= 3) {
	                seat.setHeld(false);
	                seat.setAvailable(true);  // Restore availability
	                seatsRepositories.save(seat);
	            }
	        }
	    }
}
