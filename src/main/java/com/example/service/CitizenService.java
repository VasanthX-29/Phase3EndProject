package com.example.service;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.CitizenRepo;
import com.example.entity.Citizen;
import com.example.entity.VaccineCenter;

@Service
public class CitizenService {
	
	@Autowired
	CitizenRepo repo;
	public Citizen insertCitizen(Citizen c)
	{
		return repo.save(c);
	}
	
	public List<Citizen> getallCitizens(){
		return repo.findAll();
	}
	
	public Optional<Citizen> getbyid(int id)
	{
		return repo.findById(id);
	}
	
	public String deleteCitizenById(int id)
	{
		repo.deleteById(id);
		return "success";
	}
	
	public List<Citizen> getCitizensByCenterName(VaccineCenter vc)
	{
		return repo.getCitizensofACenter(vc);
	}
	
	@Transactional
	public void deleteallCitizensofAnCenter(VaccineCenter center)
	{
		repo.deleteAllCitizensofAnCenter(center);
	}

}
