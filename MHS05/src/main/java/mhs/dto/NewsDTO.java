//게시물 관리 클래스
package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class NewsDTO extends DBManager
{
	//게시물을 등록한다.
	public boolean Insert(NewsVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into news (category,title,note,writer,fimage,pimage) ";
		sql += "values (";
		sql += "'" + vo.getCategory()    + "',";
		sql += "'" + _R(vo.getTitle())   + "',";
		sql += "'" + _R(vo.getNote())    + "',";
		sql += "'" + vo.getWriter()      + "',";
		sql += "'" + _R(vo.getFimage())  + "',";
		sql += "'" + _R(vo.getPimage())  + "'";
		sql += ")";
		this.RunCommand(sql);		

		//등록된 게시물 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNno(this.GetValue("no"));
		
		this.DBClose();
		return true;		
	}
	
}
