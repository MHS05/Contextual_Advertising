package mhs.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class DBManager 
{
	private Connection conn;
	private Statement  stmt;
	private ResultSet  rs;
	
	private String     host;   //DB��������
	private String     userid; //DB ����� ID
	private String     userpw; //DB ����� ��ȣ 
	
	public DBManager()
	{
		conn   = null;
		userid = "root";
		userpw = "ezen";
		host   = "jdbc:mysql://192.168.0.101:3306/mhs";
		host  += "?useUnicode=true&characterEncoding=utf-8";
		host  += "&serverTimezone=UTC";		
	}
	
	public void setHost(String host) 
	{
		this.host = host;
	}

	public void setUserid(String userid) 
	{
		this.userid = userid;
	}

	public void setUserpw(String userpw) 
	{
		this.userpw = userpw;
	}

	//DB�� �����Ѵ�.
	//���ϰ� : true-���Ἲ��, false-�������
	public boolean DBOpen()
	{
		//jdbc ���̺귯�� �ε�
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}		
		//�����ͺ��̽��� �����Ѵ�.	
		try 
		{
			conn =  DriverManager.getConnection(host,userid,userpw);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}		
		return true;
	}
		
	//DB ������ �����Ѵ�.
	public void DBClose()
	{
		try 
		{
			conn.close();
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}		
	}
	
	//CUD(Insert,Delete,Update) ������ ����
	public boolean RunCommand(String sql)
	{
		try
		{
			stmt = conn.createStatement();
			System.out.println(sql);
			stmt.executeUpdate(sql);
		}catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}		
		return true;
	}
	
	//R(Select) ������ �����Ѵ�. 
	public boolean RunSelect(String sql)
	{
		try
		{
			stmt = conn.createStatement();
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
		}catch(Exception e)
		{
			e.printStackTrace();
			return false;
		}
		return true;
	}	
	
	//ResultSet�� next() ȣ��
	public boolean GetNext()
	{
		try 
		{		
			return rs.next();
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return false;
		}		
	}	
	
	//ResultSet�� getString() ȣ��
	public String GetValue(String colname)
	{
		try 
		{		
			return rs.getString(colname);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}				
	}	
	//ResultSet�� getList() ȣ��
	public List<String> GetList(String colname)
	{
		try 
		{		
			return ((List<String>) rs).get(colname);
		} catch (SQLException e) 
		{
			e.printStackTrace();
			return null;
		}				
	}	
	//���� ����ǥ 1���� 2���� ��ȯ
	public String _R(String value)
	{
		return value.replace("'", "''");
	}
}
