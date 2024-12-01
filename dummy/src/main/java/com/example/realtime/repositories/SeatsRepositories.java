	package com.example.realtime.repositories;
	
	import java.time.LocalDateTime;
	import java.util.List;
	import java.util.Optional;
	
	import org.springframework.data.jpa.repository.JpaRepository;
	import org.springframework.data.jpa.repository.Lock;
	import org.springframework.data.jpa.repository.Query;
	import org.springframework.data.repository.query.Param;
	import org.springframework.stereotype.Repository;
	
	import com.example.realtime.entities.Seats;
	
	import jakarta.persistence.LockModeType;
	
	@Repository
	public interface SeatsRepositories extends JpaRepository<Seats, Long>{
	
	//	@Query("SELECT s FROM Seats s WHERE s.theater_id=:theater_id")
	//	@Query("SELECT s FROM Seats s JOIN s.seatLayout sl WHERE s.theater_id = :theater_id ORDER BY sl.price DESC")
	//	List<Seats> findSeats(@Param("theater_id")Long theater_id);
		
		@Query("SELECT s FROM Seats s where s.Layout_type = :s1 OR s.Layout_type = :s2 OR s.Layout_type = :s3")
		List<Seats> findSeatsByLayout(@Param("s1")String s1,@Param("s2")String s2,@Param("s3")String s3);
		
		@Lock(LockModeType.PESSIMISTIC_WRITE)
		@Query("SELECT s FROM Seats s WHERE s.seatId=:seatId")
		Optional<Seats> findByIdForUpdates(@Param("seatId")Long seatId);
		
		@Query("SELECT s FROM Seats s WHERE s.seatId=:seatId")
		Seats findSeatBySeatId(@Param("seatId")Long seatId);
		
		@Query("SELECT s FROM Seats s WHERE s.held = true AND s.holdExpirationTime <= :now")
		List<Seats> findHeldSeats(LocalDateTime now);

	}
