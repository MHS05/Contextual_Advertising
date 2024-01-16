package mhs.dto;

import mhs.vo.*;

import java.util.ArrayList;

import mhs.dao.*;
import mhs.vo.*;

public class ReplyDTO extends DBManager
{
	//댓글을 등록한다.
	public boolean Insert(ReplyVO vo)
	{
		this.DBOpen();

		//댓글을 Insert 한다.
		String sql = "";
		sql += "insert into reply (no,uno,id,rnote) values ";
		sql += "('" + vo.getNo() + "','" + vo.getUno() + "','" + vo.getId() + "','" +_R(vo.getRnote()) + "') ";
		this.RunCommand(sql);		
		
		//등록된 댓글의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setRno(this.GetValue("no"));		
		
		this.DBClose();
		return true;
	}
	
	public boolean Update(ReplyVO vo)
	{
		this.DBOpen();
		
		//댓글을 Insert 한다.
		String sql = "";
		sql += "update reply ";
		sql += "set rnote = '" + _R(vo.getRnote()) + "' ";
		sql += "where no=" + vo.getNo() + " and rno=" + vo.getRno();
		this.RunCommand(sql);		
		
		//등록된 댓글의 번호를 얻는다.
		sql = "select last_insert_id() as no ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setRno(this.GetValue("no"));		
		
		this.DBClose();
		return true;
	}
	
	//댓글을 삭제한다.
	public boolean Delete(String rno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from reply where rno = " + rno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;		
	}
		
	//댓글의 목록을 조회한다.
	public ArrayList<ReplyVO> GetList(String no)
	{
		ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
		
		this.DBOpen();
		
		String sql = "";
		sql  = "select rno,uno,id,date(rdate) as rdate,rnote, ";
		sql += "(select name from user where id = reply.id) as rname, ";
		sql += "(select nickname from user where id = reply.id) as rnickname ";
		sql += "from reply ";
		sql += "where no = " + no + " ";
		sql += "order by rno ";
		this.RunSelect(sql);
		while(this.GetNext() == true)
		{
			ReplyVO vo = new ReplyVO();
			vo.setRno(this.GetValue("rno"));
			vo.setNo(no);
			vo.setUno(this.GetValue("uno"));
			vo.setId(this.GetValue("id"));
			vo.setRnote(this.GetValue("rnote"));
			vo.setRdate(this.GetValue("rdate"));
			vo.setName(this.GetValue("rname"));
			vo.setNickname(this.GetValue("rnickname"));
			
			list.add(vo);
		}
		
		this.DBClose();
		return list;
	}
	
	
}
