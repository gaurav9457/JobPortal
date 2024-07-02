package com.jobPortal.Helper;

import java.util.List;








import com.jobPortal.AjaxHandler.AjaxHandler;
import com.jobPortal.Dao.CommonDao;
import com.jobPortal.Impl.Implementation;
import com.jobPortal.beans.Company;
import com.jobPortal.beans.PostJob;
import com.jobPortal.beans.UserRegister;


public class CommonHelper {

	public int registerUser(UserRegister userRegister) {
		System.out.println("inside helper");
		return Implementation.registerUser(userRegister);
	}

	

	public int registerCompany(Company company) {
		System.out.println("Inside helper");
		return Implementation.registerCompany(company);
	}



	public int addJob(PostJob pJob) {
		System.out.println("Iside helper");
		return Implementation.addJob(pJob);
	}



	public static List<PostJob> getPostedJobs(int userId) {
		List<PostJob> jobs=null;
		System.out.println("Helper bean");
		jobs=CommonDao.getPostedCars(userId);
		return jobs;
	}



/*	public static String applyJob(int cId, int uId) {
		AjaxHandler handler=new AjaxHandler();
		if (cId<=0) {
			System.out.println("Inside helper If cid");
			return null;
		}
		if(uId<=0){
			System.out.println("Inside helper If uid");
			return null;
		}else {
			System.out.println("Inside helper else");
           return handler.appliedJob(cId,uId);
		}
		
		
	}*/



	public static String applyJob(Long cIdLong, Long uIdLong) {
		AjaxHandler handler=new AjaxHandler();
		if (cIdLong<=0) {
			System.out.println("Inside helper If cid");
			return null;
		}
		if(uIdLong<=0){
			System.out.println("Inside helper If uid");
			return null;
		}else {
			System.out.println("Inside helper else");
           return handler.appliedJob(cIdLong,uIdLong);
		}
	}



	public int userInactive(Long userId) {
		
		return Implementation.userInactive(userId);
	}



	public int contactUser(Long userId,Long jobId) {
		
		return Implementation.contactUser(userId,jobId);
	}



	public boolean updateUser(UserRegister uRegister) {
		/*if (userId.equals("")) {
			System.out.println("line 77 in helpler");
			return false;
		}
		if (fName.equals("")) {
			System.out.println("line 77 in helpler");
			return false;
		}
		if (lName.equals("")) {
			System.out.println("line 77 in helpler");
			return false;
		}
		if (skills.equals("")) {
			System.out.println("line 77 in helpler");
			return false;
		}*/
		 
		 System.out.println("Inside common helper");
		
		return Implementation.UpadteUser(uRegister);
	}



	public boolean forgetPassword(String emailString, String passwordString,
			String userType) {
		int status=0;
		status=CommonDao.forgotPassword(emailString,passwordString,userType);
		if(status==1){
			return true;
		}
		else{
		return false;
		}
	}



	public int jobInactive(Long jobId) {
		
		return Implementation.jobInactive(jobId);
	}



	public int companyInactive(Long companyId) {
		
		return Implementation.companyInactive(companyId);
	}



	public static String contactUserByCompany(Long userId, Long companyId) {
		
		AjaxHandler handler=new AjaxHandler();
		if (userId<=0) {
			System.out.println("Inside helper If cid");
			return null;
		}
		if(companyId<=0){
			System.out.println("Inside helper If uid");
			return null;
		}
		else {
			System.out.println("Inside helper else");
           return handler.contactUserByCompany(userId,companyId);
		}
	}

	

	

}
