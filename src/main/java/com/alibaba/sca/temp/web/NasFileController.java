package com.alibaba.sca.temp.web;

import java.io.File;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.io.StringWriter;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author <a href="mailto:chenxilzx1@gmail.com">theonefx</a>
 */
@RestController
public class NasFileController {

	@Value("${test_nas_path:/mnt/wb}")
    private String nasPath;

    @RequestMapping("/file")
    @ResponseBody
    public String myip() {
    	StringBuilder  sb = new StringBuilder();
    	writeFile(  sb );
    	readFile( sb );
        String  rtnVal  = " 操作信息：<BR>" + sb.toString();
        
        return rtnVal;
    }
	
	private void writeFile( StringBuilder  sb ) {
		try {
			File filePath = new File( nasPath );
			if (filePath.exists()) {
				sb.append( "reWriteFile NAS本地路径: " + nasPath ).append("，存在！").append("<br>");
				// 创建文件
				String newFileName = filePath.getPath() + "/abc.txt";
				// 打开一个随机访问文件流，按读写方式   
	            RandomAccessFile randomFile = new RandomAccessFile( newFileName, "rw");   
	            // 文件长度，字节数   
	            long fileLength = randomFile.length();   
	            sb.append( "当前文件长度：" +  fileLength ).append("<br>");
	            // 将写文件指针移到文件尾。   
	            randomFile.seek(fileLength);   
	            randomFile.write( "SpringBoot服务写入！".getBytes("UTF-8") );   
	            randomFile.close();   
			} else {
				sb.append( "NAS本地路径: 不存在" ).append("<br>");
			}
		} catch (Exception e) {
			sb.append( "发生异常：" + ex2String(e) ).append("<br>");
		}
	}
	
	private void readFile( StringBuilder  sb ) {
		sb.append( "readFile 读文件内容: " + nasPath ).append("<br>");
		try {
			File filePath = new File( nasPath );
			// 创建文件
			String newFileName = filePath.getPath() + "/abc.txt";
			// 打开一个随机访问文件流，按读写方式   
	        RandomAccessFile randomFile = new RandomAccessFile( newFileName, "rw");   
	        long fileLength = randomFile.length();   
	        while( randomFile.getFilePointer()<fileLength ) {
	        	sb.append( new String( randomFile.readLine().getBytes("ISO8859_1"), "UTF-8" )).append("<br>");
	        }
	        randomFile.close();   
		} catch (Exception e) {
			sb.append( "读文件发生异常：" + ex2String(e) ).append("<br>");
		}
	}
	
	
	private String ex2String(Exception t) {
		StringWriter sw = new StringWriter();
		t.printStackTrace(new PrintWriter(sw, true));
		return sw.getBuffer().toString();
	}
	
}
