package mhs.dto;

import java.util.ArrayList;

import mhs.dao.*;
import mhs.vo.*;

public class AdKeywordDTO extends DBManager
{
	public boolean Insert(AdKeywordVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into adkeyword ";
		sql += "(adno, adkey) ";
		sql += "values (";
		sql += "'" + vo.getAdno()      + "',";
		sql += "'" + _R(vo.getAdkey()) + "'";
		sql += ")";
		this.RunCommand(sql);

		this.DBClose();
		return true;
	}
	
	public ArrayList<AdKeywordVO> GetList(String adno)
	{
		ArrayList<AdKeywordVO> list = new ArrayList<AdKeywordVO>();
		
		this.DBOpen();
		
		String sql = "";
		sql  = "select adkeyno, adno, adkey ";
		sql += "from adkeyword ";
		sql += "where adno =" + adno ;
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			AdKeywordVO vo = new AdKeywordVO();
			vo.setAdkeyno(this.GetValue("adkeyno"));
			vo.setAdno(this.GetValue("adno"));
			vo.setAdkey(this.GetValue("adkey"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	public AdKeywordVO Read(String adkeyno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select adkeyno, adno, adkey ";
		sql += "from adkeyword ";
		sql += "where adkeyno = " + adkeyno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		AdKeywordVO vo = new AdKeywordVO();
		vo.setAdkeyno(adkeyno);
		vo.setAdno(this.GetValue("adno"));
		vo.setAdkey(this.GetValue("adkey"));
	
		this.DBClose();
		return vo;
	}
	
}
