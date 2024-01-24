package mhs.vo;

public class SimilarityVO 
{
	public String sno;      //유사도관리번호
	public String adkeyno;  //광고키워드관리번호
	public String nkeyno;   //뉴스키워드관리번호
	public String nkey;     //뉴스키워드
	public String adkey;    //광고키워드
	public String adno;     //광고번호
	public String nno;      //뉴스번호
	
	
	public SimilarityVO() 
	{
		sno     = "";
		adkeyno = "";
		nkeyno  = "";
		nkey    = "";
		adkey   = "";
		adno    = "";
		nno     = "";
	}


	public String getSno() 		{	return sno;		}
	public String getAdkeyno()  {	return adkeyno;	}
	public String getNkeyno() 	{	return nkeyno;	}
	public String getNkey()  	{	return nkey;	}
	public String getAdkey() 	{	return adkey;	}
	public String getAdno()   	{	return adno;	}
	public String getNno()	    {	return nno;		}

	
	public void setSno(String sno) 			{	this.sno = sno;			}
	public void setAdkeyno(String adkeyno)  {	this.adkeyno = adkeyno;	}
	public void setNkeyno(String nkeyno) 	{	this.nkeyno = nkeyno;	}
	public void setNkey(String nkey)	    {	this.nkey = nkey;		}
	public void setAdkey(String adkey)  	{	this.adkey = adkey;		}
	public void setAdno(String adno)  		{	this.adno = adno;		}
	public void setNno(String nno)		    {	this.nno = nno;			}
	
}
