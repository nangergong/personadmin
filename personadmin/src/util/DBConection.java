package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
/**
 *�������ݿ��һ���� 
 */
public class DBConection {

	//���ڶ�ȡproperties�ļ�API��
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
	 * �������ݿ�
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
	 * �ر����ݿ�����
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
