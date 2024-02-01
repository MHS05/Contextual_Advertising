package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class ClickAdDTO extends DBManager
{
	public boolean Insert(ClickAdVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into clickad (adno, nno) ";
		sql += "values (";
		sql += "'" + _R(vo.getAdno())      + "',";
		sql += "'" + _R(vo.getNno())       + "'";
		sql += ")";
		this.RunCommand(sql);		

		sql = "select last_insert_id() as adno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setAdno(this.GetValue("adno"));
		
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
			vo.setAdno(this.GetValue("adno"));
			vo.setCdate(this.GetValue("cdate"));
			this.DBClose();
			return vo;
		}
		ClickAdVO vo = new ClickAdVO();
		vo.setNno(this.GetValue("nno"));
		vo.setAdno(this.GetValue("adno"));
		vo.setCdate(this.GetValue("cdate"));
		
		this.DBClose();
		return vo;
	}
}
