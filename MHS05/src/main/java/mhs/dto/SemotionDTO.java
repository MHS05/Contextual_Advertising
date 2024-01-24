package mhs.dto;

import java.util.ArrayList;

import mhs.dao.*;
import mhs.vo.*;


public class SemotionDTO extends DBManager
{
	public ArrayList<SemotionVO> GetList(String nno)
	{
		ArrayList<SemotionVO> list = new ArrayList<SemotionVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select senno, nno, sentance, emotion, score ";
		sql += "from semotion ";
		sql += "where nno = '" + nno + "' ";
		//작성일 내림차순
		sql += "order by no senno";
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			SemotionVO vo = new SemotionVO();
			vo.setSenno(this.GetValue("senno"));
			vo.setNno(this.GetValue("nno"));
			vo.setSentance(this.GetValue("sentance"));
			vo.setEmotion(this.GetValue("emotion"));
			vo.setScore(this.GetValue("score"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	public SemotionVO Read(String nno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select senno, nno, sentance, emotion, score ";
		sql += "from semotion ";
		sql += "where nno = " + nno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			this.DBClose();
			return null;
		}
		
		SemotionVO vo = new SemotionVO();
		vo.setNno(nno);
		vo.setSenno(this.GetValue("senno"));
		vo.setSentance(this.GetValue("sentance"));
		vo.setEmotion(this.GetValue("emotion"));
		vo.setScore(this.GetValue("score"));
	
		this.DBClose();
		return vo;
	}	
}
