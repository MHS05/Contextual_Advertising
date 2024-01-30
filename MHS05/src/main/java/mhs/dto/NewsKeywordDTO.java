package mhs.dto;

import java.util.ArrayList;

import mhs.dao.*;
import mhs.vo.*;

public class NewsKeywordDTO extends DBManager
{
	public boolean Insert(NewsKeywordVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into newskeyword ";
		sql += "(nno, nkey, nkeynum) ";
		sql += "values (";
		sql += "'" + vo.getNno()      + "',";
		sql += "'" + _R(vo.getNkey()) + "',";
		sql += "'" + vo.getNkeynum()  + "'";
		sql += ")";
		this.RunCommand(sql);

		this.DBClose();
		return true;
	}
	
	public ArrayList<NewsKeywordVO> GetList(String nno)
	{
		ArrayList<NewsKeywordVO> list = new ArrayList<NewsKeywordVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select nkeyno, nno, nkey, nkeynum ";
		sql += "from newskeyword ";
		sql += "where nno = '" + nno + "' ";
		//빈도수 높은것부터
		sql += "order by nno, nkeynum desc";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			NewsKeywordVO vo = new NewsKeywordVO();
			vo.setNkeyno(this.GetValue("nkeyno"));
			vo.setNno(this.GetValue("nno"));
			vo.setNkey(this.GetValue("nkey"));
			vo.setNkeynum(this.GetValue("nkeynum"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	
	
	public NewsKeywordVO Read(String keyword)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select nkeyno, nno, nkey, nkeynum ";
		sql += "from newskeyword ";
		sql += "where nkey = '" + keyword + "'";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		NewsKeywordVO vo = new NewsKeywordVO();
		vo.setNkeyno(this.GetValue("nkeyno"));
		vo.setNno(this.GetValue("nno"));
		vo.setNkey(this.GetValue("nkey"));
		vo.setNkeynum(this.GetValue("nkeynum"));
	
		this.DBClose();
		return vo;
	}	
	
}
