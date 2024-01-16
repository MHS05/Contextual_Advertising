//카테고리 정보 클래스
package mhs.vo;

public class CategoryVO 
{
	public String pno;			//상품번호
	public String ptype;		//구분
	public String pname;		//상품명
	public String pfimage;		//이미지_논리
	public String ppimage;		//이미지_물리
	public String age;			//연령
	public String pgender;		//성별
	public String pcon;			//체질
	public String link;			//링크
	public String tag_age;		//태그_나이
	public String tag_pgender;	//태그_성별
	public String tag_pcon;		//태그_체질
	public String month_start;	//월_시작
	public String month_end;	//월_끝
	public String info;			//기본정보
	public String takeinfo;		//섭취정보
	public String calorie;		//칼로리
	
	
	public CategoryVO()
	{
		
		pno         = "";
		ptype       = "";
		pname       = "";
		pfimage 	= "";
		ppimage 	= "";
		age  	    = "";
		pgender     = "";
		pcon   	    = "";
		link        = "";
		tag_age 	= "";
		tag_pgender = "";
		tag_pcon    = "";
		month_start = "";
		month_end   = "";
		info        = "";
		takeinfo    = "";
		calorie     = "";
		
	}
	
	//getter
	public String getPno() 			{	return pno;			}
	public String getPtype() 		{	return ptype;		}
	public String getPname() 		{	return pname;		}
	public String getPfimage() 		{	return pfimage;		}
	public String getPpimage() 		{	return ppimage;		}
	public String getAge() 			{	return age;			}
	public String getPgender() 		{	return pgender;		}
	public String getPcon() 		{	return pcon;		}
	public String getLink() 		{	return link;		}
	public String getTag_age() 		{	return tag_age;		}
	public String getTag_pgender() 	{	return tag_pgender;	}
	public String getTag_pcon()		{	return tag_pcon;	}
	public String getMonth_start() 	{	return month_start;	}
	public String getMonth_end()	{	return month_end;	}
	public String getInfo() 		{	return info;		}
	public String getTakeinfo() 	{	return takeinfo;	}
	public String getCalorie() 		{	return calorie;		}
	
	//setter
	public void setPno(String pno) 					{	this.pno = pno;					}
	public void setPtype(String ptype) 				{	this.ptype = ptype;				}
	public void setPname(String pname) 				{	this.pname = pname;				}
	public void setPfimage(String pfimage) 			{	this.pfimage = pfimage;			}
	public void setPpimage(String ppimage) 			{	this.ppimage = ppimage;			}
	public void setAge(String age) 			   		{	this.age = age;					}
	public void setPgender(String pgender) 			{	this.pgender = pgender;			}
	public void setPcon(String pcon)			    {	this.pcon = pcon;				}
	public void setLink(String link) 				{	this.link = link;				}
	public void setTag_age(String tag_age) 			{	this.tag_age = tag_age;			}
	public void setTag_pgender(String tag_pgender) 	{	this.tag_pgender = tag_pgender;	}
	public void setTag_pcon(String tag_pcon) 		{	this.tag_pcon = tag_pcon;		}
	public void setMonth_start(String month_start)  {	this.month_start = month_start;	}
	public void setMonth_end(String month_end)		{	this.month_end = month_end;		}
	public void setInfo(String info)				{	this.info = info;				}
	public void setTakeinfo(String takeinfo) 		{	this.takeinfo = takeinfo;		}
	public void setCalorie(String calorie) 			{	this.calorie = calorie;			}
	
	
	
}
