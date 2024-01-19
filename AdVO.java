package mhs.vo;

import java.util.List;

public class AdVO 
{
	public String adno;		   	    //광고번호
	public List<String> keywords;   //키워드 리스트
	public String link;			    //링크
	public String fimage;			//이미지_논리
	public String pimage;			//이미지_물리
	public String type;				//상품타입
	public String name;				//상품명
	public String date_start;		//등록일
	public String date_end;	    	//만기일
	public String modify_time;		//수정일
	
    
	public AdVO()
	{
		
		adno        = "";
		keywords    = null;
		link 	    = "";
		fimage 	    = "";
		pimage      = "";
		type        = "";
		name   	    = "";
		link        = "";
		date_start  = "";
		date_end    = "";	
		modify_time = "";
	}
	
	//getter
	public String getAdno() 		  {	return adno;		}
	public List<String> getKeywords() {	return keywords;	}
	public String getLink() 		  {	return link;		}
	public String getFimage() 		  {	return fimage;		}
	public String getPimage() 		  {	return pimage;		}
	public String getType() 		  {	return type;		}
	public String getName() 		  {	return name;		}
	public String getDate_start() 	  {	return date_start;	}
	public String getDate_end() 	  { return date_end;	}
	public String getModify_time() 	  {	return modify_time;	}
	
	//setter
	public void setAdno(String adno) 			   {	this.adno = adno;				}
	public void setKeywords(List<String> keywords) {	this.keywords = keywords;		}
	public void setLink(String link) 			   {	this.link = link;				}
	public void setFimage(String fimage)		   {	this.fimage = fimage;			}
	public void setPimage(String pimage)		   {	this.pimage = pimage;			}
	public void setType(String type) 			   {	this.type = type;				}
	public void setName(String name) 			   {	this.name = name;				}
	public void setDate_start(String date_start)   {	this.date_start = date_start;	}
	public void setDate_end(String date_end) 	   {	this.date_end = date_end;		}	
	public void setModify_time(String modify_time) {	this.modify_time = modify_time;	}	
	
}
