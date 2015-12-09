package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
/**
 *连接数据库的一个类 
 */
public class DBConection {

	//用于读取properties文件API类
	private static Properties prop;
	
	static{
		prop = new Properties();
		try {
			prop.load(DBConection.class.getClassLoader().getResourceAsStream("properties/config.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 连接数据库
	 */
	public static Connection openConnection(){
		Connection con = null;
		try {
			Class.forName(prop.getProperty("driver"));
			con = DriverManager.getConnection(prop.getProperty("url"), prop.getProperty("username"), prop.getProperty("password"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * 关闭数据库连接
	 * @param args
	 */
	public static void closeConnection(Connection con,Statement st,ResultSet rs){
		try {
			if(con != null){
				con.close();
			}
			if(st != null){
				st.close();
			}
			if(rs != null){
				rs.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
