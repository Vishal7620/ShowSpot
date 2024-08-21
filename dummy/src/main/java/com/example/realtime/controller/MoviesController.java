package com.example.realtime.controller;

import java.security.KeyStore.Entry;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.realtime.entities.Movies;
import com.example.realtime.entities.TheaterTimmings;
import com.example.realtime.entities.Theaters;
import com.example.realtime.entities.seats_layout;
import com.example.realtime.services.MoviesService;
import com.example.realtime.services.SeatLayoutService;
import com.example.realtime.services.TheaterService;
import com.example.realtime.services.TheaterTimmingServices;

@RestController
public class MoviesController {

	@Autowired
	private MoviesService moviesService;
	@Autowired
	private TheaterService theaterService;

	@Autowired
	private SeatLayoutService seatLayoutService;
	
	@Autowired
	private TheaterTimmingServices theaterTimmingServices;
	
	@RequestMapping(value="/views/selectedMovie", method=RequestMethod.POST)
	 public ModelAndView handleCitySubmission(@RequestParam("city") String city)
	 {
		 ModelAndView modelandView=new ModelAndView();
	
		 try
		 {
		 List<Movies>movies=moviesService.getAllMoviesByLocation(city);
		 
		 modelandView.addObject("movies",movies);
		 modelandView.addObject("selectedCity",city);
		 modelandView.setViewName("home");
		 }
		 catch(Exception e)
		 {
			 modelandView.setViewName("error");
			 e.printStackTrace();
		 }
		 return modelandView;
	 }
	
	@GetMapping("/views/selectedMovie")
	public ModelAndView getMovie(@RequestParam("movieId")long id)
	{
		ModelAndView modelandView=new ModelAndView();
	
		try
		{
		Movies movie=moviesService.getMoviesById(id);
        modelandView.setViewName("error");
		
		SimpleDateFormat dateFormat=new SimpleDateFormat("dd MMM yyyy");
		String formattedDate=movie.getReleaseDate()!=null ? dateFormat.format(movie.getReleaseDate()):" ";
		
	    modelandView.addObject("formattedDate",formattedDate);
	    modelandView.addObject("movie",movie);
		
	    modelandView.setViewName("selectedMovie");
		}
		catch (Exception e) {
			// TODO: handle exception
		modelandView.setViewName("error");
		}
	    return modelandView;
	}
	
	
	
	@GetMapping("/views/selectTheater")
	public ModelAndView bookTickets(@RequestParam("movieId")long movieId,@RequestParam("city")String city)
	{
		ModelAndView modelandView =new ModelAndView();
		try
		{
			//for movies
		Movies movie=moviesService.getMoviesById(movieId);
		modelandView.addObject("movie",movie);
		modelandView.addObject("city",city);
		
		//for theater- timming data fetching start
		
		List<Theaters>theaters=theaterService.findTheatersByCity(city);
		 
		Map<String,List<String>> map=new HashMap<>();
		SimpleDateFormat dateFormat=new SimpleDateFormat("HH:mm");
		
		for(Theaters theater:theaters)
		{
			   String theaterName = theater.getTheaterName();
	            String formattedDate = theater.getMovieTimings() != null ? dateFormat.format(theater.getMovieTimings()) : " ";

	            // Get the list associated with the current theaterId, or create a new list if it doesn't exist
	            List<String> timings = map.computeIfAbsent(theaterName, k -> new ArrayList<>());
	            timings.add(formattedDate);
		}
	
		
		Set<String>dummySet=new LinkedHashSet<>();
		List<Long>id=new ArrayList<>();
		for(Theaters theater:theaters)
		{
			dummySet.add(theater.getTheaterName());
			id.add(theater.getTheaterId());
		}
		
		Set<Theaters> newUpdatedTheater=new LinkedHashSet<>();
		int i=0;
		for(String str:dummySet)
		{
			Theaters t=new Theaters();
			t=theaterService.getTheaterByTheaterNameAndId(str, id.get(i));
			newUpdatedTheater.add(t);
			++i;
		}
		
		
		modelandView.addObject("theaters",newUpdatedTheater);
		
	    modelandView.addObject("theater-timing",map);
		
	    
	    //theater theater timming data fetching
		
		modelandView.setViewName("selectTheater");
		}
		catch (Exception e) {
			// TODO: handle exception
			modelandView.setViewName("error");
			e.printStackTrace();
		}
		return modelandView;
	}
	
	@GetMapping("/views/seatLayout")
	public ModelAndView selectTimmingsToproceed(@RequestParam("movieId")long movieId,@RequestParam("city")String city,
			@RequestParam("theaterId")Long theaterId,@RequestParam("timming")String timming,@RequestParam("date")String formatteddate1)
	{
		ModelAndView modelAndView=new ModelAndView();
		
		try
		{
			Theaters theater=theaterService.findTheaterById(theaterId);
			
			Movies movie=moviesService.getMoviesById(movieId);
			
			List<seats_layout> listOfSeatLayout=seatLayoutService.findLayoutByTheaterId(theater);
			
			System.out.println("Layout Info :");
			for(seats_layout seat:listOfSeatLayout)
			{
				System.out.println(seat.getCategoryName());
			}
			
			modelAndView.addObject("date",formatteddate1);
			modelAndView.addObject("timming",timming);
			modelAndView.addObject("movie",movie);
			modelAndView.addObject("theater",theater);
			
			modelAndView.addObject("listOfSeatLayout",listOfSeatLayout);
			
		    modelAndView.setViewName("seatLayout");
		}
		catch (Exception e) {
			// TODO: handle exception
			
			e.printStackTrace();
			modelAndView.setViewName("error");
		}
		return modelAndView;
	}
	
	
}
