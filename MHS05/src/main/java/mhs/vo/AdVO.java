package mhs.vo;

import java.util.List;

public class AdVO 
{
	public String adno;		   	    //광고번호
	public String name;				//상품이름
	public String keywords;  	    //키워드
	public String fimage;			//이미지_논리
	public String pimage;			//이미지_물리
	
    
	public AdVO()
	{
		
		adno        = "";
		name   	    = "";
		keywords    = "";
		fimage 	    = "";
		pimage      = "";
	}
	
	//getter
	public String getAdno() 		  {	return adno;		}
	public String getName() 		  {	return name;		}
	public String getKeywords() 	  {	return keywords;	}
	public String getFimage() 		  {	return fimage;		}
	public String getPimage() 		  {	return pimage;		}
	
	//setter
	public void setAdno(String adno) 			   {	this.adno = adno;				}
	public void setName(String name) 			   {	this.name = name;				}
	public void setKeywords(String keywords) 	   {	this.keywords = keywords;		}
	public void setFimage(String fimage)		   {	this.fimage = fimage;			}
	public void setPimage(String pimage)		   {	this.pimage = pimage;			}
	
}
