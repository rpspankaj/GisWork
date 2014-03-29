package com.rbis.model;

import java.sql.Timestamp;

public class RbisFeedbackTO {
	String emailid;
	String name;
	String phone;
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getFeedback() {
		return feedback;
	}
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	public String getAction() {
		return Action;
	}
	public void setAction(String action) {
		Action = action;
	}
	String subject;
	String feedback;
	String Action;
	Timestamp feedbackDate;
	public Timestamp getFeedbackDate() {
		return feedbackDate;
	}
	public void setFeedbackDate(Timestamp feedbackDate) {
		this.feedbackDate = feedbackDate;
	}
	
	
    
}
