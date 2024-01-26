package mhs.vo;

public class NewsKeywordVO 
{
	public String nkeyno;	//뉴스키워드관리번호
	public String nno;		//뉴스번호
	public String nkey;	    //뉴스키워드
	public String nkeynum;	//키워드빈도수
	
	public NewsKeywordVO()
	{
		
		nkeyno 	  = "";
		nno 	  = "";
		nkey      = "";
		nkeynum   = "";
	}
	
	public String getNkeyno() 	{		return nkeyno;	}
	public String getNno() 		{		return nno;	    }
	public String getNkey() 	{		return nkey;	}
	public String getNkeynum()  {		return nkeynum;	}
	
	
	public void setNkeyno(String nkeyno) 	{		this.nkeyno = nkeyno;	}
	public void setNno(String nno) 			{		this.nno = nno;			}
	public void setNkey(String nkey) 		{		this.nkey = nkey;		}
	public void setNkeynum(String nkeynum)  {		this.nkeynum = nkeynum;	}
	
}
