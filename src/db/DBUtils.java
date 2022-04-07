package db;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import database.Data;
import database.User;

public class DBUtils {
	public static User find(String name,String passwd) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=? and passwd=?";
		User user=(User) runner.query(sql,new BeanHandler(User.class),name,passwd);
		return user;
	}
	public static List findAll() throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select *from data";
		List list=(List) runner.query(sql, new BeanListHandler(Data.class));
		return list;
	}
	public static List find(String id) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from data where id=?";
		List list=(List)runner.query(sql, new BeanListHandler(Data.class),id);
		return list;
	}
	public static boolean delete(String id) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="delete from data where id=?";
		int num=runner.update(sql, id);
		if(num>0)
			return true;
		return false;
	}
	public static boolean update(Data data) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="update data set name=?,phone=?,lev=? where id=?";
		int count=runner.update(sql, data.getName(),data.getPhone(),data.getLev(),data.getId());
		if(count>0)
			return true;
		return false;
	}
	public static boolean insert(Data data) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="insert into data values(?,?,?,?)";
		int count=runner.update(sql,data.getId(),data.getName(),data.getPhone(),data.getLev());
		if(count>0)
			return true;
		return false;
	}
	public static boolean updateP(String path,String name) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="update user set path=? where name=?";
		int count=runner.update(sql,path,name);
		if(count>0)
			return true;
		else
			return false;
	}
	public static boolean updateS(User user) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="update user set gender=?,local=?,age=? where name=?";
		int count =runner.update(sql,user.getGender(),user.getLocal(),user.getAge(),user.getName());
		if(count>0)
			return true;
		else
			return false;
	}
	public static List findAll(int index,int size) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from data limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(Data.class),index,size);
		return list;
	}
	public static int findSum() throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from data";
		List list =(List)runner.query(sql, new BeanListHandler(Data.class));
		int count=list.size();
		return count;
	}
	public static List findAllByPage(int index,int size) throws SQLException
	{
		QueryRunner runner =new QueryRunner (C3p0Utils.getDataSource());
		String sql="select * from data limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(Data.class),index,size);
		return list;
	}
	public static List find_Page(int index,int size,String id) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from data  where id=? limit ?,?";
		List list =(List )runner.query(sql, new BeanListHandler(Data.class),id,index,size);
		return list;
	}
	public static boolean change_pw(String name,String np) throws SQLException
	{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql="update user set passwd=? where name=?";
		int count=runner.update(sql,np,name);
		if(count>0)
			return true;
		return false;
	}
	public static List find_users() throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where power=0";
		List list =(List) runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	public static List find_users(int index,int size) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where power=0 limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),index,size);
		return list;
	}
	public static List find_user(String name) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=? and power=0";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),name);
		return list;
	}
	public static List find_user(String name,int index,int size) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=? and power=0 limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),name,index,size);
		return list;
	}
	public static List find_admins() throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where power!=2";
		List list =(List) runner.query(sql, new BeanListHandler(User.class));
		return list;
	}
	public static List find_admins(int index,int size) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where power!=2 limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),index,size);
		return list;
	}
	public static List find_admin(String name) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=? and power!=2";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),name);
		return list;
	}
	public static List find_admin(String name,int index,int size) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=? and power!=2 limit ?,?";
		List list =(List) runner.query(sql, new BeanListHandler(User.class),name,index,size);
		return list;
	}
	public static boolean update_power(String name,int power) throws SQLException
	{
		QueryRunner runner=new QueryRunner(C3p0Utils.getDataSource());
		String sql="update user set power=? where name=?";
		int count=runner.update(sql,power,name);
		if(count>0)
			return true;
			return false;
	}
	public static boolean delete_user(String name) throws SQLException
	{
		QueryRunner runner = new QueryRunner(C3p0Utils.getDataSource());
		String sql="delete from user where name=?";
		int count = runner.update(sql,name);
		if(count>0)
			return true;
		return false;
	}
	public static boolean regist(User user) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="insert into user(name,passwd,gender,age,local) values(?,?,?,?,?)";
		int count = runner.update(sql,user.getName(),user.getPasswd(),user.getGender(),user.getAge(),user.getLocal());
		if(count>0)
			return true;
		else
			return false;
	}
	public static boolean find_name(String name) throws SQLException
	{
		QueryRunner runner =new QueryRunner(C3p0Utils.getDataSource());
		String sql="select * from user where name=?";
		User user=(User) runner.query(sql, new BeanHandler(User.class),name);
		if(user!=null)
			return true;
		return false;
	}
}
