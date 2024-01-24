package mhs.vo;

public class AdKeywordVO 
{
	public String adkeyno;		//광고키워드관리번호
	public String adno;			//광고번호
	public String adkey;		//광고키워드
	
	public AdKeywordVO()
	{
		
		adkeyno    = "";
		adno 	   = "";
		adkey      = "";
	}

	public String getAdkeyno()  {	return adkeyno;	}
	public String getAdno()  	{	return adno;	}
	public String getAdkey() 	{	return adkey;	}

	
	public void setAdkeyno(String adkeyno)  {	this.adkeyno = adkeyno;	}
	public void setAdno(String adno) 		{	this.adno = adno;		}
	public void setAdkey(String adkey) 		{	this.adkey = adkey;		}
	
	
	
}
