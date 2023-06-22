package com.example.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.entity.Citizen;
import com.example.entity.VaccineCenter;
import com.example.service.CenterService;
import com.example.service.CitizenService;

@Controller
public class CitizenController {
	
	@Autowired
	CenterService centerservice;
	
	@Autowired
	CitizenService citizenservice;
	
	@RequestMapping("/citizen")
	public ModelAndView moveToAddCitizen(HttpServletRequest request,HttpServletResponse response) {
		
        ModelAndView mv=new ModelAndView();
		
		List<VaccineCenter> list=centerservice.getall();
		
		mv.addObject("listofcenters",list);
		
		mv.setViewName("AddCitizen.jsp");
		
		return mv;
	}
	
	@RequestMapping("/addCitizen")
	public ModelAndView addNewCitizen(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView();
		Citizen citizen=new Citizen();
	    citizen.setName(request.getParameter("cName"));
	    citizen.setCity(request.getParameter("cCity"));
	    int doseCount=Integer.parseInt(request.getParameter("doseCount"));
	    citizen.setDoseCount(doseCount);
	    
	    String centerName=request.getParameter("centerName");
	    VaccineCenter vc=centerservice.getbyName(centerName);
	    
	    citizen.setVc(vc);
	    
	    if(doseCount==0)
	    {
	    	citizen.setVaccinationStatus("Not vaccinated");
	    }
	    else if(doseCount==1)
	    {
	    	citizen.setVaccinationStatus("Partially vaccinated");
	    }
	    else
	    {
	    	citizen.setVaccinationStatus("Fully vaccinated");
	    }
	  
	    
	    Citizen citi=citizenservice.insertCitizen(citizen);
	    
		if(citi!=null) {
			mv.setViewName("redirect:/citizens");
		}
		else
		{
			mv.setViewName("AddCitizen.jsp");
		}
		return mv;
	}
	@RequestMapping("/citizens")
	public ModelAndView displayCenters(HttpServletRequest request,HttpServletResponse response) {
		
		ModelAndView mv=new ModelAndView();
		
		List<Citizen> list=citizenservice.getallCitizens();
		
		mv.addObject("listofcitizens",list);
		
		mv.setViewName("CitizenDashboard.jsp");
		
		return mv;
	}
	
	@RequestMapping("/getCitizenToUpdate/{id}")
	public ModelAndView getCitizenByid(@PathVariable("id") int id)
	{
	
		
        ModelAndView mv=new ModelAndView();
		
		Optional<Citizen> vc=citizenservice.getbyid(id);
		
        List<VaccineCenter> list=centerservice.getall();
		
		mv.addObject("listofcenters",list);
		
		mv.addObject("citizenToBeEdited",vc);
		
		mv.setViewName("/EditCitizen.jsp");
		
		return mv;
		
	
	}
	
	@RequestMapping("/updateCitizen")
	public ModelAndView updateCitizen(HttpServletRequest request,HttpServletResponse response) {
		
		ModelAndView mv=new ModelAndView();
		Optional<Citizen> citizen=citizenservice.getbyid(Integer.parseInt(request.getParameter("citizenid")));
		 Citizen c = citizen.orElse(null);
	
		c.setName(request.getParameter("updatedName"));
		c.setCity(request.getParameter("updatedCity"));
		
		 int doseCount=Integer.parseInt(request.getParameter("doseCountUpdated"));
		 
		 c.setDoseCount(doseCount);
		 
		 if(doseCount==0)
		    {
		    	c.setVaccinationStatus("Not vaccinated");
		    }
		    else if(doseCount==1)
		    {
		    	c.setVaccinationStatus("Partially vaccinated");
		    }
		    else
		    {
		    	c.setVaccinationStatus("Fully vaccinated");
		    }
		  String centerName=request.getParameter("centerNameUpdated");
		    
		  VaccineCenter vc=centerservice.getbyName(centerName);
		  
		 
		  
		  if(!c.getVc().getName().equals(centerName))
		  {
			  mv.setViewName("CenterMatchError.jsp");
			  mv.addObject("citiId", c.getId());
			  return mv;
		  }
		  
		  c.setVc(vc);
		
	    Citizen updatedCitizen=citizenservice.insertCitizen(c);
	    
		if(updatedCitizen!=null) {
			mv.setViewName("redirect:/citizens");
		}
		else
		{
			mv.setViewName("AddCitizen.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/deleteCitizen/{id}")
	public ModelAndView deleteCitizen(@PathVariable("id") int id) {
		
		ModelAndView mv=new ModelAndView();
	
		
	    String result=citizenservice.deleteCitizenById(id);
		if(result.equals("success")) {
			mv.setViewName("redirect:/citizens");
		}
		else
		{
			mv.setViewName("redirect:/citizens.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/viewCitizenById/{id}")
	public ModelAndView viewCitizenByid(@PathVariable("id") int id)
	{
		
		
        ModelAndView mv=new ModelAndView();
		
		Optional<Citizen> vc=citizenservice.getbyid(id);
		
        mv.addObject("citizenToBeViewed",vc);
		
		mv.setViewName("/ViewCitizen.jsp");
		
		return mv;
		
	
	}
	

}
