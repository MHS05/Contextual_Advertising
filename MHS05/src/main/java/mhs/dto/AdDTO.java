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
		sql += "(adno, name, keywords, fimage, pimage)";
		sql += "values (";
		sql += "'" + vo.getAdno()        + "',";
		sql += "'" + _R(vo.getName())    + "',";
		sql += "'" + vo.getKeywords()    + "',";
		sql += "'" + vo.getFimage()      + "',";
		sql += "'" + vo.getPimage()      + "',";
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
		sql += "name='" 		  + _R(vo.getName())       + "' ";
		
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
		vo.setKeywords(this.GetValue("keywords"));
		vo.setFimage(this.GetValue("fimage"));
		vo.setPimage(this.GetValue("pimage"));
		vo.setName(this.GetValue("name"));
	
		this.DBClose();
		return vo;
	}	
}
