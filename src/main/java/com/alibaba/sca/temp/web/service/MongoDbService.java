/*
 * 
 * Copyright (C) 2010-2013 Alibaba Group Holding Limited
 * 
 */

package com.alibaba.sca.temp.web.service;

import java.util.Date;
import java.util.List;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import com.alibaba.sca.temp.web.dao.TaskDoc;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;

/**
 * @author ningzhong.wyl
 *
 */
@Service
public class MongoDbService {

	@Autowired
	private MongoTemplate mongoTemplate;

	/**
	 * 保存对象
	 * @param TaskDoc
	 * @return
	 */
	public String saveObj(TaskDoc task) {
		task.setGmtCreate( new Date() );
		task.setGmtModified(new Date());
		TaskDoc taskdoc = mongoTemplate.save( task );
		return taskdoc.getId();
	}

	/**
	 * 查询所有
	 * @return
	 */
	public List<TaskDoc> findAll() {
		return mongoTemplate.findAll( TaskDoc.class );
	}

	/***
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public TaskDoc getTaskDocById(String id) {
		Query query = new Query( Criteria.where("_id").is(id) );
		return mongoTemplate.findOne(query, TaskDoc.class);
	}

	/**
	 * 根据任务名称查询
	 *
	 * @param name
	 * @return
	 */
	public TaskDoc getTaskDocByName( String title ) {
		Query query = new Query( Criteria.where( TaskDoc.FIELD_TITLE ).regex( Pattern.compile( "^.*" + title + ".*$" , Pattern.CASE_INSENSITIVE) ) );
		return mongoTemplate.findOne(query, TaskDoc.class);
	}

	/**
	 * 更新对象
	 *
	 * @param TaskDoc
	 * @return
	 */
	public long updateTaskDoc(TaskDoc task) {
		Query query = new Query(Criteria.where("_id").is( task.getId()) );
		Update update = new Update().set( TaskDoc.FIELD_TITLE, task.getTitle() ).set( TaskDoc.FIELD_CONTENT, task.getContent() ).set(TaskDoc.FIELD_MODIFIED,
				new Date());
		UpdateResult  ur = mongoTemplate.updateFirst(query, update, TaskDoc.class);
		return ur.getMatchedCount();
	}

	/***
	 * 删除对象
	 * @param TaskDoc
	 * @return
	 */
	public long deleteTaskDoc(TaskDoc task) {
		DeleteResult   dr = mongoTemplate.remove( task );
		return dr.getDeletedCount();
	}

	/**
	 * 根据id删除
	 *
	 * @param id
	 * @return
	 */
	public long deleteTaskDocById(String id) {
		// findOne
		TaskDoc task = getTaskDocById(id);
		if( task==null ) {
			return 0;
		}
		else {
			// delete
			return deleteTaskDoc( task );
		}
	}
	
	/**
	 * 模糊查询
	 * @param search
	 * @return
	 */
	public List<TaskDoc> findByLikes(String search){
		Pattern pattern = Pattern.compile("^.*" + search + ".*$" , Pattern.CASE_INSENSITIVE);
		Criteria  criteria = Criteria.where( TaskDoc.FIELD_TITLE).regex(pattern).orOperator( Criteria.where( TaskDoc.FIELD_CONTENT ).regex( pattern ) );
		Query query = new Query( criteria );
		List<TaskDoc> lists = mongoTemplate.find(query, TaskDoc.class);
		return lists;
	}
}
