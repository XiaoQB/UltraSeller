package com.alibaba.sca.temp.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author <a href="mailto:chenxilzx1@gmail.com">theonefx</a>
 */
@RestController
public class MainController {

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
        
        return rtnVal;
    }
	
}
