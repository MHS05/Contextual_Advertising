package mhs.vo;

public class AdVO 
{
	public String id;	         //�����
	public String adno;		   	 //�����ȣ
	public String adname;		 //��ǰ�̸�
	public String adkey;		 //����Ű����
	public String image;		 //�̹���_��
	public String phyimage;		 //�̹���_����
	
    
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
	
	public String getId() 			  {	return id;			}
	public String getAdkey() 		  {	return adkey;		}
	public String getAdno() 		  {	return adno;		}
	public String getImage() 		  {	return image;		}
	public String getPhyimage() 	  {	return phyimage;	}
	public String getAdname() 		  {	return adname;		}
	
	//setter
	public void setId(String id) 				  {		this.id = id;			    }
	public void setAdkey(String adkey) 			  {		this.adkey = adkey;			}
	public void setAdno(String adno) 			  {		this.adno = adno;			}
	public void setImage(String image)		   	  {		this.image = image;			}
	public void setPhyimage(String phyimage)	  {		this.phyimage = phyimage;	}
	public void setAdname(String adname) 		  {		this.adname = adname;		}
}