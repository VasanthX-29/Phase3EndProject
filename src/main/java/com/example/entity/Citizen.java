package com.example.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Citizen {
	
	  @Id
	  @GeneratedValue
	  private int id;
	  private String name;
	  private String city;
	  private int doseCount;
	  private String vaccinationStatus;
	  
	  @OneToOne
	  VaccineCenter vc;

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getDoseCount() {
		return doseCount;
	}

	public void setDoseCount(int doseCount) {
		this.doseCount = doseCount;
	}

	public String getVaccinationStatus() {
		return vaccinationStatus;
	}

	public void setVaccinationStatus(String vaccinationStatus) {
		this.vaccinationStatus = vaccinationStatus;
	}

	public VaccineCenter getVc() {
		return vc;
	}

	public void setVc(VaccineCenter vc) {
		this.vc = vc;
	}
	  
	  
	  
	  
	  

}
