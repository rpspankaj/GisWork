package com.rbis.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Timestamp;

//import org.apache.taglibs.standard.lang.jstl.test.StaticFunctionTests;

import com.rbis.listner.DatabaseConnection;
import com.rbis.model.RbisFeedbackTO;
import com.rbis.model.RbisuserTO;



public class Utility {
	public static boolean login(RbisuserTO obj){
		Connection connection;
		PreparedStatement pst;
		ResultSet rs;
		boolean flg=false;
		connection=DatabaseConnection.getConnection();
		
		String query="select user_name,password,role_id,email_id,gender,dob,phone,fname,lname,modified_date,user_autoid from vwt_usermasterlist where user_name=? and password=?";
		try {
			pst=connection.prepareStatement(query);
			pst.setString(1, obj.getUser_name());
			pst.setString(2, obj.getPassword());
			
			rs=pst.executeQuery();
			
			//ArrayList<Security> al=new ArrayList<Security>();
			if(rs.next()){
				Security.setUser_name(rs.getString("user_name"));
				Security.setPassword(rs.getString("password"));
				Security.setRole_id(rs.getInt("role_id"));
				Security.setEmail(rs.getString("email_id"));
				Security.setGender(rs.getString("gender"));
				Security.setDob(rs.getTimestamp("dob"));
				Security.setPhone(rs.getString("phone"));
				Security.setFname(rs.getString("fname"));
				Security.setLname(rs.getString("lname"));
				Security.setModified_date(rs.getTimestamp("modified_date"));
				Security.setUser_id(rs.getInt("user_autoid"));
			   flg=true;
				
			}else{
				
			}
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		//return null;
		
		return flg;
	}
	 
	public static boolean registration(RbisuserTO obj){
		Connection connection=null;
		PreparedStatement pst=null;
		boolean flag=false;
		String query="";
		connection=DatabaseConnection.getConnection();
		int i=0;
		if(obj.getAction().equalsIgnoreCase("save")){
			 query="insert into t_usermaster(user_name,password,role_id,email_id,phone,fname,lname,active_status,creation_date,modified_date,creator_id,gender) values('"+obj.getUser_name()+"',('"+obj.getPassword()+"'),"+obj.getRole_id()+",'"+obj.getEmail_id()+"','"+obj.getPhone()+"','"+obj.getFname()+"','"+obj.getLname()+"',"+obj.getActive_status()+",'"+getDbTime()+"','"+getDbTime()+"',"+obj.getCreator_id()+",'"+obj.getGender()+"')";
		
			 
		}else if(obj.getAction().equalsIgnoreCase("update")){
			query="update  t_usermaster set user_name='"+obj.getUser_name()+"',phone='"+obj.getPhone()+"',fname='"+obj.getFname()+"',lname='"+obj.getLname()+"',modified_date='"+getDbTime()+"' where email_id='"+obj.getEmail_id()+"' and password='"+obj.getPassword()+"'";
		}
		
		
		try {
			
			pst=connection.prepareStatement(query);
		
			i=pst.executeUpdate();
			if(i>0){
				flag=true;
			}
		} catch (SQLException e) {
			System.out.println("Exception  in user registration method :::>"+ e); 
		}finally{
			if(connection!=null ){
				try {
					
					pst.close(); 
					connection.close();
				} catch (SQLException e) {
					System.out.println("SQLException:-"+e);
				}
			}
		}
		
		
		
		return flag;

		
	}
	
	
	public static Timestamp getDbTime(){
		
		Connection connection = null;
		ResultSet rs = null;
		Timestamp  currentdate=null;
		PreparedStatement pst=null;
		String qry="SELECT now()";
		
		try {
			connection = DatabaseConnection.getConnection();
			
			
			pst=connection.prepareStatement(qry);
			
			rs=pst.executeQuery();
			if(rs.next()) 
				currentdate = rs.getTimestamp(1); 
		} catch (SQLException e) {
			
			System.out.println("exception in gateDbTime:"+e); 
		}finally{
			try {
				connection.close();
				pst.close();
				rs.close();
			} catch (SQLException e) {
				System.out.println("exception in finally gateDbTime:"+e);
			}
		}
		
		
	 return currentdate;
	}
	
	/*public static void main(String []args){
		System.out.println(getDbTime());
	}
	
	
	*/

	public static String capitalize(String letter){
		
		return Character.toUpperCase(letter.charAt(0)) + letter.substring(1);
	}
	
	public static void logindetail(){
		
		Connection connection = null;
		PreparedStatement pst = null;
		ResultSet rs=null;
		int i=0;
		connection=DatabaseConnection.getConnection();
		String query="insert into t_userlogdetail (user_id,session_id,ip_address,active_status,login_time,logout_time,is_loggedin) values(?,?,?,?,?,?,?)";
		try {
			pst=connection.prepareStatement(query);
			pst.setInt(1,Security.getUser_id());
			pst.setString(2,Security.getId());
			pst.setString(3,Security.getIp_address());
			pst.setInt(4, 1);
			pst.setTimestamp(5,getDbTime());
			pst.setTimestamp(6,null);
			pst.setInt(7,1);
			i=pst.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		
	}
	
	public static void logout(){
		
		Connection connection = null;
		PreparedStatement pst = null;
		int i=0;
		connection=DatabaseConnection.getConnection();
		String query="update t_userlogdetail set is_loggedin=?,logout_time=? where user_id=? and session_id=?";
		try {
			pst=connection.prepareStatement(query);
			pst.setInt(1,0);
			pst.setTimestamp(2,getDbTime());
			pst.setInt(3,Security.getUser_id());
			pst.setString(4,Security.getId());
			i=pst.executeUpdate();
			if(i>0){
				System.out.println("success");
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		
	}
	
	public static boolean feedback(RbisFeedbackTO obj){
		
		Connection connection=null;
		PreparedStatement pst=null;
		//ResultSet rs=null;
		int i=0;
		boolean flag=false;
		connection=DatabaseConnection.getConnection();
		String query="insert into t_feedback (email_id,name,phone,subject,feedback,date) values(?,?,?,?,?,?)";
		try {
			pst=connection.prepareStatement(query);
			pst.setString(1,obj.getEmailid());
			pst.setString(2,obj.getName());
			pst.setString(3,obj.getPhone());
			pst.setString(4,obj.getSubject());
			pst.setString(5,obj.getFeedback());
			pst.setTimestamp(6, getDbTime());
			i=pst.executeUpdate();
			if(i>0){
				flag=true;
			}
			
			
		} catch (SQLException e) {
		System.out.println(e);	
		}
		finally{
			if(connection!=null ){
				try {
					connection.close();
					pst.close(); 
				} catch (SQLException e) {
					System.out.println("SQLException:-"+e);
				}
			}
		}
		return flag;
	
	}
	
	public Date convertDate(){
		String q="insert into t_feedback (email_id,name,phone,subject,feedback,date) values(?,?,?,?,?,?)";
		
		return null;
	}


public static ArrayList<RbisuserTO> rolecombo(){
	Connection connection=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	connection=DatabaseConnection.getConnection();
	String query="select * from vwt_rolemasteruserlist";
	ArrayList<RbisuserTO> al=new ArrayList<RbisuserTO>();
	
	try {
		pst=connection.prepareStatement(query);
		rs=pst.executeQuery();
		RbisuserTO obj=null;
		while(rs.next()){
			obj=new RbisuserTO();
			obj.setRole_id(rs.getInt("role_autoid"));
			obj.setRole_name("role_name");
			al.add(obj);
		}
		
	} catch (SQLException e) {
	  System.out.println(e);
	}
	//HttpServletRequest request = Security.getRequest();
	System.out.println(al);
	//request.setAttribute("combolist",al );
	return al;
	
}
/*public static void main(String []a){
	   rolecombo();
}
*/

public static ArrayList<RbisFeedbackTO> contactus(){
	
	Connection connection=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	
	connection=DatabaseConnection.getConnection();
	String query="select * from t_feedback group by  feedback_autoid";
	ArrayList<RbisFeedbackTO> al=new ArrayList<RbisFeedbackTO>();
	try {
		pst=connection.prepareStatement(query);
		rs=pst.executeQuery();
		while(rs.next()){
			RbisFeedbackTO obj=new RbisFeedbackTO();
			obj.setEmailid(rs.getString("email_id"));
			obj.setName(rs.getString("name"));
			obj.setSubject(rs.getString("subject"));
			obj.setFeedback(rs.getString("feedback"));
			obj.setFeedbackDate(rs.getTimestamp("date"));
			al.add(obj);
		//	System.out.println(rs.getTimestamp("date"));
		}
		
	} catch (SQLException e) {
		try {
			connection.close();
			pst.close();
			
		} catch (SQLException e1) {
			System.out.println(" Exception contactus "+e); 
		}
	}
	return al;

}

public static boolean resetPass(String password){
	Connection connection=null;
	PreparedStatement pst=null;
	//ResultSet rs=null;
	boolean flg=false;
	int i=0;
	connection=DatabaseConnection.getConnection();
	String query="update t_usermaster set password=? where email_id=?";
	 
	try {
		pst=connection.prepareStatement(query);
		pst.setString(1,password);
		pst.setString(2, Security.getEmail()); 
		i=pst.executeUpdate();
		if(i>0){
			flg=true;
		}
		
	} catch (SQLException e) {
		System.out.println(e); 
	}
	
	
	
	return flg;
	
}

public static boolean forgot(String email){
	
	Connection connection=null;
	PreparedStatement pst=null;
	ResultSet rs=null;
	connection=DatabaseConnection.getConnection();
	String query="select password from t_usermaster where email_id=?";
	String password;
	boolean flag=false;
	try {
		pst=connection.prepareStatement(query);
		pst.setString(1,email);
		rs=pst.executeQuery();
		while(rs.next()){
		password=rs.getString(1);
		System.out.println("password="+password);
		flag=true;
		EmailSender.sendMail(email,"New Password", " userid:  "+email+" your Password: "+password+" ");
		}
	} catch (SQLException e) {
		System.out.println(e);
	}
	
	return flag;
}

public static String strToSimpleDateFormat(){
	
	
	
	return null;
}

 /*public static void main(String args[]){
	 
	// contactus();
 }
*/


}
