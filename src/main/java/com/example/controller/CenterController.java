package com.example.controller;

import java.util.List;
import java.util.Optional;
import java.util.logging.Logger;

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
public class CenterController {
	
	@Autowired
	CenterService service;
	
	@Autowired
	CitizenService citizenservice;
	
	Logger log=Logger.getAnonymousLogger();
	
	@RequestMapping("/addCenter")
	public ModelAndView insert(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		VaccineCenter vc=new VaccineCenter();
		vc.setName(request.getParameter("centerName"));
		vc.setCity(request.getParameter("centerCity"));
	    VaccineCenter center=service.saveCenter(vc);
		if(center!=null) {
			mv.setViewName("redirect:/vaccinationcenter");
		}
		else
		{
			mv.setViewName("AddVaccinationCenter.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/vaccinationcenter")
	public ModelAndView displayCenters(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		
		List<VaccineCenter> list=service.getall();
		
		mv.addObject("listofcenters",list);
		
		mv.setViewName("VaccineDashboard.jsp");
		
		return mv;
	}
	
	@RequestMapping("/getCenterToUpdate/{id}")
	public ModelAndView getCenterByid(@PathVariable("id") int id)
	{
		
        ModelAndView mv=new ModelAndView();
		
		Optional<VaccineCenter> vc=service.getbyid(id);
		
		mv.addObject("centerToBeEdited",vc);
		
		mv.setViewName("/EditCenter.jsp");
		
		return mv;
		
	
	}
	
	@RequestMapping("/updateCenter")
	public ModelAndView updateCenter(HttpServletRequest request,HttpServletResponse response) {
	
		ModelAndView mv=new ModelAndView();
		Optional<VaccineCenter> vc=service.getbyid(Integer.parseInt(request.getParameter("cid")));
		 VaccineCenter center = vc.orElse(null);
	  
		center.setName(request.getParameter("updatedName"));
		center.setCity(request.getParameter("updatedCity"));
		
	    VaccineCenter updatedCenter=service.saveCenter(center);
		if(updatedCenter!=null) {
			mv.setViewName("redirect:/vaccinationcenter");
		}
		else
		{
			mv.setViewName("AddVaccinationCenter.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/deleteCenter/{id}")
	public ModelAndView deleteCenter(@PathVariable("id") int id) {
		
		ModelAndView mv=new ModelAndView();
	
		Optional<VaccineCenter> vc=service.getbyid(id);
		VaccineCenter center = vc.orElse(null);
		citizenservice.deleteallCitizensofAnCenter(center);
		
	    String result=service.deleteCenterById(id);
	    
		if(result.equals("success")) {
			mv.setViewName("redirect:/vaccinationcenter");
		}
		else
		{
			mv.setViewName("AddVaccinationCenter.jsp");
		}
		return mv;
	}
	
	@RequestMapping("/viewCenterById/{id}")
	public ModelAndView viewCenterById(@PathVariable("id") int id) {
	
		ModelAndView mv=new ModelAndView();
	
		
        Optional<VaccineCenter> center=service.getbyid(id);
        
        VaccineCenter vaccinecenter = center.orElse(null);
		
		mv.addObject("center",vaccinecenter);
		
		List<Citizen> listOfCitizens=citizenservice.getCitizensByCenterName(vaccinecenter);
		
		mv.addObject("citizenslist",listOfCitizens);
		

		mv.setViewName("/ViewCenter.jsp");
		
		return mv;
	}
	
	
	
	
	

}
