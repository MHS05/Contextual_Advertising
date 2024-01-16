//게시물 관리 클래스
package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class CommunityDTO extends DBManager
{
	//게시물을 등록한다.
	public boolean Insert(CommunityVO vo)
	{
		this.DBOpen();
		
		String sql = "";

		sql += "insert into community (id,uno,title,type,note,image,phyimage,phyname,fname) ";
		sql += "values ('" + vo.getId() + "','" + vo.getUno() + "','" + _R(vo.getTitle()) + "','" + vo.getType() + "','" + _R(vo.getNote()) + "',";
		if( !vo.getImage().equals(""))
		{
			sql += "'" + vo.getImage() + "','" + vo.getPhyimage() + "',";
		}else
		{
			sql += "null,null,";
		}
		if( !vo.getPhyname().equals(""))
		{
			//첨부파일이 있는 경우
			sql += "'" + vo.getPhyname() + "','" + vo.getFname() + "') ";
		}else
		{
			sql += "null,null) ";
		}
		this.RunCommand(sql);

		//등록된 게시물 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNo(this.GetValue("no"));
		
		this.DBClose();
		return true;		
	}
	
	//게시물 정보를 변경한다.
	public boolean Update(CommunityVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update community set ";
		sql += "title='" + _R(vo.getTitle()) + "',";
		sql += "type='" + vo.getType() + "',";
		sql += "note='" + _R(vo.getNote()) + "'";
		if( !vo.getPhyimage().equals(""))
		{
			//이미지파일이 있는 경우
			sql += ", phyimage='" + vo.getPhyimage() + "',";
			sql += "image='" + vo.getImage() + "' ";
		}
		if( !vo.getPhyname().equals(""))
		{
			//첨부파일이 있는 경우
			sql += ", phyname='" + vo.getPhyname() + "',";
			sql += "fname='" + vo.getFname() + "' ";
		}
		sql += " where no = " + vo.getNo();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	//게시물 정보를 삭제한다.
	public boolean Delete(String no)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from reply where no = " + no;
		this.RunCommand(sql);

		sql = "delete from community where no = " + no;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}	
	
	
	//게시물 1개의 정보를 조회한다.
	//no : 게시물 번호
	//ishit : true - 조회수 증가, false - 게시물 정보만 조회
	public CommunityVO Read(String no,boolean ishit)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select id,uno,title,type,note,image,phyimage,phyname,fname,wdate,hit, ";
		sql += "(select name from user where id = community.id) as name, ";
		sql += "(select nickname from user where id = community.id) as nickname ";
		sql += "from community where no = " + no;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		CommunityVO vo = new CommunityVO();
		vo.setNo(no);
		vo.setUno(this.GetValue("uno"));
		vo.setId(this.GetValue("id"));
		vo.setTitle(this.GetValue("title"));
		vo.setType(this.GetValue("type"));
		vo.setNote(this.GetValue("note"));
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("Phyimage"));
		vo.setPhyname(this.GetValue("phyname"));
		vo.setFname(this.GetValue("fname"));
		vo.setWdate(this.GetValue("wdate"));
		vo.setHit(this.GetValue("hit"));
		vo.setName(this.GetValue("name"));
		vo.setNickname(this.GetValue("nickname"));
		
		//조회수 증가 처리
		if(ishit == true)
		{
			sql = "update community set hit = hit + 1 where no = " + no;
			this.RunCommand(sql);			
		}
		
		this.DBClose();
		return vo;
	}	
}
