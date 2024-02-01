package mhs.vo;

public class ClickAdVO 
{
	public String clickadno; //노출정보관리번호
	public String adno;      //광고번호
	public String nno;       //뉴스번호
	public String cdate;     //노출일
	
	public ClickAdVO()
	{
		clickadno = "";
		adno      = "";
		nno       = "";
		cdate     = "";
	}

	public String getClickadno() { return clickadno; }
	public String getAdno()      { return adno;      }
	public String getNno()       { return nno;       }
	public String getCdate()     { return cdate;     }

	public void setClickadno(String clickadno) { this.clickadno = clickadno; }
	public void setAdno(String adno)           { this.adno      = adno;      }
	public void setNno(String nno)             { this.nno       = nno;       }
	public void setCdate(String cdate)         { this.cdate     = cdate;     }
	
	
}
