package mhs.vo;

public class AdVO 
{
	public String id;	         //등록자
	public String adno;		   	 //광고번호
	public String adname;		 //상품이름
	public String adkey;		 //상품이름
	public String image;		 //이미지_논리
	public String phyimage;		 //이미지_물리
	
    
	public AdVO()
	{
		id          = "";        
		adno        = "";
		image 	    = "";
		phyimage    = "";
		adname   	= "";
		adkey   	= "";
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

	public String getAdkey() {
		return adkey;
	}

	public void setAdkey(String adkey) {
		this.adkey = adkey;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}