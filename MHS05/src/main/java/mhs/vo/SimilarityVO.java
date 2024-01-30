package mhs.vo;

public class SimilarityVO 
{
	public String sno;     	 	//유사도관리번호
	public String adno;     	//광고번호
	public String nno;      	//뉴스번호
	public String nkeylist;     //뉴스키워드
	public String similary;    	//유사도
	public String adkey;    	//광고키워드
	
	
	public SimilarityVO() 
	{
		sno     = "";
		adkey   = "";
		adno    = "";
		nno     = "";
		nkeylist= "";
		similary= "";
	}


	public String getSno() 			{	return sno;			}
	public String getNkeylist()     {	return nkeylist;	}
	public String getSimilary()  	{	return similary;	}
	public String getAdkey() 		{	return adkey;		}
	public String getAdno()   		{	return adno;		}
	public String getNno()	    	{	return nno;			}

	
	public void setSno(String sno) 				{	this.sno = sno;				}
	public void setNkeylist(String nkeylist)  	{	this.nkeylist = nkeylist;	}
	public void setSimilary(String similary) 	{	this.similary = similary;	}
	public void setAdkey(String adkey)  		{	this.adkey = adkey;			}
	public void setAdno(String adno)  			{	this.adno = adno;			}
	public void setNno(String nno)		  	    {	this.nno = nno;				}
	
}
