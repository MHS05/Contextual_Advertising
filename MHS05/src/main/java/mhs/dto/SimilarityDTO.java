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
		
		sql  = "select sno, adkeyno, nkeyno, nkey, adkey, adno ";
		sql += "from similarity ";
		sql += "where nno = '" + nno + "' ";
		//작성일 내림차순
		sql += "order by sno ";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			SimilarityVO vo = new SimilarityVO();
			vo.setSno(this.GetValue("sno"));
			vo.setAdkeyno(this.GetValue("adkeyno"));
			vo.setNkeyno(this.GetValue("nkeyno"));
			vo.setNkey(this.GetValue("nkey"));
			vo.setAdkey(this.GetValue("adkey"));
			vo.setAdno(this.GetValue("adno"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	public SimilarityVO Read(String nno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select sno, adkeyno, nkeyno, nkey, adkey, adno, nno ";
		sql += "from similarity ";
		sql += "where nno = " + nno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		SimilarityVO vo = new SimilarityVO();
		vo.setNno(nno);
		vo.setSno(this.GetValue("sno"));
		vo.setAdkey(this.GetValue("adkeyno"));
		vo.setNkeyno(this.GetValue("nkeyno"));
		vo.setNkey(this.GetValue("nkey"));
		vo.setAdkey(this.GetValue("adkey"));
		vo.setAdno(this.GetValue("adno"));
	
		this.DBClose();
		return vo;
	}	
}
