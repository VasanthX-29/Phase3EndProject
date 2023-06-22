package com.example.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.entity.*;

@Repository
public interface CenterRepo extends JpaRepository<VaccineCenter,Integer> {
	
	@Query("select vc from VaccineCenter vc where vc.name=?1")
	public VaccineCenter findbyName(String name);
	
	
	
	

}
