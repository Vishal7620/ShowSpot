package com.example.realtime.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.TheaterTimmings;

@Repository
public interface TheaterTimmingsRepository extends JpaRepository<TheaterTimmings, Long>{

	@Query("SELECT t FROM TheaterTimmings t WHERE t.theater.theaterId=:theaterId")
	List<TheaterTimmings> getTheaterTimmings(@Param("theaterId")Long theater);
}
