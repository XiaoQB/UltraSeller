package com.alibaba.sca.temp.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author <a href="mailto:chenxilzx1@gmail.com">theonefx</a>
 */
@RestController
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

    @Value("${test_user_name}")
    private String userName;
    @Value("${test_nas_path:没读出来}")
    private String nasPath;
    @Value("${abc:没读出来}")
    private String abc;

    @RequestMapping("/")
    @ResponseBody
    public String hello() {
        String rtnVal =  "Hello world!!, I'm " + userName;
        
        rtnVal += "<br>" + "test_nas_path=" +  nasPath;
        rtnVal += "<br>" + "abc=" +  abc;
        
        logger.info("输出日志： {}",  rtnVal );
        String homePath = System.getProperty("user.home");
        logger.info("user.home={}",homePath);
        
        return rtnVal;
    }
	
}
