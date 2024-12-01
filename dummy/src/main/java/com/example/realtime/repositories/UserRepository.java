package com.example.realtime.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.realtime.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{

	@Query("SELECT u FROM User u WHERE u.email=:email AND u.mob=:mob")
	User findByEmailAndMob(@Param("email")String email,@Param("mob")Long mob);
	
	@Query("SELECT u FROM User u WHERE u.email=:email" )
	User findByEmai(String email);
}
