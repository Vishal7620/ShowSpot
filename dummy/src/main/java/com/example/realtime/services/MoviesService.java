package com.example.realtime.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.realtime.entities.Movies;
import com.example.realtime.repositories.MoviesRepositories;

@Service
public class MoviesService {

	@Autowired
	private MoviesRepositories moviesRepositories;
	
	public void save(Movies movies)
	{
		moviesRepositories.save(movies);
	}
	
	public List<Movies> getAllMovies()
	{
		return moviesRepositories.findAll();
	}
	
	public List<Movies>getAllMoviesByLocation(String city)
	{
		return moviesRepositories.findByLocation(city);
	}
	
	public Movies getMoviesById(long movieId)
	{
		return moviesRepositories.findMoviesById(movieId);
	}
	
	public Movies findMovieByName(String movieName)
	{
		return moviesRepositories.findByTitle(movieName);
	}
	
}
