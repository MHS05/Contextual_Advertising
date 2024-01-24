package mhs.vo;

public class AdVO 
{
	public String adno;		   	 //광고번호
	public String adname;		 //상품이름
	public String image;		 //이미지_논리
	public String phyimage;		 //이미지_물리
	
    
	public AdVO()
	{
		
		adno        = "";
		image 	    = "";
		phyimage      = "";
		adname   	    = "";
	}
	
	//getter
	public String getAdno() 		  {	return adno;		}
	public String getImage() 		  {	return image;		}
	public String getPhyimage() 	  {	return phyimage;	}
	public String getAdname() 		  {	return adname;		}
	
	//setter
	public void setAdno(String adno) 			  {		this.adno = adno;			}
	public void setImage(String image)		   	  {		this.image = image;			}
	public void setPhyimage(String phyimage)	  {		this.phyimage = phyimage;	}
	public void setAdname(String adname) 		  {		this.adname = adname;		}
	
}
