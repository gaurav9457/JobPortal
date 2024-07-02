package com.jobPortal.Impl;



import java.util.List;

import com.jobPortal.Dao.CommonDao;
import com.jobPortal.beans.Company;
import com.jobPortal.beans.PostJob;
import com.jobPortal.beans.UserRegister;

public class Implementation {
	private static int status;
	public static int registerUser(UserRegister userRegister) {
		System.out.println("inside impl");
		status=CommonDao.registerUser(userRegister);
		
		if (status==1) {
			return 1;
		} 
		if (status== -1) {
			
			return -1;
		}else {
			return 0;
		}
		
	}
	public static int registerCompany(Company company) {
		System.out.println("inside impl");
		status=CommonDao.registerCompany(company);
		
		if (status==1) {
			return 1;
		} 
		if (status== -1) {
			
			return -1;
		}else {
			return 0;
		}
	}
	public static int addJob(PostJob pJob) {
		System.out.println("inside impl");
		status=CommonDao.addJob(pJob);
		
		if (status==1) {
			return 1;
		} 
		if (status== -1) {
			
			return -1;
		}else {
			return 0;
		}
	}
	public static List<PostJob> getAllJobs() {
		List<PostJob> jobs=CommonDao.getAllJobs();
		return jobs;
	}
	public static List<PostJob> viewAppliedJob(Long idLong) {
		List<PostJob> jobs=CommonDao.viewAppliedJob(idLong);
		return jobs;
	}
	public static int userInactive(Long userId) {
		status=CommonDao.userInactive(userId);
		return status;
		
	}
	public static List<UserRegister> viewAppliedUsers(Long idLong) {
		List<UserRegister> jobs=CommonDao.viewAppliedUsers(idLong);
		return jobs;
	}
	public static int contactUser(Long userId,Long jobId) {
		
		status=CommonDao.contactUser(userId,jobId);
		return status;
		
		
	}
	public static boolean UpadteUser(UserRegister uRegister) {
		System.out.println("Inside impl");
		status=CommonDao.UpdateUser(uRegister);
		if (status==1) {
			return true;
		} else {
			return false;
		}
	}
	public static int jobInactive(Long jobId) {
		
		status=CommonDao.jobInactive(jobId);
		return status;
	}
	public static int companyInactive(Long companyId) {
		status = CommonDao.companyInactive(companyId);
		return status;
	}
	public static String checkJobStatus(Long jId, Long uId) {
		String statusStr=CommonDao.checkJobStatus(jId,uId);
		return statusStr;
	}
	public static List<Company> viewCompanyContacted(Long idLong) {
		List<Company> companies=CommonDao.viewCompanyContacted(idLong);
		return companies;
	}
	
	
	

}
