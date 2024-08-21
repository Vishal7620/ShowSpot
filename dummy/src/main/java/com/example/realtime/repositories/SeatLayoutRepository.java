package com.example.realtime.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.Theaters;
import com.example.realtime.entities.seats_layout;

@Repository
public interface SeatLayoutRepository extends JpaRepository<seats_layout, Long>{

	@Query("SELECT s FROM seats_layout s where s.theater=:theater_id")
	List<seats_layout> findSeatLayoutByTheaterId(@Param("theater_id")Theaters theater_id);
}
