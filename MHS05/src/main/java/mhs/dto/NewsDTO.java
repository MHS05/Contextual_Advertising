package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class NewsDTO extends DBManager
{
	public boolean Insert(NewsVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into news (id,category,title,note,image,phyimage) ";
		sql += "values (";
		sql += "'" + _R(vo.getId())        + "',";
		sql += "'" + _R(vo.getCategory())  + "',";
		sql += "'" + _R(vo.getTitle())     + "',";
		sql += "'" + _R(vo.getNote())      + "',";
		sql += "'" + _R(vo.getImage())     + "',";
		sql += "'" + _R(vo.getPhyimage())  + "'";
		sql += ")";
		this.RunCommand(sql);		

		sql = "select last_insert_id() as nno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNno(this.GetValue("nno"));
		
		this.DBClose();
		return true;		
	}
	
	public NewsVO Read(String nno)
	{
		String sql = "";
		
		this.DBOpen();


		sql  = "select id,adno,title,category,image,phyimage,note,emotion,wdate,score ";
    
		sql += "from news where nno = " + nno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		NewsVO vo = new NewsVO();
		vo.setNno(nno);
		vo.setId(this.GetValue("id"));
		vo.setAdno(this.GetValue("adno"));
		vo.setTitle(this.GetValue("title"));
		vo.setCategory(this.GetValue("category"));
		vo.setNote(this.GetValue("note"));
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("Phyimage"));
		vo.setWdate(this.GetValue("wdate"));
		vo.setEmotion(this.GetValue("emotion"));
		vo.setScore(this.GetValue("score"));
		
		this.DBClose();
		return vo;
	}
	
	public boolean Delete(String nno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from semotion where nno = " + nno;
		this.RunCommand(sql);
		
		sql = "delete from news where nno = " + nno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
		public boolean Update(NewsVO vo)
		{
			this.DBOpen();
			
			String sql = "";
			sql  = "update news set ";
			sql += "title='"    + _R(vo.getTitle())    + "',";
			sql += "category='" + _R(vo.getCategory()) + "',";
			sql += "note='"     + _R(vo.getNote())     + "'";
			if( !vo.getPhyimage().equals(""))
			{
				sql += ", phyimage='" + vo.getPhyimage() + "',";
				sql += "image='"      + vo.getImage()    + "' ";
			}
			sql += " where nno = " + vo.getNno();
			this.RunCommand(sql);
			
			this.DBClose();
			return true;
		}	
	
}
