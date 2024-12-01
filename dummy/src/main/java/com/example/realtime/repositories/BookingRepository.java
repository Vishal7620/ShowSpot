package com.example.realtime.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.Bookings;

@Repository
public interface BookingRepository extends JpaRepository<Bookings, Long>{

	@Query ("SELECT b FROM Bookings b where b.email=:mail")
	List<Bookings> findBookingsByMailId(String mail);
}
