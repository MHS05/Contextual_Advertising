package mhs.vo;

public class ClickAdVO 
{
	public String clickadno; //��������������ȣ
	public String adno;      //�����ȣ
	public String nno;       //������ȣ
	public String cdate;     //������
	
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
