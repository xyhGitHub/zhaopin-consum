package com.four.model;

import org.springframework.data.annotation.Id;

import java.io.Serializable;

public class Logs implements Serializable{
	private static final long serialVersionUID = 923522888120974690L;
	@Id
	private String logId;
	private String clazzName;
	private String methodName;
	private String params;
	
	
	
	public String getParams() {
		return params;
	}
	public void setParams(String params) {
		this.params = params;
	}
	public String getLogId() {
		return logId;
	}
	public void setLogId(String logId) {
		this.logId = logId;
	}
	public String getClazzName() {
		return clazzName;
	}
	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}
	public String getMethodName() {
		return methodName;
	}
	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}
	@Override
	public String toString() {
		return "Logs [logId=" + logId + ", clazzName=" + clazzName + ", methodName=" + methodName + "]";
	}
	
	
}
