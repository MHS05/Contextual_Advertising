package mhs.dto;

import mhs.dao.*;
import mhs.vo.*;

public class SimilarityDTO extends DBManager
{
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
