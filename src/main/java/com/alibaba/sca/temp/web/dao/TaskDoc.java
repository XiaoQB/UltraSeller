/*
 * 
 * Copyright (C) 2010-2013 Alibaba Group Holding Limited
 * 
 */

package com.alibaba.sca.temp.web.dao;

import java.util.Date;

import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author ningzhong.wyl
 *
 */
@Document(collection="task")
public class TaskDoc {

    private String id;

    private Date gmtCreate;

    private Date gmtModified;

    private String title;

    private String content;

    private String status;

    private Long categoryId;

    public static final String FIELD_ID = "id";
    public static final String FIELD_STATUS = "status";
    public static final String FIELD_MODIFIED = "gmt_modified";
    public static final String FIELD_CONTENT = "content";
    public static final String FIELD_TITLE = "title";
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getGmtCreate() {
		return gmtCreate;
	}
	public void setGmtCreate(Date gmtCreate) {
		this.gmtCreate = gmtCreate;
	}
	public Date getGmtModified() {
		return gmtModified;
	}
	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}
    
}
