package com.jobPortal.Dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.DocFlavor.STRING;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;


































import com.jobPortal.beans.AdminTable;
import com.jobPortal.beans.AppliedJob;
import com.jobPortal.beans.Company;
import com.jobPortal.beans.ContactUser;
import com.jobPortal.beans.PostJob;
import com.jobPortal.beans.UserAccount;
import com.jobPortal.beans.UserRegister;

public class CommonDao {
	 static SessionFactory factory; 
	 static Session session;
	 static Configuration cfg;
	 static  Transaction t;

	
	public static void openConnection(){
		cfg=new Configuration().configure("hibernate.cfg.xml");
		 factory = cfg.buildSessionFactory();
	}
	

	public static int registerUser(UserRegister userRegister) {
		
		System.out.println("Dao Enter");
		openConnection();
		
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
        t = session.beginTransaction();
        try {
            
            Query query = session.createQuery("FROM UserRegister WHERE emailId = :emailId");
            query.setParameter("emailId", userRegister.getEmailId());
            UserRegister existingUser = (UserRegister) query.uniqueResult();

            if (existingUser != null) {
                
                return -1;
            }
        
       
         UserAccount userAccount=new UserAccount();
         userAccount.setEmailId(userRegister.getEmailId());
         userAccount.setPassword(userRegister.getPassword());
         userAccount.setUserType("user");
         userAccount.setIsActive("Y");
         userAccount.setCreatedBy("user");
         userAccount.setCreatedDate(userRegister.getCreatedDate());
         userAccount.setModifiedBy(null);
         userAccount.setModifiedDate(null);
        
        	System.out.println("dao try");
            session.save(userAccount);
            userRegister.setUserAccount(userAccount);
            session.save(userRegister);
            
            return 1; 
        } catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return 0; 
        } finally {
        	t.commit(); 
            session.close(); 
        }
        
	}


	public static List<String> getStateData(int id) {
		 System.out.println("Dao Enter");
		    openConnection();
		    
		    factory = cfg.buildSessionFactory();
		    session = factory.openSession();
		    System.out.println("Inside Dao State");
		    t = session.beginTransaction();
		    List<String> statesList= new ArrayList<String>();
		    
		    try {
				Query query=session.createQuery("select distinct state.place from StateCityData state ,StateCityData where state.locationId=:n ");
				 query.setParameter("n", id);
				 
				 List<Object> results = query.list();
				 System.out.println("result "+results);
		            for (Object result : results) {
		                statesList.add((String) result); 
		            }
		            System.out.println("result List "+statesList);

		            t.commit();
		            System.out.println("State data retrieved successfully");
			} catch (Exception e) {
	            if (t != null) {
	                t.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }

	        return statesList;
	}


	public static List<String> getCityData(String state) {
		System.out.println("Dao Enter");
	    openConnection();
	    //session=null;
	    factory = cfg.buildSessionFactory();
	    session = factory.openSession();
	    System.out.println("Inside Dao city");
	    t = session.beginTransaction();
	    List<String> cityList= new ArrayList<String>();
	    try {
	       
	        Query getIdQuery = session.createQuery("select id from StateCityData where place = :state");
	        getIdQuery.setParameter("state", state);
	        Long cityIdLong = (Long) getIdQuery.uniqueResult();

	    
	     Integer cityId = cityIdLong != null ? cityIdLong.intValue() : null;
	     
	        System.out.println("Inside try City");
	        if (cityId != null) {
	           System.out.println("Inside if City");
	            Query getCityQuery = session.createQuery("select s.place " +
                        "from StateCityData s, StateCityData c " +
                        "where s.locationId = c.id " +
                        "and s.locationId = :cityId");
	            getCityQuery.setParameter("cityId", cityId);

	          System.out.println("Line 127");
	            List<String> results = getCityQuery.list();
	            cityList.addAll(results);
	            System.out.println("Cities retrieved successfully forrrrr state: " + state);
	        }

	        t.commit();
	        
	    } catch (Exception e) {
	    	System.out.println("City Not Found");
	        if (t != null) {
	            t.rollback();
	        }
	        e.printStackTrace();
	    } finally {
	    	if (session != null) {
	            session.close();
	        }
	       // session.close();
	       // factory.close();
	    }

	    return cityList;
	}


	public static UserRegister loginUser(String userName, String password) {
		 System.out.println("Dao Enter");
		    openConnection();
		    
		    factory = cfg.buildSessionFactory();
		    session = factory.openSession();
		    System.out.println("Inside Dao");
		    t = session.beginTransaction();
		    try {
		        Query query = session.createQuery("FROM UserRegister WHERE emailId = :u AND password = :p");
		        query.setParameter("u", userName);
		        query.setParameter("p", password);
		       
		        if (query.list().size() > 0) {
		        	UserRegister user=(UserRegister)query.uniqueResult();
		            return user; 
		        } else {
		            return null; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return null; 
		    } finally {
		        t.commit();
		        session.close(); 
		    }
	}


	public static boolean isUserActive(String userName) {
		System.out.println("Dao Enter");
	    openConnection();
	    
	    factory = cfg.buildSessionFactory();
	    session = factory.openSession();
	    System.out.println("Inside Dao is active");
	    t = session.beginTransaction();
	    try {
	        Query query = session.createQuery("SELECT isActive FROM UserRegister WHERE emailId = :u");
	        query.setParameter("u", userName);
	        String isActive = (String) query.uniqueResult();
	      
	        return isActive != null && isActive.equals("Y");
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        return false; 
	    } 
	    finally {
	        t.commit(); 
	        session.close(); 
	    }
	}


	public static AdminTable loginAdmin(String userName, String password) {
		 System.out.println("Dao Enter");
		    openConnection();
		    
		    factory = cfg.buildSessionFactory();
		    session = factory.openSession();
		    System.out.println("Inside Dao Admin");
		    t = session.beginTransaction();
		    try {
		        Query query = session.createQuery("FROM AdminTable WHERE emailId = :u AND password = :p");
		        query.setParameter("u", userName);
		        query.setParameter("p", password);
		       
		        if (query.list().size() > 0) {
		        	AdminTable user=(AdminTable)query.uniqueResult();
		            return user; 
		        } else {
		            return null; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return null; 
		    } finally {
		        t.commit();
		        session.close(); 
		    }
	}


	public static int registerCompany(Company company) {
		
		System.out.println("Dao Enter");
		openConnection();
		
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
        t = session.beginTransaction();
         UserAccount userAccount=new UserAccount();
         userAccount.setEmailId(company.getCompanyEmail());
         userAccount.setPassword(company.getCompanyPassword());
         userAccount.setUserType("company");
         userAccount.setIsActive("Y");
         userAccount.setCreatedBy("company");
         userAccount.setCreatedDate(company.getCreatedDate());
         userAccount.setModifiedBy(null);
         userAccount.setModifiedDate(null);
        try {
        	System.out.println("dao try");
            session.save(userAccount);
            company.setUserAccount(userAccount);
            session.save(company);
            t.commit(); 
            return 1; 
        } catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return 0; 
        } finally {
            session.close(); 
        }
	}


	public static Company loginCompany(String userName, String password) {
		 System.out.println("Dao Enter");
		    openConnection();
		    
		    factory = cfg.buildSessionFactory();
		    session = factory.openSession();
		    System.out.println("Inside Dao company");
		    t = session.beginTransaction();
		    try {
		        Query query = session.createQuery("FROM Company WHERE companyEmail = :u AND companyPassword = :p");
		        query.setParameter("u", userName);
		        query.setParameter("p", password);
		       
		        if (query.list().size() > 0) {
		        	Company recruiter=(Company)query.uniqueResult();
		            return recruiter; 
		        } else {
		            return null; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        return null; 
		    } finally {
		        t.commit();
		        session.close(); 
		    }
		
	}
	
	public static boolean isCompanyActive(String userName) {
		System.out.println("Dao Enter");
	    openConnection();
	    
	    factory = cfg.buildSessionFactory();
	    session = factory.openSession();
	    System.out.println("Inside Dao is active");
	    t = session.beginTransaction();
	    try {
	        Query query = session.createQuery("SELECT isActive FROM Company WHERE companyEmail = :u");
	        query.setParameter("u", userName);
	        String isActive = (String) query.uniqueResult();
	      
	        return isActive != null && isActive.equals("Y");
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        return false; 
	    } 
	    finally {
	        t.commit(); 
	        session.close(); 
	    }
	}


	public static int addJob(PostJob pJob) {
		System.out.println("Dao Enter");
		openConnection();
		
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
        t = session.beginTransaction();
        try {
        	System.out.println("dao try add Job");
            session.save(pJob);
          //  company.setUserAccount(userAccount);
            //session.save(company);
            //t.commit(); 
            return 1; 
        } catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return 0; 
        } finally {
        	t.commit();
            session.close(); 
        }
	}


	public static List<PostJob> getPostedCars(int userId) {
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs= new ArrayList<PostJob>();
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao getPostedJob");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From PostJob where createdBy= :c");
			 query.setParameter("c", userId+"");
			 List<Object> results=query.list();
			 for (Object object : results) {
				PostJob pJob= (PostJob) object;
				System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
				jobs.add(pJob);
				
			}
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
		return jobs;
	}


	public static List<PostJob> getAllJobs() {
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs= new ArrayList<PostJob>();
	
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao getAllJob");
       // t = session.beginTransaction();
		try{
			//Query query=session.createQuery("From PostJob where isActive= 'Y'");
			String hql="SELECT pj FROM PostJob pj " +
		             "JOIN pj.company c " +
		             "WHERE pj.isActive = 'Y' " +
		             "AND c.isActive = 'Y'";
			Query query= session.createQuery(hql);
			
			// query.setParameter("c", userId+"");
			 @SuppressWarnings("unchecked")
			List<Object> results=query.list();
			 for (Object object : results) {
				PostJob pJob= (PostJob) object;
				System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
				jobs.add(pJob);
			}
			// return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           // return null;
        } finally {
        //	t.commit();
            session.close(); 
        }
		return jobs;
	}


	public static String appliedJob(Long jobId, Long userId) {
		System.out.println("Dao Enter");
		openConnection();
		String setStatus="";
		
		 int status = 0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
       // t = session.beginTransaction();
        try {
        	System.out.println("inside try");
        	t = session.beginTransaction();
        	 AppliedJob appliedJob = (AppliedJob) session.createQuery("FROM AppliedJob WHERE userRegister.userId = :userId AND postJob.jobId = :jobId")
                     .setParameter("userId", userId)
                     .setParameter("jobId", jobId)
                     .uniqueResult();
        	 if (appliedJob == null) {
        		 System.out.println("inside if dao");
                 System.out.println("Daon if "+appliedJob);
                 appliedJob = new AppliedJob();
                 appliedJob.setStatus("Applied"); 
                 appliedJob.setIsActive("Y");
                 appliedJob.setCreatedBy(String.valueOf(userId)); 
                 
                 Date date = new Date();
         		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MMM-dd");
         		String dateString = formatdate.format(date);
         		
                 appliedJob.setCreatedDate(dateString);
                 appliedJob.setModifiedBy(null);
                 appliedJob.setModifiedDate(null);

                
                 PostJob postJob = (PostJob) session.load(PostJob.class, jobId);
                 appliedJob.setPostJob(postJob);

                 UserRegister userRegister = (UserRegister) session.load(UserRegister.class, userId);
                 appliedJob.setUserRegister(userRegister);

                 session.save(appliedJob);
                 setStatus = "liked";
             } else {
            	 System.out.println("inside else dao");
            	  
            	    if ("Contacted".equals(appliedJob.getStatus())) {
            	        appliedJob.setStatus("Contacted");
            	        setStatus = "contacted";
            	    } 
            	    else if("Removed".equals(appliedJob.getStatus())){
            	    	
            	    	 appliedJob.setStatus("Applied");
             	        appliedJob.setIsActive("Y"); 
             	        setStatus = "liked";
            	    	
            	    }else {
            	    	 System.out.println("inside else else");
            	        appliedJob.setStatus("Removed");
            	        appliedJob.setIsActive("N"); 
            	        setStatus = "unliked";
            	    }

            	    session.update(appliedJob);
            	}
                // session.update(appliedJob);
             

             t.commit();
         } catch (Exception e) {
             t.rollback(); 
             e.printStackTrace();
            // return null;
         } finally {
         	//t.commit();
             session.close(); 
         }

        /* if (status == 0) {
             setStatus = null;
         }*/
		return setStatus;
	}


	public static List<PostJob> viewAppliedJob(Long idLong) {
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao view Applied Job");
        t = session.beginTransaction();
        try{
        	String hql =  "SELECT j " +
                    "FROM PostJob j " +
                    "JOIN j.appliedJobs aj " +
                    "WHERE aj.userRegister.userId = :userId and aj.isActive= :y ";

                  Query query = session.createQuery(hql);
                  query.setParameter("userId", idLong);
                  query.setParameter("y", "Y");
                  jobs=query.list();
                  return jobs;
        }
        catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}


	public static List<PostJob> getJobByLocation(String location) {
		
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs= new ArrayList<PostJob>();
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao getAllJob");
       // t = session.beginTransaction();
		try{
			Query query=session.createQuery("From PostJob where locationState =:c and isActive='Y'");
			query.setParameter("c", location);
			 List<Object> results=query.list();
			 
			 for (Object object : results) {
				PostJob pJob= (PostJob) object;
				System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
				jobs.add(pJob);
			}
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        //	t.commit();
            session.close(); 
        }
		return jobs;
	}


	public static List<PostJob> getJobByName(String brand) {
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs= new ArrayList<PostJob>();
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao job by name");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From PostJob where companyName =:c and isActive ='Y'");
			query.setParameter("c", brand);
			 List<Object> results=query.list();
			 for (Object object : results) {
				PostJob pJob= (PostJob) object;
				System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
				jobs.add(pJob);
			}
			 return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}


	public static List<UserRegister> getAllUser() {
		System.out.println("Dao Enter");
		openConnection();
		List<UserRegister> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all User");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From UserRegister");
			//query.setParameter("c", brand);
			 jobs=query.list();
			 return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}


	public static int userInactive(Long userId) {
		System.out.println("Dao Enter");
		openConnection();
		//List<UserRegister> jobs=null;
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all User");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("update UserRegister set isActive = :is, modifiedBy = 'admin'  where userId = :userValue");
			query.setParameter("is", "N");
			query.setParameter("userValue", userId);
			   rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
		
	}


	public static List<Company> getAllCompany() {
		System.out.println("Dao Enter");
		openConnection();
		List<Company> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all company");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From Company");
			//query.setParameter("c", brand);
			 jobs=query.list();
			 return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}

	public static List<Company> getAllCompanyActive() {
		System.out.println("Dao Enter");
		openConnection();
		List<Company> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all company");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From Company where isActive = 'Y'");
			//query.setParameter("c", brand);
			 jobs=query.list();
			 return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}

	public static List<UserRegister> viewAppliedUsers(Long idLong) {
		
		System.out.println("Dao Enter");
		openConnection();
		List<UserRegister> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao view Applied Job");
        t = session.beginTransaction();
        try{
        	String hql =  "SELECT j " +
                    "FROM UserRegister j " +
                    "JOIN j.appliedJobs aj " +
                    "WHERE aj.postJob.jobId = :jobId and aj.isActive= :y ";

                  Query query = session.createQuery(hql);
                  query.setParameter("jobId", idLong);
                  query.setParameter("y", "Y");
                  jobs=query.list();
                  return jobs;
        }
       
        catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
		
	}


	public static int contactUser(Long userId,Long jobId) {
		
		System.out.println("Dao Enter contactUser");
		openConnection();
		//List<UserRegister> jobs=null;
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
		
        System.out.println("Inside Dao contactUser");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("update AppliedJob as aj set status= :is where aj.userRegister.userId = :userValue and aj.postJob.jobId = :jobId");
			query.setParameter("is", "Contacted");
			query.setParameter("userValue", userId);
			query.setParameter("jobId", jobId);
			   rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
		
	}


	public static AppliedJob checkStatus(Long userId, Long jobId) {
		 System.out.println("Dao Enter");
		    openConnection();
		    
		    factory = cfg.buildSessionFactory();
		    session = factory.openSession();
		    System.out.println("Inside Dao check status");
		    t = session.beginTransaction();
		    try {
		        Query query = session.createQuery("FROM AppliedJob aj WHERE  aj.userRegister.userId = :u AND aj.postJob.jobId = :p");
		        query.setParameter("u", userId);
		        query.setParameter("p", jobId);
		       
		        if (query.list().size() > 0) {
		        	AppliedJob user=(AppliedJob)query.uniqueResult();
		        	System.out.println("if statement "+user);
		            return user; 
		        } else {
		        	System.out.println("else statement ");
		            return null; 
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        System.out.println("catch statement");
		        return null; 
		    } finally {
		        t.commit();
		        session.close(); 
		    }
	}


	public static int UpdateUser(UserRegister uRegister) {
		
		System.out.println("Dao Enter contactUser");
		openConnection();
		String fName=uRegister.getFirstName();
		String lName=uRegister.getLastName();
		String skills=uRegister.getSkills();
		String resumeName=uRegister.getResumeFile();
		Long userId=uRegister.getUserId();
		
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
		
        System.out.println("Inside Dao Update user");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("update UserRegister as aj set firstName= :is, lastName= :ln,skills= :sk, resumeFile= :rf where userId = :us");
			query.setParameter("is", fName);
			query.setParameter("ln", lName);
			query.setParameter("sk", skills);
			query.setParameter("rf", resumeName);
			query.setParameter("us", userId);
			   rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
	}


	public static List<PostJob> getJobExp(Integer location) {
		System.out.println("Dao Enter");
		openConnection();
		List<PostJob> jobs= new ArrayList<PostJob>();
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao getAllJob");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("From PostJob where experience =:c and isActive ='Y'");
			query.setParameter("c", location);
			 List<Object> results=query.list();
			 
			 for (Object object : results) {
				PostJob pJob= (PostJob) object;
				System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
				jobs.add(pJob);
			}
			
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
		 return jobs;
	}


	public static int forgotPassword(String emailString, String passwordString,
			String userType) {
		System.out.println("Dao Enter Forgot password");
		openConnection();
		
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
		
        System.out.println("Inside Dao Forgot Password");
        t = session.beginTransaction();
		try{
			 Query query;
		        if ("Company".equals(userType)) {
		            
		            query = session.createQuery("update Company as c set c.companyPassword = :password  where c.companyEmail = :email");
		        } else {
		            
		            query = session.createQuery("update UserRegister as u set u.password = :password  where u.emailId = :email");
		        }

		        query.setParameter("password", passwordString);
		       // query.setParameter("modifiedBy", "user"); // Assuming "user" is the modifiedBy value
		        query.setParameter("email", emailString);
		        rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
	}


	public static int jobInactive(Long jobId) {
		
		System.out.println("Dao Enter");
		openConnection();
		//List<UserRegister> jobs=null;
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all User");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("update PostJob set isActive = :is, modifiedBy = 'company'  where jobId = :userValue");
			query.setParameter("is", "N");
			query.setParameter("userValue", jobId);
			   rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
	}


	public static List<PostJob> getJobSkills(String skill) {
		
		System.out.println("Dao Enter skills");
		openConnection();
		List<PostJob> jobs=new ArrayList<PostJob>();
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao skills");
        t = session.beginTransaction();
		try{
			/* Query query = session.createQuery("FROM PostJob WHERE lower(requiredSkills) = lower(:skill) AND isActive = 'Y'");
		        query.setParameter("skill", skill.toLowerCase()); */
			 Query query = session.createQuery("FROM PostJob WHERE lower(requiredSkills) LIKE lower(:skill) AND isActive = 'Y'");
		        query.setParameter("skill", "%" + skill.toLowerCase() + "%");
		        List<Object> results=query.list();
				 for (Object object : results) {
					PostJob pJob= (PostJob) object;
					System.out.println(pJob.getCompany().getCompanyLogo()+" logo");
					jobs.add(pJob);
				}
			 System.out.println("dao o/p "+jobs);
			 return jobs;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
	}


	public static List<Map<String, String>> getAppliedJobDetails() {
		openConnection();
		//List<UserRegister> jobs=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao all applictn");
        t = session.beginTransaction();
        try{
        	  String hql = "SELECT u.firstName, u.lastName, u.emailId, j.companyName, aj.status,  j.role, j.locationState, j.requiredEducation, j.jobId, u.userId " +
                      "FROM AppliedJob aj " +
                      "JOIN aj.userRegister u " +
                      "JOIN aj.postJob j "+
                      "where aj.isActive= 'Y'";

         Query query = session.createQuery(hql);
         List<Object[]> results = query.list();

         List<Map<String, String>> resultList = new ArrayList<>();

         for (Object[] result : results) {
        	  String firstName = (String) result[0];
        	    String lastName = (String) result[1];
        	    String emailId = (String) result[2];
        	    String companyName = (String) result[3];
        	    String status = (String) result[4];
        	    String role= (String) result[5];
        	    String location= (String) result[6];
        	    String education = (String) result[7];
        	    String jobId =  result[8].toString();
        	    String userId =  result[9].toString();
        	    
        	    Map<String, String> resultMap = new HashMap<>();
        	    resultMap.put("firstName", firstName);
        	    resultMap.put("lastName", lastName);
        	    resultMap.put("emailId", emailId);
        	    resultMap.put("companyName", companyName);
        	    resultMap.put("status", status);
        	    resultMap.put("role", role);
        	    resultMap.put("location", location);
        	    resultMap.put("education", education);
        	    resultMap.put("jobId", jobId);
        	    resultMap.put("userId", userId);
             
             resultList.add(resultMap);
         }
         System.out.println("outSide loop");

         return resultList;
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close(); 
        }
		
	}


	public static int companyInactive(Long companyId) {
		
		System.out.println("Dao Enter");
		openConnection();
		//List<UserRegister> jobs=null;
		int rowCount=0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao in active company");
        t = session.beginTransaction();
		try{
			Query query=session.createQuery("update Company set isActive = :is, modifiedBy = 'admin'  where companyId = :userValue");
			query.setParameter("is", "N");
			query.setParameter("userValue", companyId);
			   rowCount = query.executeUpdate();
		}
		catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           
        } finally {
        	t.commit();
            session.close(); 
        }
		 return rowCount;
	}


	public static String checkJobStatus(Long jId, Long uId) {
		System.out.println("Dao Enter");
		openConnection();
		String setStatus="";
		
		 int status = 0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
       // t = session.beginTransaction();
        try {
        	System.out.println("inside try");
        	t = session.beginTransaction();
        	 AppliedJob checkappliedJob = (AppliedJob) session.createQuery("FROM AppliedJob WHERE userRegister.userId = :userId AND postJob.jobId = :jobId")
                     .setParameter("userId", uId)
                     .setParameter("jobId", jId)
                     .uniqueResult();
        	 
        	 if(checkappliedJob == null){
        		 setStatus="Empty";
        	 }
        	 else {
        	     if("Applied".equals(checkappliedJob.getStatus())){
        		     setStatus="Applied";
        		      //return setStatus;
        	       }
        	     else if("Contacted".equals(checkappliedJob.getStatus())){
        		       setStatus="Contacted";
        	       }
        	 }
        	
        }
        catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
           // return null;
        } finally {
        	t.commit();
            session.close(); 
        }
        return setStatus;
	}


	public static String contactUserByCompany(Long userId, Long companyId) {
		
		System.out.println("Dao Enter");
		openConnection();
		String setStatus="";
		
		 int status = 0;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao");
       // t = session.beginTransaction();
        try {
        	System.out.println("inside try");
        	t = session.beginTransaction();
        	 ContactUser contactUser = (ContactUser) session.createQuery("FROM ContactUser WHERE userRegister.userId = :userId AND company.companyId = :companyId")
                     .setParameter("userId", userId)
                     .setParameter("companyId", companyId)
                     .uniqueResult();
        	 if (contactUser == null) {
        		 System.out.println("inside if dao");
                 System.out.println("Daon if "+contactUser);
                 contactUser = new ContactUser();
                 contactUser.setStatus("Contacted"); 
                 contactUser.setIsActive("Y");
                 contactUser.setCreatedBy(String.valueOf(companyId)); 
                 
                 Date date = new Date();
         		SimpleDateFormat formatdate = new SimpleDateFormat("yyyy-MMM-dd");
         		String dateString = formatdate.format(date);
         		
         		contactUser.setCreatedDate(null);
         		contactUser.setModifiedBy(null);
         		contactUser.setModifiedDate(null);

                
                 Company company = (Company) session.load(Company.class, companyId);
                 contactUser.setCompany(company);;

                 UserRegister userRegister = (UserRegister) session.load(UserRegister.class, userId);
                 contactUser.setUserRegister(userRegister);

                 session.save(contactUser);
                 setStatus = "liked";
             } else {
            	 System.out.println("inside else dao");
            	  
            	    if ("Contacted".equals(contactUser.getStatus())) {
            	    	contactUser.setStatus("Contacted");
            	        setStatus = "contacted";
            	    } 
            	    else if("Removed".equals(contactUser.getStatus())){
            	    	
            	    	contactUser.setStatus("Contacted");
            	    	contactUser.setIsActive("Y"); 
             	        setStatus = "liked";
            	    	
            	    }
            	    else {
            	    	 System.out.println("inside else else");
            	    	 contactUser.setStatus("Removed");
            	    	 contactUser.setIsActive("N"); 
            	        setStatus = "unliked";
            	    }

            	    session.update(contactUser);
            	}
                // session.update(appliedJob);
             

             t.commit();
         } catch (Exception e) {
             t.rollback(); 
             e.printStackTrace();
            // return null;
         } finally {
         	//t.commit();
             session.close(); 
         }

         if (status == 0) {
             setStatus = null;
         }
		return setStatus;
	}


	public static List<Company> viewCompanyContacted(Long idLong) {
		
		System.out.println("Dao Enter");
		openConnection();
		List<Company> companies=null;
		 factory = cfg.buildSessionFactory();
		session = factory.openSession();
        System.out.println("Inside Dao view companies ");
        t = session.beginTransaction();
        try{
        	String hql =  "SELECT j " +
                          "FROM Company j " +
                          "JOIN j.contactUsers aj " +
                          "WHERE aj.userRegister.userId = :userId and aj.isActive= :y ";

                  Query query = session.createQuery(hql);
                  query.setParameter("userId", idLong);
                  query.setParameter("y", "Y");
                  companies=query.list();
                  return companies;
        }    
        catch (Exception e) {
            t.rollback(); 
            e.printStackTrace();
            return null;
        } finally {
        	t.commit();
            session.close();    
        }	
	}

	

}
