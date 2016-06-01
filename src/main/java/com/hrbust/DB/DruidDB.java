package com.hrbust.DB;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;
import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.pool.DruidPooledConnection;


/**
 * 
 * @author Administrator
 * 
 */
public class DruidDB{

	private static DruidDB databasePool = null;
	private static DruidDataSource dds = null;
	static{
		Properties properties = loadPropertyFile("druid.ini");
		try	{
			dds = (DruidDataSource) DruidDataSourceFactory.createDataSource(properties);
		} catch (Exception e){
			e.printStackTrace();
		}
	}

	private DruidDB(){
	}

	/**
	 * 
	 * @return
	 */
	public static synchronized DruidDB getInstance(){
		if (null == databasePool){
			databasePool = new DruidDB();
		}
		return databasePool;
	}

	public DruidPooledConnection getConnection() throws SQLException{
		return dds.getConnection();
	}
	

	/**
	 * 
	 * @param fullFile
	 * @return
	 */
	private static Properties loadPropertyFile(String fullFile){
		String webRootPath = null;
		if (null == fullFile || fullFile.equals(""))
			throw new IllegalArgumentException("Properties file path can not be null : " + fullFile);
		try {
			webRootPath = java.net.URLDecoder.decode(DruidDB.class.getClassLoader().getResource("").getPath(),"utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		InputStream inputStream = null;
		Properties p = null;
		try	{
			System.out.println(webRootPath + File.separator + fullFile);
			inputStream = new FileInputStream(new File(webRootPath + File.separator + fullFile));
			p = new Properties();
			p.load(inputStream);
		} catch (FileNotFoundException e){
			e.printStackTrace();
		} catch (IOException e){
			e.printStackTrace();
		} finally{
			try	{
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e){
				e.printStackTrace();
			}
		}
		return p;
	}

}
