package mhs.vo;

public class AdVO 
{
	public String adno;		   	 //�����ȣ
	public String adname;		 //��ǰ�̸�
	public String image;		 //�̹���_��
	public String phyimage;		 //�̹���_����
	
    
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
