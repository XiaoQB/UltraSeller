package com.alibaba.sca.temp.web;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@RestController
public class NatEipController {

    @RequestMapping("/myip")
    @ResponseBody
    public String myip() {
        String  rtnVal  = "<BR>本机外部地址信息：" + getHttpPage() ;
        
        return rtnVal;
    }
    
    private String  getHttpPage( ) {
		try {
			String url = "https://myip.ipip.net/";
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder().url(url).build();
			Response response = client.newCall(request).execute();
			String ipInfo = response.body().string();
			return ipInfo;
		}
		catch( Exception e) {
			return "获取访问外网失败";
		}
	}
	
}
