package com.jobPortal.ActionBean;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;












import org.hibernate.Session;

import com.jobPortal.AjaxHandler.AjaxHandler;
import com.jobPortal.Dao.CommonDao;
import com.jobPortal.Helper.CommonHelper;
import com.jobPortal.Impl.Implementation;
import com.jobPortal.beans.AdminTable;
import com.jobPortal.beans.AppliedJob;
import com.jobPortal.beans.Company;
import com.jobPortal.beans.PostJob;
import com.jobPortal.beans.UserRegister;

/**
 * Servlet implementation class CommonActionBean
 */
public class CommonActionBean extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommonActionBean() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	public static void registerUser(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("Inside Action Bean");
		
		UserRegister userRegister=new UserRegister();
		userRegister.setFirstName(request.getParameter("firstname"));
		userRegister.setLastName(request.getParameter("lastname"));
		userRegister.setMobileNo(request.getParameter("mobileNo"));
		userRegister.setEmailId(request.getParameter("email"));
		userRegister.setPassword(request.getParameter("password"));
		userRegister.setSkills(request.getParameter("Skills"));
		userRegister.setEducation(request.getParameter("Education"));
		userRegister.setState(request.getParameter("state"));
		userRegister.setCity(request.getParameter("city"));
		userRegister.setIsActive("Y");
		userRegister.setCreatedBy("User");
		
		Date date = new Date();
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MMM-dd");
		String dateString = formatdate.format(date);
		
		userRegister.setCreatedDate(dateString);
		userRegister.setModifiedBy(null);
		userRegister.setModifiedDate(null);
		
		CommonHelper helper=new CommonHelper();
		int result=helper.registerUser(userRegister);
		if (result==1) {
			response.setStatus(200);
			 request.setAttribute("successMessage", "User successfully registered!");
		} 
		else if(result== -1){
			request.setAttribute("EmailError", "Error: Unable to register user. Email id already exists;");
			
		}else {
			response.setStatus(400);
			request.setAttribute("errorMessage", "Error: Unable to register user. Please try again later.");

		}
		try {
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (IOException | ServletException e) {
			
			e.printStackTrace();
		}
		System.out.println("Action bean end");
	}

	public static void getStateData(HttpServletRequest request,
			HttpServletResponse response) {
		int id=Integer.parseInt(request.getParameter("locationID"));
		List<String> statesList=null;
		
		HttpSession session = request.getSession();
		try{
			statesList=CommonDao.getStateData(id);
        session.setAttribute("getStates", statesList);
        response.setStatus(200);
        response.getWriter().write(statesList.toString());
		}
		catch(Exception e){
			try {
				response.getWriter().write("Error");
			} catch (IOException e1) {
			
				e1.printStackTrace();
			}
			System.out.println(e);
		}
		
	}

	public static void getCityData(HttpServletRequest request,
			HttpServletResponse response) {
		String state=request.getParameter("state");
		System.out.println("Action bean "+state);
      List<String> cityList=null;
		
		HttpSession session = request.getSession();
		try{
			cityList=CommonDao.getCityData(state);
       // session.setAttribute("getCities", cityList);
        response.setStatus(200);
        response.getWriter().write(cityList.toString());
		}
		catch(Exception e){
			try {
				response.getWriter().write("Error");
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			System.out.println(e);
		}
		
	}

	public static void loginUser(String emailString, String passwordString,
			HttpServletResponse response, HttpServletRequest request) {
		System.out.println("Inside action bean loginuser");
		UserRegister uRegister=new UserRegister();
		uRegister.setEmailId(emailString);
		uRegister.setPassword(passwordString);
		AjaxHandler.loginUser(uRegister,request,response);
		
	}

	public static void loginAdmin(String emailString, String passwordString,
			HttpServletResponse response, HttpServletRequest request) {
		System.out.println("Inside action bean loginAdmin");
		AdminTable lBean=new AdminTable();
		lBean.setEmailId(emailString);
		lBean.setPassword(passwordString);
		AjaxHandler.loginAdmin(lBean,request,response);
		
	}

	public static void logOutUser(HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session = request.getSession(false); 
		if (session != null) {
		    session.invalidate(); 
		}
		try {
			response.sendRedirect("index.jsp");
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
	}

	public static void registerCompany(HttpServletRequest request,
			HttpServletResponse response,Map<String, String>formdataMap) {
		
		Company company=new Company();
		/*company.setCompanyName(request.getParameter("company_name"));
		company.setCompanyEmail(request.getParameter("company_email"));
		company.setCompanyPassword(request.getParameter("company_password"));*/
		 company.setCompanyEmail(formdataMap.get("company_email"));
	     company.setCompanyName(formdataMap.get("company_name"));
	      company.setCompanyLogo(formdataMap.get("company_image"));
	        company.setCompanyPassword(formdataMap.get("company_password"));
		company.setIsActive("Y");
		company.setCreatedBy("company");
		
		Date date = new Date();
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MMM-dd");
		String dateString = formatdate.format(date);
		
		company.setCreatedDate(dateString);
		company.setModifiedBy(null);
		company.setModifiedDate(null);
		System.out.println("Inside Action bean");
		CommonHelper helper=new CommonHelper();
		int result=helper.registerCompany(company);
		if (result==1) {
			response.setStatus(200);
			 request.setAttribute("successMessage", "Company successfully registered!");
		} 
		else if(result== -1){
			request.setAttribute("EmailError", "Error: Unable to register Company. Email id already exists;");
			
		}else {
			response.setStatus(400);
			request.setAttribute("errorMessage", "Error: Unable to register Company. Please try again later.");

		}
		try {
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (IOException | ServletException e) {
			
			e.printStackTrace();
		}
		System.out.println("Action bean end");
		
	}

	public static void loginCompany(String emailString, String passwordString,
			HttpServletResponse response, HttpServletRequest request) {
		System.out.println("Inside action bean loginuser");
		Company company=new Company();
		company.setCompanyEmail(emailString);
		company.setCompanyPassword(passwordString);
		AjaxHandler.loginCompany(company,request,response);
		
	}

	public static void addJob(HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		PostJob pJob=new PostJob();
		pJob.setCompanyName(request.getParameter("company_name"));
		pJob.setRole(request.getParameter("job_role"));
		pJob.setJobPackage(Integer.parseInt(request.getParameter("price")));
		pJob.setLocationState(request.getParameter("Job_Location"));
		pJob.setNoOfOpenings(Integer.parseInt(request.getParameter("no_of_openings")));
		pJob.setRequiredEducation(request.getParameter("education_details"));
		pJob.setRequiredSkills(request.getParameter("keySkills"));
		pJob.setExperience(Integer.parseInt(request.getParameter("experience")));
		pJob.setJobDesc(request.getParameter("job_description"));
		pJob.setAboutCompany(request.getParameter("about_company"));
		pJob.setCompanyType(request.getParameter("company_type"));
		pJob.setCompany((Company)session.getAttribute("loginCompany"));
		
		pJob.setIsActive("Y");
		pJob.setCreatedBy(request.getParameter("companyId"));
		
		Date date = new Date();
		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MMM-dd");
		String dateString = formatdate.format(date);
		
		pJob.setCreatedDate(dateString);
		pJob.setModifiedBy(null);
		pJob.setModifiedDate(null);
		
		CommonHelper helper=new CommonHelper();
		int result=helper.addJob(pJob);
		if (result==1) {
			response.setStatus(200);
			 request.setAttribute("successMessage", "Job successfully registered!");
		} 
		else if(result== -1){
			request.setAttribute("EmailError", "Error: Unable to register Job.");
			
		}else {
			response.setStatus(400);
			request.setAttribute("errorMessage", "Error: Unable to register Job. Please try again later.");

		}
		try {
			//response.sendRedirect("index.jsp");
			request.getRequestDispatcher("CompanyPage.jsp").forward(request, response);
		} catch (IOException | ServletException e) {
			
			e.printStackTrace();
		}
		System.out.println("Action bean end");
	}

	public static void getPostedJob(HttpServletRequest request,
			HttpServletResponse response) {
		int userId=Integer.parseInt(request.getParameter("companyId"));
		List<PostJob> jobs=null;
		System.out.println("Action bean");
		HttpSession session=request.getSession();
		try{
			jobs=CommonHelper.getPostedJobs(userId);
			System.out.println("Action bean carList "+jobs);
        session.setAttribute("getPostedJobs", jobs);
        response.setStatus(200);
        response.getWriter().write(jobs.toString());
		}
		catch(Exception e){
			try {
				response.getWriter().write("Error");
			} catch (IOException e1) {
				
				e1.printStackTrace();
			}
			System.out.println(e);
		}
		System.out.println("Action bean end");
		
	}
	
	public static void getAllJobs(HttpServletRequest request, HttpServletResponse response){
		List<PostJob> jobs = Implementation.getAllJobs();

		    if (jobs != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("AllJobs", jobs);

		        try {
		        	System.out.println("Job list"+jobs);
		           
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            
		        }
		    } else {
		        
		       System.out.println("Else block");
		    }
	}

	public static void applyJob(HttpServletRequest request,
			HttpServletResponse response) {
		int cId=Integer.parseInt(request.getParameter("companyId"));
		System.out.println("inside Action method");
		HttpSession session =request.getSession();
		String status="";
		int uId=0;
		if(session.getAttribute("loginUserId")==null){
			response.setStatus(404);
			status="NotFound";
			try {
				response.getWriter().write(status);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			return;
		}
		else{
			uId=Integer.parseInt(session.getAttribute("loginUserId").toString());
		}
		Long uIdLong = Long.valueOf(uId);
		Long cIdLong = Long.valueOf(cId);
		
		try{
			status=CommonHelper.applyJob(cIdLong,uIdLong);
			System.out.println("Action try");
			if(status!=null){
				System.out.println("Action if");
				response.setStatus(200);
				session.setAttribute("AppliedJob", status);
				response.getWriter().write(status);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("inside Action method last");
		
	}
	
	public static String checkJobStatus(Long jId,Long uId){
		String status = null;
		try{
			status=Implementation.checkJobStatus(jId,uId);
			if (status != null) {
				
				return status;
			}
			else{
				return status;
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		return status;
	}

	public static void viewAppliedJob(HttpServletRequest request,
			HttpServletResponse response) {
		Long idLong=Long.parseLong(request.getParameter("userId"));
		System.out.println("inside action bean");
		List<PostJob> jobs = Implementation.viewAppliedJob(idLong);

	    if (jobs != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("viewAppliedJob", jobs);

	        try {
	        	System.out.println("Applied Job list"+jobs);
	          // response.getWriter().write("{\"status\": \"success\", \"message\": \"Applied Job\"}");
	        	 response.getWriter().write(jobs.toString());
	             //response.sendRedirect("ViewAppliedJob.jsp");
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            try {
					response.getWriter().write("Error While geting Applied job");
				} catch (IOException e1) {
					
					e1.printStackTrace();
				}
	        }
	    } else {
	        
	       System.out.println("Else block");
	    }
	}

	public static void getJobByLocation(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getJobByLocation(response,request);
		
	}

	public static void getJobByName(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getJobByName(response,request);
		
	}

	public static void getAllUser(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getAllUser(response,request);
		
	}
	
	public static void getAllUserPage(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getAllUserPage(response,request);
		
	}
	

	public static void userInactive(HttpServletRequest request,
			HttpServletResponse response) {
		
		int userIdInt=Integer.parseInt(request.getParameter("userId"));
		Long userId = Long.valueOf(userIdInt);
		CommonHelper helper=new CommonHelper();
		int status=helper.userInactive(userId);
		if(status == 1){
			try {
				response.getWriter().write("{\"status\": \"success\"}");
			} catch (IOException e1) {
			   e1.printStackTrace();
			   
			}
			RequestDispatcher rDispatcher = request.getRequestDispatcher("index.jsp");
			try {
				rDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
		}
	}

	public static void getAllCompany(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getAllCompany(response,request);
		
	}
	public static void getAllCompanyView(HttpServletRequest request,
			HttpServletResponse response) {
		 List<Company> cList= CommonDao.getAllCompanyActive();
			if(cList!=null){
				HttpSession session=request.getSession();
				response.setStatus(200);
				session.setAttribute("AllRegisterCompanyView", cList);
				
			}
			else {
	        	System.out.println("AjaxHandler false");
	        	/*response.setStatus(401);
	        	 //response.setContentType("application/json");
	        	    try {
						response.getWriter().write("{\"status\": \"error\"}");
					} catch (IOException e) {
						
						e.printStackTrace();
					}*/
	        }
		
		
	}
	
	

	public static void viewAppliedUsers(HttpServletRequest request,
			HttpServletResponse response) {
		Long idLong=Long.parseLong(request.getParameter("jobId"));
		System.out.println("inside action bean");
		List<UserRegister> jobs = Implementation.viewAppliedUsers(idLong);
		 if (jobs != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("viewAppliedUsers", jobs);

		        try {
		        	System.out.println("Applied User list"+jobs);
		          // response.getWriter().write("{\"status\": \"success\", \"message\": \"Applied Job\"}");
		        	 response.getWriter().write(jobs.toString());
		             //response.sendRedirect("ViewAppliedJob.jsp");
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            try {
						response.getWriter().write("Error While geting Applied user");
					} catch (IOException e1) {
						
						e1.printStackTrace();
					}
		        }
		    } else {
		        
		       System.out.println("Else block");
		    }
	}

	public static void contactUser(HttpServletRequest request,
			HttpServletResponse response) {
		
		int userIdInt=Integer.parseInt(request.getParameter("userId"));
		int jobIdInt=Integer.parseInt(request.getParameter("jobId"));
		
		Long userId = Long.valueOf(userIdInt);
		Long jobId = Long.valueOf(jobIdInt);
		
		CommonHelper helper=new CommonHelper();
		int status=helper.contactUser(userId,jobId);
		if(status == 1){
			try {
				response.getWriter().write("{\"status\": \"success\"}");
			} catch (IOException e1) {
			   e1.printStackTrace();
			   
			}
			RequestDispatcher rDispatcher = request.getRequestDispatcher("index.jsp");
			try {
				rDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
		}
	}

	public static void checkStatus(HttpServletRequest request,
			HttpServletResponse response) {
		
		int userIdInt=Integer.parseInt(request.getParameter("userId"));
		int jobIdInt=Integer.parseInt(request.getParameter("jobId"));
		
		Long userId = Long.valueOf(userIdInt);
		Long jobId = Long.valueOf(jobIdInt);
		
		AppliedJob jobs = CommonDao.checkStatus(userId,jobId);
		 if (jobs != null) {
		        HttpSession session = request.getSession();
		        session.setAttribute("AppliedJobStatus", jobs);

		        try {
		        	System.out.println("Applied job status"+jobs);
		          // response.getWriter().write("{\"status\": \"success\", \"message\": \"Applied Job\"}");
		        	 response.getWriter().write(jobs.toString());
		             //response.sendRedirect("ViewAppliedJob.jsp");
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		            try {
						response.getWriter().write("Error While geting Applied user");
					} catch (IOException e1) {
						
						e1.printStackTrace();
					}
		        }
		    } else {
		        
		       System.out.println("Else block");
		    }
		
		
	}

	public static HttpServletResponse updateUser(HttpServletRequest request,
			HttpServletResponse response,Map<String, String>formdataMap) {
		
		String ststString="";
		CommonHelper helper=new CommonHelper();
		System.out.println("Form Data Map "+formdataMap);
		
		String userIdStr = formdataMap.get("userId");
		long userId = Long.parseLong(userIdStr);
		
		String action = formdataMap.get("action");
		String firstName = formdataMap.get("firstname");
		String lastName = formdataMap.get("lastname");
		String addressArea = formdataMap.get("addressArea");
		String resumeFile = formdataMap.get("resume");
		
		UserRegister userRegister=new UserRegister();
		userRegister.setFirstName(firstName);
		userRegister.setLastName(lastName);
		userRegister.setUserId(userId);
		userRegister.setSkills(addressArea);
		userRegister.setResumeFile(resumeFile);
		
		if(helper.updateUser(userRegister)){
			HttpSession session=request.getSession();
			session.setAttribute("UpdatedFirstname", firstName);
			session.setAttribute("UpdatedLastname", lastName);			
			session.setAttribute("UpdatedSkills", addressArea);
		    session.setAttribute("updatedResume",resumeFile );
			ststString=" Profile Updated!! ";
			
			 
		} else {
			response.setStatus(400);
			ststString=" Error: Unable to update user. Please try again later.";
		

		}
		
        try {
        	response.sendRedirect("ViewUser.jsp?status="+ststString);
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
        System.out.println(" Last Inside update User");
		return response;
		
	}

	public static void getJobByExp(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getJobByExp(response,request);
		
	}

	public static void forgotPassword(String emailString,
			String passwordString, HttpServletResponse response,
			HttpServletRequest request, String userType) {
		
		HttpSession session=request.getSession();
		CommonHelper helper=new CommonHelper();
		if(helper.forgetPassword(emailString,passwordString,userType)){
			response.setStatus(200);
			request.setAttribute("isPasswordChanged","Password Updated Successfully" );
			
		}
		else{
			response.setStatus(404);
			request.setAttribute("isPasswordChanged","Password Not Updated,Email NotExists" );
		}
		try {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (IOException | ServletException e) {
			
			e.printStackTrace();
		}
	}

	public static void jobInactive(HttpServletRequest request,
			HttpServletResponse response) {
		int userIdInt=Integer.parseInt(request.getParameter("jobId"));
		Long jobId = Long.valueOf(userIdInt);
		CommonHelper helper=new CommonHelper();
		int status=helper.jobInactive(jobId);
		if(status == 1){
			try {
				response.getWriter().write("{\"status\": \"success\"}");
			} catch (IOException e1) {
			   e1.printStackTrace();
			   
			}
			RequestDispatcher rDispatcher = request.getRequestDispatcher("index.jsp");
			try {
				rDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
		}
		
	}

	public static void getJobBySkills(HttpServletRequest request,
			HttpServletResponse response) {
		AjaxHandler.getJobBySkills(response,request);
		
	}

	public static void getAllApplications(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("get all applictn action bean ");
		AjaxHandler.getAllApplications(response,request);
		
	}

	public static void companyInactive(HttpServletRequest request,
			HttpServletResponse response) {
		
		int userIdInt=Integer.parseInt(request.getParameter("companyId"));
		Long companyId = Long.valueOf(userIdInt);
		CommonHelper helper=new CommonHelper();
		int status=helper.companyInactive(companyId);
		if(status == 1){
			try {
				response.getWriter().write("{\"status\": \"success\"}");
			} catch (IOException e1) {
			   e1.printStackTrace();
			   
			}
			RequestDispatcher rDispatcher = request.getRequestDispatcher("index.jsp");
			try {
				rDispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				
				e.printStackTrace();
			}
		}
	}

	public static void contactUserByCompany(HttpServletRequest request,
			HttpServletResponse response) {
		
		//int companyIdInt=Integer.parseInt(request.getParameter("companyId"));
		int userIdInt=Integer.parseInt(request.getParameter("userId"));
		
		Long userId = Long.valueOf(userIdInt);
		
		System.out.println("inside Action method");
		HttpSession session =request.getSession();
		String status="";
		int cId=0;
		if(session.getAttribute("CompanyUserId")==null){
			response.setStatus(404);
			status="NotFound";
			try {
				response.getWriter().write(status);
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			return;
		}
		else{
			cId=Integer.parseInt(session.getAttribute("CompanyUserId").toString());
		}
		//Long uIdLong = Long.valueOf(uId);
		Long companyId = Long.valueOf(cId);
		
		try{
			status=CommonHelper.contactUserByCompany(userId,companyId);
			System.out.println("Action try");
			if(status!=null){
				System.out.println("Action if");
				response.setStatus(200);
				//session.setAttribute("", status);
				response.getWriter().write(status);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("inside Action method last");
		
	}

	public static void viewCompanyContacted(HttpServletRequest request,
			HttpServletResponse response) {
		Long idLong=Long.parseLong(request.getParameter("userId"));
		System.out.println("inside action bean view Company Contacted");
		List<Company> companies = Implementation.viewCompanyContacted(idLong);

	    if (companies != null) {
	        HttpSession session = request.getSession();
	        session.setAttribute("viewCompanyContacted", companies);

	        try {
	        	System.out.println("view Company Contacted"+companies);
	          // response.getWriter().write("{\"status\": \"success\", \"message\": \"Applied Job\"}");
	        	 response.getWriter().write(companies.toString());
	             //response.sendRedirect("ViewAppliedJob.jsp");
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	            try {
					response.getWriter().write("Error While geting companies ");
				} catch (IOException e1) {
					
					e1.printStackTrace();
				}
	        }
	    } else {
	        
	       System.out.println("Else block");
	    }
		
	}
	

}
