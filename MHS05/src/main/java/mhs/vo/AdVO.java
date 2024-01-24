package mhs.vo;

public class AdVO 
{
	public String adno;		   	    //광고번호
	public String name;				//상품명
	public String fimage;			//이미지_논리
	public String pimage;			//이미지_물리
	
    
	public AdVO()
	{
		
		adno        = "";
		fimage 	    = "";
		pimage      = "";
		name   	    = "";
	}
	
	//getter
	public String getAdno() 		  {	return adno;		}
	public String getFimage() 		  {	return fimage;		}
	public String getPimage() 		  {	return pimage;		}
	public String getName() 		  {	return name;		}
	
	//setter
	public void setAdno(String adno) 			   {	this.adno = adno;				}
	public void setFimage(String fimage)		   {	this.fimage = fimage;			}
	public void setPimage(String pimage)		   {	this.pimage = pimage;			}
	public void setName(String name) 			   {	this.name = name;				}
	
}
