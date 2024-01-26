//�Խù� ���� Ŭ����
package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class NewsDTO extends DBManager
{
	//�Խù��� ����Ѵ�.
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

		//��ϵ� ���� ��ȣ�� ��´�.
		sql = "select last_insert_id() as nno ";
		this.RunSelect(sql);
		this.GetNext();
		vo.setNno(this.GetValue("nno"));
		
		this.DBClose();
		return true;		
	}
	
	//���� 1���� ������ ��ȸ�Ѵ�.
	//nno : ���� ��ȣ
	//false - �Խù� ������ ��ȸ
	public NewsVO Read(String nno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select * ";
		sql += "from news where nno = " + nno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//�ش� �Խù� ����.
			this.DBClose();
			return null;
		}
		NewsVO vo = new NewsVO();
		vo.setNno(nno);
		vo.setId(this.GetValue("id"));
		vo.setTitle(this.GetValue("title"));
		vo.setCategory(this.GetValue("category"));
		vo.setNote(this.GetValue("note"));
		vo.setImage(this.GetValue("image"));
		vo.setPhyimage(this.GetValue("Phyimage"));
		vo.setWdate(this.GetValue("wdate"));
		vo.setEmotion(this.GetValue("emotion"));
		vo.setAdno(this.GetValue("adno"));
		
		this.DBClose();
		return vo;
	}
	
	//���� ������ �����Ѵ�.
	public boolean Delete(String nno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from news where nno = " + nno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
}
