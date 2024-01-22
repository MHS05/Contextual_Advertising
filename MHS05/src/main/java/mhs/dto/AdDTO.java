package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

import java.util.List;

public class AdDTO extends DBManager
{
	public boolean Insert(AdVO vo)
	{
		this.DBOpen();
		
		String sql = "";

	
		sql += "insert into ad ";
		sql += "(adno, keywords, link, fimage, pimage, type";
		sql += "name, date_start, date_end) ";
		sql += "values (";
		sql += "'" + vo.getAdno()        + "',";
		sql += "'" + vo.getKeywords()    + "',";
		sql += "'" + vo.getLink()        + "',";
		sql += "'" + vo.getFimage()      + "',";
		sql += "'" + vo.getPimage()      + "',";
		sql += "'" + vo.getType()        + "',";
		sql += "'" + _R(vo.getName())    + "',";
		sql += "'" + vo.getDate_start()  + "',";
		sql += "'" + vo.getDate_end()    + "' ";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_name() as adno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setAdno(this.GetValue("adno"));
		this.DBClose();
		return true;		

	}
	
	public boolean Update(AdVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update ad set ";
		sql += "adno='"           + vo.getAdno()           + "', ";
		sql += "keywords='"       + vo.getKeywords()       + "', ";
		if(!vo.getFimage().equals(""))
		{
			sql += "fimage='"     + _R(vo.getFimage())     + "', ";
			sql += "pimage='"     + _R(vo.getPimage())     + "', ";
		}
		sql += "link='"           + vo.getLink()           + "', ";
		sql += "type='"           + vo.getType()           + "', ";
		sql += "name='" 		  + _R(vo.getName())       + "', ";
		sql += "date_start='"     + vo.getDate_start()     + "', ";
		sql += "date_end='"       + vo.getDate_end()       + "' ";
		
		
		sql += "where adno = "  + vo.getAdno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	
	public boolean Delete(String adno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from ad where adno = " + adno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	public AdVO Read(String adno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select adno, keywords, link, fimage, pimage, ";
		sql	+= "type, name, date_start, date_end ";
		sql += "from ad ";
		sql += "where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		AdVO vo = new AdVO();
		vo.setAdno(adno);
		vo.setKeywords(this.GetList("keywords"));
		vo.setLink(this.GetValue("link"));
		vo.setFimage(this.GetValue("fimage"));
		vo.setPimage(this.GetValue("pimage"));
		vo.setType(this.GetValue("type"));
		vo.setName(this.GetValue("name"));
		vo.setDate_start(this.GetValue("date_start"));
		vo.setDate_end(this.GetValue("date_end"));
	
		this.DBClose();
		return vo;
	}	
}
