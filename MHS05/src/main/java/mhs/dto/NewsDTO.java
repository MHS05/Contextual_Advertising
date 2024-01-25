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
	
}
