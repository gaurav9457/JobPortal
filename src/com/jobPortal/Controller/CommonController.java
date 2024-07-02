package com.jobPortal.Controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jobPortal.ActionBean.CommonActionBean;



/**
 * Servlet implementation class CommonController
 */
public class CommonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CommonController() {
        super();
        
    }
    
    private boolean isMultipart;
    private int maxFileSize = 50 * 1024 * 1024; // 50 MB 
    private int maxMemSize = 4 * 1024 * 1024;   // 4 MB 
    private File file;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url=request.getParameter("action");
		HttpSession session=request.getSession();
		System.out.println(url+ " url");
		
		isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println(isMultipart+ " Is MultiPart");
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        
        Map<String, String> formdataMap = new HashMap<String, String>();
        if (isMultipart) {
            
         

            DiskFileItemFactory factory = new DiskFileItemFactory(); 

           
            factory.setSizeThreshold(maxMemSize);

       
            factory.setRepository(new File(request.getContextPath()));

         
            ServletFileUpload upload = new ServletFileUpload(factory);

          
            upload.setSizeMax(maxFileSize);

            System.out.println(factory.getRepository()+" request");

            try {
            
                List formData = upload.parseRequest(request);

                String userName="";
                FileItem actionAttr = (FileItem) formData.get(0);
                FileItem typeAttr = (FileItem) formData.get(2);
                if (actionAttr.getFieldName().equals("action")
                        && (actionAttr.getString().equals("updateUser") || actionAttr.getString().equals("registerCompany") ) ) {
                    url=actionAttr.getString();
                    userName=typeAttr.getString();
             
                    Iterator itr = formData.iterator();
                    while (itr.hasNext()) {
                        FileItem field = (FileItem) itr.next();
                        if (!field.isFormField()) {
                          
                            String fieldName = field.getFieldName();
                            String fileName = field.getName();
                            String contentType = field.getContentType();
                            boolean isInMemory = field.isInMemory();
                            long sizeInBytes = field.getSize();
                        
                            Date date=new Date();
                            
                            if (!contentType.equals("application/pdf")) {
                                System.out.println("Only PDF files are allowed.");
                                fileName=userName+""+System.currentTimeMillis()+".png";
                            }
                            else{
                            	 fileName=userName+""+session.getAttribute("loginUserId")+".pdf";
                            }
                            
                         //   fileName=userName+""+session.getAttribute("loginUserId")+".pdf";
                            file = new File("D:\\dev\\projects\\FinalHibernateProject\\WebContent\\staticContent\\" +fileName);


                            field.write(file);
                            formdataMap.put(fieldName,fileName);
                           
                        } else {
                            String name = field.getFieldName();
                            String value = field.getString();
                            formdataMap.put(name, value);
                        }
                    }
                    
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }

        }
        if(url==null){
        	return ;
        }
        else{
		
		if(url.equals("registerUser")){
            System.out.println("register Controller");	
          CommonActionBean.registerUser(request,response);
		}
		if(url.equals("getStateData")){
			 System.out.println(request.getParameter("locationID")+" locaion ID");
			 CommonActionBean.getStateData(request,response);
		}
		if(url.equals("getCities")){
			 System.out.println(request.getParameter("state")+" state ");
			 CommonActionBean.getCityData(request,response);
		}
		if(url.equals("Login")){
			System.out.println("Login");
			if(request.getParameter("userType").equals("admin")){
				 System.out.println("Admin start");
				 String emailString=request.getParameter("email");
				 String passwordString=request.getParameter("password");
				 CommonActionBean.loginAdmin(emailString,passwordString, response,request);
				 System.out.println("Admin end");
				 
			 } 
			else if(request.getParameter("userType").equals("company")){
				 System.out.println("Company start");
				 String emailString=request.getParameter("email");
				 String passwordString=request.getParameter("password");
				 CommonActionBean.loginCompany(emailString,passwordString, response,request);
				 System.out.println("COmpany end");
			 }
			else{
			 System.out.println("Conn "+request.getParameter("email")+" "+request.getParameter("password"));
			 String emailString=request.getParameter("email");
			 String passwordString=request.getParameter("password");
            CommonActionBean.loginUser(emailString,passwordString, response,request);
			 }
			
		}
		if(url.equals("logOut")){
			CommonActionBean.logOutUser(request,response);
		}
		if(url.equals("registerCompany")){
			System.out.println("register Company ");
			System.out.println(formdataMap+" formdataMap");
			CommonActionBean.registerCompany(request,response,formdataMap);
		}
		if(url.equals("addJob")){
			System.out.println("addJob ");
			System.out.println("companyId "+request.getParameter("companyId"));
			CommonActionBean.addJob(request,response);
		}
		if(url.equals("getPostedJob")){
			System.out.println("getPostedJob ");
			System.out.println("companyId "+request.getParameter("companyId"));
			CommonActionBean.getPostedJob(request,response);
		}
		if(url.equals("applyJob")){
			System.out.println("apply Job");
			System.out.println("companyId "+request.getParameter("companyId"));
			CommonActionBean.applyJob(request,response);
		}
		if(url.equals("viewAppliedJob")){
			System.out.println("viewAppliedJob ");
			System.out.println("User id "+request.getParameter("userId"));
			CommonActionBean.viewAppliedJob(request,response);
		}
		if(url.equals("selectState")){
			System.out.println("selectState ");
			 System.out.println("State=="+request.getParameter("location"));
			 CommonActionBean.getJobByLocation(request, response);
		}
		if(url.equals("searchJobByName")){
			System.out.println("searchJobByName ");
			 System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.getJobByName(request, response);
		}
		if(url.equals("getAllUser")){
			System.out.println("getAllUser ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.getAllUser(request, response);
		}
		if(url.equals("getAllUserPage")){
			System.out.println("getAllUser ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.getAllUserPage(request, response);
		}
		if(url.equals("getAllCompany")){
			System.out.println("getAllCompany ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.getAllCompany(request, response);
		}
		if(url.equals("userInactive")){
			System.out.println("userInactive ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.userInactive(request, response);
		}
		if(url.equals("viewAppliedUsers")){
			System.out.println("viewAppliedUsers ");
			System.out.println("Job id "+request.getParameter("jobId"));
			CommonActionBean.viewAppliedUsers(request,response);
		}
		if(url.equals("contactUser")){
			System.out.println("contactUser ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.contactUser(request, response);
		}
		if(url.equals("checkStatus")){
			System.out.println("checkStatus ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.checkStatus(request, response);
		}
		if(url.equals("updateUser")){
			 System.out.println("updateUser controller");
			 System.out.println(request.getParameter("firstname"));
			 System.out.println(request.getParameter("lastname"));
			 System.out.println(request.getParameter("addressArea"));
			// CommonActionBean.updateUser(request,response,formdataMap);
		 }
		if(url.equals("selectExp")){
			System.out.println("selectExp ");
			 System.out.println("selectExp=="+request.getParameter("location"));
			 CommonActionBean.getJobByExp(request, response);
		}
		if(url.equals("forgotPassword")){
			System.out.println("Forgot Pass ");
			if(request.getParameter("userType").equals("company")){
				 System.out.println("Company Forgot");
				 String emailString=request.getParameter("email");
				 String passwordString=request.getParameter("password");
				 String userType=request.getParameter("userType");
				 
				 System.out.println("emailString "+emailString+" "+passwordString+" User "+userType);
				CommonActionBean.forgotPassword(emailString,passwordString, response,request,userType);
			 }
			else{
			 System.out.println("Forgot Pass");
			 String emailString=request.getParameter("email");
			 String passwordString=request.getParameter("password");
			 String userType=request.getParameter("userType");
          // CommonActionBean.forgotPassword(emailString,passwordString, response,request,userType);
           System.out.println("emailString "+emailString+" "+passwordString+" User "+userType);
           CommonActionBean.forgotPassword(emailString,passwordString, response,request,userType);
			 }
		}
		if(url.equals("jobInactive")){
			System.out.println("jobInactive ");
			// System.out.println("searchJobByName"+request.getParameter("brand"));
			 CommonActionBean.jobInactive(request, response);
		}
		if(url.equals("searchSkills")){
			System.out.println("searchSkills ");
			 System.out.println("searchSkills== "+request.getParameter("skills"));
			 CommonActionBean.getJobBySkills(request, response);
		}
		if(url.equals("getAllApplication")){
			System.out.println("getAllApplication");
			 CommonActionBean.getAllApplications(request, response);
		}
		if(url.equals("companyInactive")){
			
			System.out.println("Company id "+request.getParameter("companyId"));
			CommonActionBean.companyInactive(request,response);
		}
		if(url.equals("contactUserByCompany")){
			System.out.println("Comp id User id"+request.getParameter("userId"));
			CommonActionBean.contactUserByCompany(request,response);
		}
		if(url.equals("viewCompanyContacted")){
			System.out.println("viewCompanyContacted ");
			System.out.println("User id "+request.getParameter("userId"));
			CommonActionBean.viewCompanyContacted(request,response);
		}
		
		
	}
        }

}
