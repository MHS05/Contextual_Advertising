package mhs.vo;

public class ClickAdVO 
{
	public String clickadno; //노출정보관리번호
	public String adno;      //광고번호
	public String nno;       //뉴스번호
	public String title;     //제목
	public String cdate;     //노출일
	public String ccount;    //노출횟수
	
	public ClickAdVO()
	{
		clickadno = "";
		adno      = "";
		nno       = "";
		title     = "";
		cdate     = "";
		ccount    = "";
	}

	public String getClickadno() { return clickadno; }
	public String getAdno()      { return adno;      }
	public String getNno()       { return nno;       }
	public String getTitle()     { return title;     }
	public String getCdate()     { return cdate;     }
	public String getCcount()    { return ccount;    }

	public void setClickadno(String clickadno) { this.clickadno = clickadno; }
	public void setAdno(String adno)           { this.adno      = adno;      }
	public void setNno(String nno)             { this.nno       = nno;       }
	public void setTitle(String title)         { this.title     = title;     }
	public void setCdate(String cdate)         { this.cdate     = cdate;     }
	public void setCcount(String ccount)       { this.ccount    = ccount;    }
	
	
	
	
	
	
	
	
	
	
}
