//상품 관리 클래스
package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class CategoryDTO extends DBManager
{
	//상품을 등록한다.
	public boolean Insert(CategoryVO vo)
	{
		this.DBOpen();
		
		String sql = "";

	
		sql += "insert into category ";
		sql += "(ptype, pname, pfimage, ppimage, age, pgender, pcon, link, tag_age, tag_pgender, ";
		sql += "tag_pcon, month_start, month_end, info, takeinfo) ";
		sql += "values (";
		sql += "'" + vo.getPtype()       + "',";
		sql += "'" + _R(vo.getPname())   + "',";
		sql += "'" + vo.getPfimage()     + "',";
		sql += "'" + vo.getPpimage()     + "',";
		sql += "'" + _R(vo.getAge())     + "',";
		sql += "'" + vo.getPgender()     + "',";
		sql += "'" + vo.getPcon()        + "',";
		sql += "'" + vo.getLink()        + "',";
		sql += "'" + vo.getTag_age()     + "',";
		sql += "'" + vo.getTag_pgender() + "',";
		sql += "'" + vo.getTag_pcon()    + "',";
		sql += "'" + vo.getMonth_start() + "',";
		sql += "'" + vo.getMonth_end()   + "',";
		sql += "'" + vo.getInfo()        + "',";
		sql += "'" + vo.getTakeinfo()    + "' ";
		sql += ")";
		this.RunCommand(sql);		
				
		//등록된 상품 번호를 얻는다.
		sql = "select last_insert_id() as pno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setPno(this.GetValue("pno"));
		
		this.DBClose();
		return true;		
	}
	
	
	
	//상품 정보를 변경한다.
	public boolean Update(CategoryVO vo)
	{
		this.DBOpen();
		
		String sql = "";
		sql  = "update category set ";
		sql += "pname='"       + _R(vo.getPname())   + "', ";
		sql += "ptype='"       + vo.getPtype()       + "', ";
		sql += "age='"         + vo.getAge()         + "', ";
		sql += "pgender='"     + vo.getPgender()     + "', ";
		sql += "pcon='"        + vo.getPcon()        + "', ";
		if(!vo.getPfimage().equals(""))
		{
			sql += "pfimage='"     + _R(vo.getPfimage()) + "', ";
			sql += "ppimage='"     + _R(vo.getPpimage()) + "', ";
		}
		sql += "link='"        + vo.getLink()        + "', ";
		sql += "tag_age='"     + vo.getTag_age()     + "', ";
		sql += "tag_pgender='" + vo.getTag_pgender() + "', ";
		sql += "tag_pcon='"    + vo.getTag_pcon()    + "', ";
		sql += "month_start='" + vo.getMonth_start() + "', ";
		sql += "month_end='"   + vo.getMonth_end()   + "', ";
		sql += "calorie='"     + vo.getCalorie()     + "', ";
		sql += "info='"        + vo.getInfo()        + "', ";
		sql += "takeinfo='"    + vo.getTakeinfo()    + "'  ";
		
		
		
		sql += "where pno = "  + vo.getPno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}	
	
	//상품 정보를 삭제한다.
	public boolean Delete(String pno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from category where pno = " + pno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}	
	
	
	//상품 1개의 정보를 조회한다.
	//pno : 상품 번호
	public CategoryVO Read(String pno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select pname,pfimage,ppimage,ptype,age,pgender,pcon, ";
		sql	+= "tag_age,tag_pgender,tag_pcon,info,takeinfo,link,month_start,month_end,calorie ";
		sql += "from   category ";
		sql += "where  pno = " + pno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//해당 게시물 없음.
			this.DBClose();
			return null;
		}
		CategoryVO vo = new CategoryVO();
		vo.setPno(pno);
		vo.setPname(this.GetValue("pname"));
		vo.setPfimage(this.GetValue("pfimage"));
		vo.setPpimage(this.GetValue("ppimage"));
		vo.setPtype(this.GetValue("ptype"));
		vo.setAge(this.GetValue("age"));
		vo.setPgender(this.GetValue("pgender"));
		vo.setPcon(this.GetValue("pcon"));
		vo.setTag_age(this.GetValue("tag_age"));
		vo.setTag_pgender(this.GetValue("tag_pgender"));
		vo.setTag_pcon(this.GetValue("tag_pcon"));
		vo.setInfo(this.GetValue("info"));
		vo.setTakeinfo(this.GetValue("takeinfo"));
		vo.setLink(this.GetValue("link"));
		vo.setMonth_start(this.GetValue("month_start"));
		vo.setMonth_end(this.GetValue("month_end"));
		vo.setCalorie(this.GetValue("calorie"));
		
		this.DBClose();
		return vo;
	}	
}
