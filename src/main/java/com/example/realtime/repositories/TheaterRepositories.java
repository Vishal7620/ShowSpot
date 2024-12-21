package com.example.realtime.repositories;

import java.util.List;
import java.util.Set;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.Movies;
import com.example.realtime.entities.TheaterTimmings;
import com.example.realtime.entities.Theaters;

import jakarta.transaction.Transactional;

@Repository
public interface TheaterRepositories extends JpaRepository<Theaters, Long> {

	@Query("SELECT t FROM Theaters t WHERE t.theaterId=:id")
	Theaters findTheatersById(@Param("id")Long id);
	
	@Query("SELECT DISTINCT t FROM Theaters t WHERE LOWER(t.address) LIKE %:city%")
	List<Theaters> findTheatersByCity(@Param("city") String city);
	
	@Query("SELECT t FROM Theaters t WHERE t.theaterName=:theaterName AND LOWER(t.address) LIKE %:city%")
	List<Theaters> getTheatersByNameAndCity(@Param("theaterName")String theaterName,@Param("city") String city);
	
	@Query("SELECT t FROM Theaters t WHERE t.theaterName=:theaterName")
	Theaters getTheaterByTheaterName(@Param("theaterName")String theaterName);

	@Query("SELECT t FROM Theaters t WHERE t.theaterName=:theaterName AND t.theaterId=:id")
	Theaters getTheaterByTheaterNameAndId(@Param("theaterName")String theaterName,@Param("id")Long id);
	
	@Query("SELECT DISTINCT t FROM Theaters t WHERE LOWER(t.address) LIKE %:city% AND t.movie.id=:movieId")
	List<Theaters> findTheatersByCityAndMovieId(@Param("city") String city,@Param("movieId") Long movieId);
	
//	@Query("SELECT t FROM TheaterTimming t where t.theater=:theaterId")
//	List<TheaterTimmings> getTheaterTimmings(@Param("theaterId")Long theaterId);
	    
	    @Modifying
	    @Query("DELETE FROM Theaters t WHERE t.movie = :movieId")
	    void deleteByMovieId(Movies movieId);
	    
	    
	    @Modifying
	    @Query("DELETE FROM Theaters t WHERE t.theaterId=:id")
	    void deleteByTheaterId(Long id);
	    
}
