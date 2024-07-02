package com.jobPortal.AjaxHandler;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;







import com.jobPortal.Dao.CommonDao;
import com.jobPortal.beans.AdminTable;
import com.jobPortal.beans.AppliedJob;
import com.jobPortal.beans.Company;
import com.jobPortal.beans.PostJob;
import com.jobPortal.beans.UserRegister;




public class AjaxHandler {

	public static void loginUser(UserRegister uRegister,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Ajax Handler");
		String userName=uRegister.getEmailId();
		String password=uRegister.getPassword();
		HttpSession session=request.getSession();
		
		UserRegister success=CommonDao.loginUser(userName,password);
		if (success!=null) {
			  boolean isActive = CommonDao.isUserActive(userName);
			  if (isActive) {
				session.setAttribute("loginUser", success);
				session.setAttribute("loginUserName", userName);
				session.setAttribute("loginUserId", success.getUserId());
				response.setStatus(200);
	            try {
					response.getWriter().write("{\"status\": \"success\", \"message\": \"Logging in ...\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			  else {
	            System.out.println("AjaxHandler inactive user");
	            response.setStatus(401);
	            try {
					response.getWriter().write("{\"status\": \"error\", \"message\": \"Inactive user\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
	        }
	    } else {
	        System.out.println("AjaxHandler false");
	        response.setStatus(401);
	        try {
				response.getWriter().write("{\"status\": \"error\", \"message\": \"User Not Found. Check email id and password\"}");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	    }
		
	}

	public static void loginAdmin(AdminTable lBean, HttpServletRequest request,
			HttpServletResponse response) {
		
		System.out.println("Ajax Handler");
		String userName=lBean.getEmailId();
		String password=lBean.getPassword();
		HttpSession session=request.getSession();
		
		AdminTable success=CommonDao.loginAdmin(userName,password);
		if (success!=null) {
			  boolean isActive = CommonDao.isUserActive(userName);
			  
				session.setAttribute("loginAdmin", success);
				session.setAttribute("loginUserName", userName);
				session.setAttribute("loginUserId", success.getAdminId());
				response.setStatus(200);
	            try {
					response.getWriter().write("{\"status\": \"success\", \"message\": \"Logging in ...\"}");
					
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			
			 
	    } else {
	        System.out.println("AjaxHandler false");
	        response.setStatus(401);
	        try {
				response.getWriter().write("{\"status\": \"error\", \"message\": \"User Not Found. Check email id and password\"}");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	    }
		
	}

	public static void loginCompany(Company company,
			HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("Ajax Handler Enter");
		String userName=company.getCompanyEmail();
		String password=company.getCompanyPassword();
		HttpSession session=request.getSession();
		
		Company success=CommonDao.loginCompany(userName,password);
		if (success!=null) {
			  boolean isActive = CommonDao.isCompanyActive(userName);
			  List<Map<String, String>> appliedJobDetails = CommonDao.getAppliedJobDetails();
				
	            if (isActive) {
	            	session.setAttribute("loginCompany", success);
					session.setAttribute("loginUserName", userName);
					session.setAttribute("CompanyUserId", success.getCompanyId());
					session.setAttribute("AllAppliedJobAdmin", appliedJobDetails);
					response.setStatus(200);
		            try {
						response.getWriter().write("{\"status\": \"success\", \"message\": \"Logging in ...\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				}
				  else {
		            System.out.println("AjaxHandler inactive user");
		            response.setStatus(401);
		            try {
						response.getWriter().write("{\"status\": \"error\", \"message\": \"Inactive Company\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
		        }
			
			 
	    } else {
	        System.out.println("AjaxHandler false");
	        response.setStatus(401);
	        try {
				response.getWriter().write("{\"status\": \"error\", \"message\": \"Recruiter Not Found. Check email id and password\"}");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
	    }
	}

	public String appliedJob(Long cIdLong, Long uIdLong) {
		String resultString=null;
		try{
			System.out.println("Ajax enter");
			resultString=CommonDao.appliedJob(cIdLong, uIdLong);
			System.out.println("Ajax handler "+resultString);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultString;
	}

	public static void getJobByLocation(HttpServletResponse response,
			HttpServletRequest request) {
		 String location=request.getParameter("location");
	     System.out.println("Location "+location);
		 List<PostJob> cList= CommonDao.getJobByLocation(location);
		if(cList!=null){
			HttpSession session=request.getSession();
			response.setStatus(200);
			session.setAttribute("searchedJobState", cList);
			System.out.println("clist"+cList);
			//System.out.println(request.);
			try {
				response.getWriter().write(cList.toString());
				//response.sendRedirect("index.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		else {
        	System.out.println("AjaxHandler false");
        	response.setStatus(401);
        	 //response.setContentType("application/json");
        	    try {
					response.getWriter().write("{\"status\": \"error\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
        }
		
		
	}

	public static void getJobByName(HttpServletResponse response,
			HttpServletRequest request) {
		 String brand=request.getParameter("brand");
	     System.out.println("Location "+brand);
		 List<PostJob> cList= CommonDao.getJobByName(brand);
		if(cList!=null){
			HttpSession session=request.getSession();
			response.setStatus(200);
			session.setAttribute("searchedJobByName", cList);
			System.out.println("clist"+cList);
			//System.out.println(request.);
			try {
				response.getWriter().write(cList.toString());
				response.sendRedirect("index.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		else {
        	System.out.println("AjaxHandler false");
        	response.setStatus(401);
        	 //response.setContentType("application/json");
        	    try {
					response.getWriter().write("{\"status\": \"error\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
        }
		
		
	}

	public static void getAllUser(HttpServletResponse response,
			HttpServletRequest request) {
		
			 //String brand=request.getParameter("brand");
		     //System.out.println("Location "+brand);
			 List<UserRegister> cList= CommonDao.getAllUser();
			if(cList!=null){
				HttpSession session=request.getSession();
				response.setStatus(200);
				session.setAttribute("AllRegisterUser", cList);
				System.out.println("clist"+cList);
				//System.out.println(request.);
				try {
					response.getWriter().write(cList.toString());
					response.sendRedirect("viewAllUserTable.jsp");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else {
	        	System.out.println("AjaxHandler false");
	        	response.setStatus(401);
	        	 //response.setContentType("application/json");
	        	    try {
						response.getWriter().write("{\"status\": \"error\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
	        }
		
	}
	
	public static void getAllUserPage(HttpServletResponse response,
			HttpServletRequest request) {
		
			 //String brand=request.getParameter("brand");
		     //System.out.println("Location "+brand);
			 List<UserRegister> cList= CommonDao.getAllUser();
			if(cList!=null){
				HttpSession session=request.getSession();
				response.setStatus(200);
				session.setAttribute("AllRegisterUserPage", cList);
				System.out.println("clist"+cList);
				//System.out.println(request.);
				try {
					response.getWriter().write(cList.toString());
					response.sendRedirect("ViewAllUserPage.jsp");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else {
	        	System.out.println("AjaxHandler false");
	        	response.setStatus(401);
	        	 //response.setContentType("application/json");
	        	    try {
						response.getWriter().write("{\"status\": \"error\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
	        }
		
	}

	public static void getAllCompany(HttpServletResponse response,
			HttpServletRequest request) {
		
		 List<Company> cList= CommonDao.getAllCompany();
			if(cList!=null){
				HttpSession session=request.getSession();
				response.setStatus(200);
				session.setAttribute("AllRegisterCompany", cList);
				System.out.println("clist"+cList);
				//System.out.println(request.);
				try {
					response.getWriter().write(cList.toString());
					response.sendRedirect("viewAllCompany.jsp");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			}
			else {
	        	System.out.println("AjaxHandler false");
	        	response.setStatus(401);
	        	 //response.setContentType("application/json");
	        	    try {
						response.getWriter().write("{\"status\": \"error\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
	        }
		
	}

	public static void getJobByExp(HttpServletResponse response,
			HttpServletRequest request) {
		
		Integer location=Integer.parseInt(request.getParameter("location"));
	     System.out.println("Location "+location);
		 List<PostJob> cList= CommonDao.getJobExp(location);
		if(cList!=null){
			HttpSession session=request.getSession();
			response.setStatus(200);
			session.setAttribute("searchedJobByExp", cList);
			System.out.println("Exp"+cList);
			//System.out.println(request.);
			try {
				
				StringBuilder jsonString=new StringBuilder();
				jsonString.append("[");
				
				for (int i = 0; i < cList.size(); i++) {
					PostJob jobS=cList.get(i);
					
					jsonString.append("{");
					jsonString.append("\"jobId\": \"" + jobS.getJobId() + "\",");
					jsonString.append("\"companyName\": \"" + jobS.getCompanyName() + "\",");
					jsonString.append("\"aboutCompany\": \"" + jobS.getAboutCompany() + "\",");
					jsonString.append("\"role\": \"" + jobS.getRole() + "\",");
					jsonString.append("\"jobPackage\": \"" + jobS.getJobPackage() + "\",");
					jsonString.append("\"companyLogo\": \"" + jobS.getCompany().getCompanyLogo() + "\"");
					
					jsonString.append("}");
				        
				        if (i < cList.size() - 1) {
				        	jsonString.append(",");
				        }
				    }
				    
				jsonString.append("]");
				System.out.println("jsonResponse "+jsonString.toString());
				
				response.getWriter().write(jsonString.toString());
			} catch (Exception e) {
				
				e.printStackTrace();
			}
		}
		else {
       	System.out.println("AjaxHandler false");
       	response.setStatus(401);
       	 //response.setContentType("application/json");
       	    try {
					response.getWriter().write("{\"status\": \"error\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
       }
	}

	public static void getJobBySkills(HttpServletResponse response,
			HttpServletRequest request) {
	    String skill= request.getParameter("skills").toString();
	    System.out.println("SkillName Ajax "+skill);
		 List<PostJob> cList= CommonDao.getJobSkills(skill);
		 if(cList!=null){
				HttpSession session=request.getSession();
				response.setStatus(200);
				session.setAttribute("searchedJobBySkills ", cList);
				System.out.println("Skills o/p"+cList);
				
				try {
					
					StringBuilder jsonString=new StringBuilder();
					jsonString.append("[");
					
					for (int i = 0; i < cList.size(); i++) {
						PostJob jobS=cList.get(i);
						
						jsonString.append("{");
						jsonString.append("\"jobId\": \"" + jobS.getJobId() + "\",");
						jsonString.append("\"companyName\": \"" + jobS.getCompanyName() + "\",");
						jsonString.append("\"aboutCompany\": \"" + jobS.getAboutCompany() + "\",");
						jsonString.append("\"role\": \"" + jobS.getRole() + "\",");
						jsonString.append("\"jobPackage\": \"" + jobS.getJobPackage() + "\",");
						jsonString.append("\"companyLogo\": \"" + jobS.getCompany().getCompanyLogo() + "\"");
						
						jsonString.append("}");
					        
					        if (i < cList.size() - 1) {
					        	jsonString.append(",");
					        }
					    }
					    
					jsonString.append("]");
					System.out.println("jsonResponse "+jsonString.toString());
					
					response.getWriter().write(jsonString.toString());
				} catch (Exception e) {
					
					e.printStackTrace();
				}
			}
			else {
	       	System.out.println("AjaxHandler false");
	       	response.setStatus(401);
	       	 //response.setContentType("application/json");
	       	    try {
						response.getWriter().write("{\"status\": \"error\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}
	       }
	
	
		
	}

	public static void getAllApplications(HttpServletResponse response,
			HttpServletRequest request) {
		// List<AppliedJob> cList= CommonDao.getAllApplications();
		List<Map<String, String>> appliedJobDetails = CommonDao.getAppliedJobDetails();
		
		System.out.println("Map applied jOb Details Ajax handler "+appliedJobDetails);
		
		if(appliedJobDetails!=null){
			HttpSession session=request.getSession();
			response.setStatus(200);
			session.setAttribute("AllAppliedJobAdmin", appliedJobDetails);
			System.out.println("appliedJobDetails "+appliedJobDetails);
			//System.out.println(request.);
			try {
				response.getWriter().write(appliedJobDetails.toString());
				response.sendRedirect("viewAppliedJobAdmin.jsp");
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		else {
        	System.out.println("AjaxHandler false");
        	response.setStatus(401);
        	 //response.setContentType("application/json");
        	    try {
					response.getWriter().write("{\"status\": \"error\"}");
				} catch (IOException e) {
					
					e.printStackTrace();
				}
        }
		
		
	}

	public String contactUserByCompany(Long userId, Long companyId) {
		
		String resultString=null;
		try{
			System.out.println("Ajax enter");
			resultString=CommonDao.contactUserByCompany(userId, companyId);
			System.out.println("Ajax handler "+resultString);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return resultString;
	}

}
