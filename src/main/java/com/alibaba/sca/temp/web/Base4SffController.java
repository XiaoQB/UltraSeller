package com.alibaba.sca.temp.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/** 基础功能
 * @author ningzhong.wyl
 *
 */
public abstract class Base4SffController {
	protected static final Logger logger = LoggerFactory.getLogger(Base4SffController.class);
	
    
	
	
	
	public  static class  SffCredential{
		private   String  appId;
		//C端用户唯一ID
		private   String  openId;
		
		
		public String getAppId() {
			return appId;
		}
		public void setAppId(String appId) {
			this.appId = appId;
		}
		public String getOpenId() {
			return openId;
		}
		public void setOpenId(String openId) {
			this.openId = openId;
		}
	}
	
}
