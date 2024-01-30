package mhs.dto;

import java.util.ArrayList;

import mhs.dao.*;
import mhs.vo.*;

public class SimilarityDTO extends DBManager
{	
	public ArrayList<SimilarityVO> GetList(String nno)
	{
		ArrayList<SimilarityVO> list = new ArrayList<SimilarityVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select sno, nkeylist, adkey, adno, nno, similary ";
		sql += "from similarity ";
		sql += "where nno = '" + nno + "' ";
		//작성일 내림차순
		sql += "order by sno ";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			SimilarityVO vo = new SimilarityVO();
			vo.setSno(this.GetValue("sno"));
			vo.setNkeylist(this.GetValue("nkeylist"));
			vo.setAdkey(this.GetValue("adkey"));
			vo.setAdno(this.GetValue("adno"));
			vo.setNno(this.GetValue("nno"));
			vo.setSimilary(this.GetValue("similary"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	public SimilarityVO Read(String nno, String adno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select sno, nkeylist, adkey, adno, nno, similary ";
		sql += "from similarity ";
		sql += "where nno = " + nno + " and adno = " + adno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		SimilarityVO vo = new SimilarityVO();
		vo.setNno(nno);
		vo.setSno(this.GetValue("sno"));
		vo.setNkeylist(this.GetValue("nkeylist"));
		vo.setAdkey(this.GetValue("adkey"));
		vo.setAdno(this.GetValue("adno"));
		vo.setSimilary(this.GetValue("similary"));
	
		this.DBClose();
		return vo;
	}	
}
