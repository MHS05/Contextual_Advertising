package mhs.vo;

public class SimilarityVO 
{
	public String sno;     	 	//���絵������ȣ
	public String adno;     	//�����ȣ
	public String nno;      	//������ȣ
	public String nkeylist;     //����Ű����
	public String similary;    	//���絵
	public String adkey;    	//����Ű����
	
	
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
