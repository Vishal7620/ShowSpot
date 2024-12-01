package com.example.realtime.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.Seats;
import com.example.realtime.entities.Theaters;
import com.example.realtime.entities.seats_layout;

import jakarta.persistence.LockModeType;

@Repository
public interface SeatLayoutRepository extends JpaRepository<seats_layout, Long>{

	@Query("SELECT s FROM seats_layout s where s.layout_type = :s1 OR s.layout_type = :s2 OR s.layout_type = :s3")
	List<seats_layout> findSeatLayoutByName(@Param("s1")String s1,@Param("s2")String s2,@Param("s3")String s3);
	
//	@Lock(LockModeType.PESSIMISTIC_WRITE)
//	@Query("SELECT s FROM Seats s WHERE s.id=:seatId")
//	Optional<Seats> findByIdForUpdates(@Param("seatId")Long seatId);
}
