/*
 * 
 * Copyright (C) 2010-2013 Alibaba Group Holding Limited
 * 
 */

package com.alibaba.sca.temp.web.mongodb;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.mongodb.core.MongoTemplate;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientOptions;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;

/**
 * @author ningzhong.wyl
 *
 */
@Configuration
@EnableConfigurationProperties(MongoDbServiceConfig.class)
@SuppressWarnings("deprecation")
public class MongoDbAutoConfigure {

	private static String ADMIN_DB = "admin";

	@Autowired
	private MongoDbServiceConfig dbConfig;

	@Bean
	public MongoClient mongoClient() {
		ServerAddress address = new ServerAddress(dbConfig.getHost(), dbConfig.getPort());
		MongoCredential credential = MongoCredential.createCredential(dbConfig.getUsername(), ADMIN_DB,
				dbConfig.getPassword().toCharArray() );
		List<MongoCredential> credentials = new ArrayList<MongoCredential>();
		credentials.add(credential);
		//连接池
		MongoClientOptions options = new MongoClientOptions.Builder()
				.connectionsPerHost( dbConfig.getPoolsize() )
				.threadsAllowedToBlockForConnectionMultiplier( dbConfig.getWaitqueuesize() )
				.build();
		MongoClient mongoClient = new MongoClient(address, credentials, options );
		
		return mongoClient;
	}

	@Bean
	public MongoTemplate mongoTemplate(@Autowired MongoClient mongoClient) {
		MongoTemplate template = new MongoTemplate( mongoClient, dbConfig.getDatabase() );
		return template;
	}

}
