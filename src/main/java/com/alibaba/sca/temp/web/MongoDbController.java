/*
 * 
 * Copyright (C) 2010-2013 Alibaba Group Holding Limited
 * 
 */

package com.alibaba.sca.temp.web;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.sca.temp.web.dao.TaskDoc;
import com.alibaba.sca.temp.web.service.MongoDbService;

@RestController
public class MongoDbController {
	private static final Logger logger = LoggerFactory.getLogger(MongoDbController.class);

	@Autowired
	private MongoDbService mongoDbService;
	
    @PostMapping("/mdb/add")
    @ResponseBody
    public String mdbAdd( @RequestBody TaskDoc task ) {
    	try {
	    	String id = mongoDbService.saveObj(task);
	        return id;
    	}
    	catch(Exception e) {
    		logger.warn("保存发生异常", e );
    		return "保存发生异常:" +  e.getMessage() ;
    	}
    }
    
    @GetMapping("/mdb/query")
    @ResponseBody
    public List<TaskDoc> mdbQuery( String search ) {
    	try {
    		List<TaskDoc>  listTask = mongoDbService.findByLikes(  search);
	        return listTask;
    	}
    	catch(Exception e) {
    		logger.warn("保存发生异常", e );
    		return new ArrayList<TaskDoc>();
    	}
    }
    
    @PostMapping("/mdb/update")
    @ResponseBody
    public String mdbUpdate( @RequestBody TaskDoc task ) {
    	try {
	    	Long count = mongoDbService.updateTaskDoc(task);
	        return "更新数量：" + count ;
    	}
    	catch(Exception e) {
    		logger.warn("更新发生异常", e );
    		return "更新发生异常:" +  e.getMessage() ;
    	}
    }
    
    @GetMapping(value = "/mdb/delete/{taskId}" )
    @ResponseBody
    public String mdbDelete( @PathVariable String taskId ) {
    	try {
	    	long  count = mongoDbService.deleteTaskDocById( taskId );
	        return "删除数量：" + count ;
    	}
    	catch(Exception e) {
    		logger.warn("删除发生异常", e );
    		return "删除发生异常:" +  e.getMessage() ;
    	}
    }
    
    
	
}
