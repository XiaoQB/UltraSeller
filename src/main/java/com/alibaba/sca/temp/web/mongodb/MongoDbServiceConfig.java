/*
 * 
 * Copyright (C) 2010-2013 Alibaba Group Holding Limited
 * 
 */

package com.alibaba.sca.temp.web.mongodb;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author ningzhong.wyl
 *
 */
@ConfigurationProperties("spring.data.mongodb")
public class MongoDbServiceConfig {

	private String host;
	private Integer port;
	private String username;
	private String password;
	private String database;
	
	private Integer poolsize;
	private Integer waitqueuesize;
	
	private String  uri;
	
	
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public Integer getPort() {
		return port;
	}
	public void setPort(Integer port) {
		this.port = port;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getPoolsize() {
		return poolsize;
	}
	public void setPoolsize(Integer poolsize) {
		this.poolsize = poolsize;
	}
	
	public Integer getWaitqueuesize() {
		return waitqueuesize;
	}
	public void setWaitqueuesize(Integer waitqueuesize) {
		this.waitqueuesize = waitqueuesize;
	}
	public String getDatabase() {
		return database;
	}
	public void setDatabase(String database) {
		this.database = database;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	
}
