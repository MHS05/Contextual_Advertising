package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class AdDTO extends DBManager
{
	public boolean Insert(AdVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into ad (id,adname, image, phyimage, adkey) ";
		sql += "values (";
		sql += "'" + _R(vo.getId())          + "',";
		sql += "'" + _R(vo.getAdname())      + "',";
		sql += "'" + _R(vo.getImage())       + "',";
		sql += "'" + _R(vo.getPhyimage())    + "',";
		sql += "'" + _R(vo.getAdkey())       + "'";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_id() as adno ";
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
		sql += "adkey='" + vo.getAdkey() + "',";
		if(!vo.getImage().equals(""))
		{
			sql += "image='" + _R(vo.getImage()) + "',";
			sql += "phyimage='" + _R(vo.getPhyimage()) + "',";
		}
		sql += "adname='" + _R(vo.getAdname()) + "' ";
		sql += "where adno = " + vo.getAdno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	
	public boolean Delete(String adno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from similarity where adno = " + adno;
		this.RunCommand(sql);
		
		sql = "delete from ad where adno = " + adno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	public AdVO Read(String adno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select * from ad ";
		sql += "where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		AdVO vo = new AdVO();
		vo.setAdno(adno);
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("phyimage"));
		vo.setAdname(this.GetValue("adname"));
		vo.setId(this.GetValue("id"));
		vo.setAdkey(this.GetValue("adkey"));
	
		this.DBClose();
		return vo;
	}	
}