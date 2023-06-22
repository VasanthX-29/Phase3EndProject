package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.entity.User;
import com.example.entity.VaccineCenter;
import com.example.service.CenterService;
import com.example.service.UserService;



@Controller
public class UserController {

	@Autowired
	UserService service;
	

@RequestMapping("/")
public ModelAndView basepage(HttpServletRequest request,HttpServletResponse response) {
	ModelAndView mv=new ModelAndView();
	mv.setViewName("index.jsp");
	return mv;
}


@RequestMapping("/addUser")
	public ModelAndView insert(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv=new ModelAndView();
		User user=new User();
		user.setName(request.getParameter("uname"));
		user.setEmail(request.getParameter("uemail"));
	    user.setPassword(request.getParameter("upwd"));
		User u=service.saveUser(user);
		if(u!=null) {
			mv.setViewName("RegisterSuccessful.jsp");
		}
		else
		{
			mv.setViewName("Register.jsp");
		}
		return mv;
	}

@RequestMapping("/checkUser")
public ModelAndView checkUser(HttpServletRequest request,HttpServletResponse response) {
	ModelAndView mv=new ModelAndView();
	HttpSession session=request.getSession();
	User u=service.checkUser(request.getParameter("uemail"), request.getParameter("upwd"));
	if(u!=null) {
		session.setAttribute("email", u.getEmail());
		mv.setViewName("redirect:/vaccinationcenter");
	}
	else
	{
		mv.setViewName("LoginFail.jsp");
	}
	return mv;
}

/* @RequestMapping("/UpdatePassword")
public ModelAndView updatePwd(HttpServletRequest request,HttpServletResponse response) {
	ModelAndView mv=new ModelAndView();
	HttpSession session=request.getSession(false);
	String email=(String)session.getAttribute("email");
	int id=(int)session.getAttribute("uid");
	User u=service.updateUserPwd(request.getParameter("newpwd"),email,id );
	if(u!=null) {
		
		mv.setViewName("VaccineDashboard.jsp");
	}
	else
	{
		mv.setViewName("LoginFail.jsp");
	}
	return mv;
	
}*/




}




