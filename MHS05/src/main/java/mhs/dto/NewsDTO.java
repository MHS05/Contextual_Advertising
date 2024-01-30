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

		sql += "insert into news (id,category,title,note,image,phyimage,mainyn) ";
		sql += "values (";
		sql += "'" + _R(vo.getId())        + "',";
		sql += "'" + _R(vo.getCategory())  + "',";
		sql += "'" + _R(vo.getTitle())     + "',";
		sql += "'" + _R(vo.getNote())      + "',";
		sql += "'" + _R(vo.getImage())     + "',";
		sql += "'" + _R(vo.getPhyimage())  + "',";
		sql += "'" + _R(vo.getMainyn())    + "'";
		sql += ")";
		this.RunCommand(sql);		

		//등록된 뉴스 번호를 얻는다.
		sql = "select last_insert_id() as nno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNno(this.GetValue("nno"));
		
		this.DBClose();
		return true;		
	}
	
	//뉴스 1개의 정보를 조회한다.
	//nno : 뉴스 번호
	//false - 게시물 정보만 조회
	public NewsVO Read(String nno)
	{
		String sql = "";
		
		this.DBOpen();


		sql  = "select id,adno,title,category,mainyn,image,phyimage,note,emotion,wdate ";
    
		sql += "from news where nno = " + nno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		NewsVO vo = new NewsVO();
		vo.setNno(nno);
		vo.setId(this.GetValue("id"));
		vo.setAdno(this.GetValue("adno"));
		vo.setTitle(this.GetValue("title"));
		vo.setCategory(this.GetValue("category"));
		vo.setMainyn(this.GetValue("mainyn"));
		vo.setNote(this.GetValue("note"));
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("Phyimage"));
		vo.setWdate(this.GetValue("wdate"));
		vo.setEmotion(this.GetValue("emotion"));
		vo.setScore(this.GetValue("score"));
		
		this.DBClose();
		return vo;
	}
	
	//뉴스 정보를 삭제한다.
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
	
	//뉴스 정보를 변경한다.
		public boolean Update(NewsVO vo)
		{
			this.DBOpen();
			
			String sql = "";
			sql  = "update news set ";
			sql += "title='"    + _R(vo.getTitle())    + "',";
			sql += "category='" + _R(vo.getCategory()) + "',";
			sql += "mainyn='"   + _R(vo.getMainyn())   + "',";
			sql += "note='"     + _R(vo.getNote())     + "'";
			if( !vo.getPhyimage().equals(""))
			{
				//이미지파일이 있는 경우
				sql += ", phyimage='" + vo.getPhyimage() + "',";
				sql += "image='"      + vo.getImage()    + "' ";
			}
			sql += " where nno = " + vo.getNno();
			this.RunCommand(sql);
			
			this.DBClose();
			return true;
		}	
	
}
