package db;

import java.sql.SQLException;
import java.util.List;

import database.Page;


public class PageService {

	public Page findAll(int num) throws SQLException
	{
		int count=DBUtils.findAll().size();
		Page p=new Page(num,count);
		List list=DBUtils.findAllByPage(p.getIndex(), p.getSize());
		p.setList(list);
		return p;
	}
	public Page find(int num,String id) throws SQLException
	{
		int count=DBUtils.find(id).size();
		Page p=new Page(num,count);
		List list=DBUtils.find_Page(p.getIndex(),p.getSize(),id);
		p.setList(list);
		return p;
	}
	public Page findAllUsers(int num) throws SQLException
	{
		int count=DBUtils.find_users().size();
		Page p=new Page(num,count);
		List list =DBUtils.find_users(p.getIndex(), p.getSize());
		p.setList(list);
		return p;
	}
	public Page findUser(int num,String name) throws SQLException
	{
		int count=DBUtils.find_user(name).size();
		Page p=new Page(num,count);
		List list =DBUtils.find_user(name,p.getIndex(), p.getSize());
		p.setList(list);
		return p;
	}
	public Page findAdmin(int num) throws SQLException
	{
		int count=DBUtils.find_admins().size();
		Page p=new Page(num,count);
		List list=DBUtils.find_admins(p.getIndex(), p.getSize());
		p.setList(list);
		return p;
	}
	public Page findAdmin(int num,String name) throws SQLException
	{
		int count=DBUtils.find_admin(name).size();
		Page p=new Page(num,count);
		List list=DBUtils.find_admin(name, p.getIndex(),p.getSize());
		p.setList(list);
		return p;
	}
}
