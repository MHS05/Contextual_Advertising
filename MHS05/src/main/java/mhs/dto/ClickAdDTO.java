package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class ClickAdDTO extends DBManager
{
	public boolean Insert(ClickAdVO vo, boolean iscount, String adno)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into clickad (adno, nno, title) ";
		sql += "values (";
		sql += "'" + _R(vo.getAdno())      + "',";
		sql += "'" + _R(vo.getNno())       + "',";
		sql += "'" + _R(vo.getTitle())     + "'";
		sql += ")";
		this.RunCommand(sql);		

		sql = "select last_insert_id() as adno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setAdno(this.GetValue("adno"));
		
		//클릭횟수 증가 처리
		if(iscount == true)
		{
			sql = "update clickad set ccount = ccount + 1 where adno = " + adno;
			this.RunCommand(sql);			
		}
		
		this.DBClose();
		return true;		
	}
	
	public ClickAdVO Read(String adno)
	{
		String sql = "";
		
		this.DBOpen();

		
		sql  = "select * ";
		sql += "from clickad where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			ClickAdVO vo = new ClickAdVO();
			vo.setNno(this.GetValue("nno"));
			vo.setTitle(this.GetValue("title"));
			vo.setAdno(this.GetValue("adno"));
			vo.setCdate(this.GetValue("cdate"));
			vo.setCcount(this.GetValue("ccount"));
			this.DBClose();
			return vo;
		}
		ClickAdVO vo = new ClickAdVO();
		vo.setNno(this.GetValue("nno"));
		vo.setTitle(this.GetValue("title"));
		vo.setAdno(this.GetValue("adno"));
		vo.setCdate(this.GetValue("cdate"));
		vo.setCcount(this.GetValue("ccount"));
		
		this.DBClose();
		return vo;
	}
	
	public ClickAdVO Read1(String adno)
	{
		String sql = "";
		
		this.DBOpen();

		
		sql  = "select * ";
		sql += "from clickad where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		ClickAdVO vo = new ClickAdVO();
		vo.setNno(this.GetValue("nno"));
		vo.setTitle(this.GetValue("title"));
		vo.setAdno(this.GetValue("adno"));
		vo.setCdate(this.GetValue("cdate"));
		vo.setCcount(this.GetValue("ccount"));
		
		this.DBClose();
		return vo;
	}
	
	public ClickAdVO Read2(String adno)
	{
		String sql = "";
		
		this.DBOpen();
		
		
		sql  = "select adno ";
		sql += "from clickad where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		ClickAdVO vo = new ClickAdVO();
		vo.setAdno(this.GetValue("adno"));
		
		this.DBClose();
		return vo;
	}
}
