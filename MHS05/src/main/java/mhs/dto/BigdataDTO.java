package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class BigdataDTO extends DBManager
{
	public boolean Insert(BigdataVO vo)
	{
		this.DBOpen();
		
		String sql = "";

	
		sql += "insert into bigdata ";
		sql += "(adno, similar1, similar2, emotion, fgraph, pgraph, fsgraph, psgraph) ";
		sql += "values (";
		sql += "'" + vo.getAdno()      + "', ";
		sql += "'" + vo.getSimilar1()  + "', ";
		sql += "'" + vo.getSimilar2()  + "', ";
		sql += "'" + vo.getEmotion()   + "', ";
		sql += "'" + vo.getFgraph()    + "', ";
		sql += "'" + vo.getPgraph()    + "', ";
		sql += "'" + vo.getFsgraph()   + "', ";
		sql += "'" + vo.getPsgraph()   + "' ";
		sql += ")";
		this.RunCommand(sql);
		
		sql = "select last_insert_name() as adno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setAdno(this.GetValue("adno"));
		this.DBClose();
		return true;		

	}
	
	public boolean Update(BigdataVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update ad set ";
		sql += "adno='"           + vo.getAdno()           + "', ";
		sql += "no='"             + vo.getNo()             + "', ";
		sql += "similar1='"       + _R(vo.getSimilar1())   + "', ";
		sql += "similar2='"       + _R(vo.getSimilar2())   + "', ";
		sql += "emotion='"        + vo.getEmotion()        + "', ";
		if(!vo.getFgraph().equals(""))
		{
			sql += "fgraph='"     + _R(vo.getFgraph())     + "', ";
			sql += "pgraph='"     + _R(vo.getPgraph())     + "', ";
		}
		if(!vo.getFsgraph().equals(""))
		{
			sql += "fsgraph='"    + _R(vo.getFsgraph())    + "', ";
			sql += "psgraph='"    + _R(vo.getPsgraph())    + "', ";
		}
		
		
		sql += "where adno = "  + vo.getAdno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	
	public boolean Delete(String adno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from bigdata where adno = " + adno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	public BigdataVO Read(String adno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select adno, no, similar1, similar2, emotion, fgraph, pgraph, fsgraph, psgraph ";
		sql += "from bigdata ";
		sql += "where adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		BigdataVO vo = new BigdataVO();
		vo.setAdno(adno);
		vo.setNo(this.GetValue("no"));
		vo.setSimilar1(this.GetValue("similar1"));
		vo.setSimilar2(this.GetValue("smilar2"));
		vo.setEmotion(this.GetValue("emotion"));
		vo.setFgraph(this.GetValue("fgraph"));
		vo.setPgraph(this.GetValue("pgraph"));
		vo.setFsgraph(this.GetValue("fsgraph"));
		vo.setPsgraph(this.GetValue("psgraph"));
	
		this.DBClose();
		return vo;
	}	
}
