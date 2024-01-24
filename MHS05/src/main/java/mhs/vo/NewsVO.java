package mhs.vo;

public class NewsVO 
{
	public String nno;       //������ȣ
	public String ando;      //�����ȣ
	public String category;  //ī����
	public String title;     //����
	public String note;      //����
	public String writer;    //�ۼ���
	public String wdate;     //�ۼ���
	public String fimage;    //�̹���_��
	public String pimage;    //�̹���_����
	public String emotion;   //�����
	
	public NewsVO() 
	{
		ando     = "";
		category = "";
		title    = "";
		note     = "";
		writer   = "";
		wdate    = "";
		fimage   = "";
		pimage   = "";
		emotion  = "";
	}
	
	public String getNno()      {	return nno;	     }
	public String getAndo()     {	return ando;	 }
	public String getCategory() {	return category; }
	public String getTitle()    {	return title;	 }
	public String getNote() 	{	return note;	 }
	public String getWriter()   {	return writer;	 }
	public String getWdate()    {	return wdate;	 }
	public String getFimage()   {	return fimage;	 }
	public String getPimage()   {	return pimage;	 }
	public String getEmotion()  {	return emotion;	 }
	
	
	public void setNno(String nno) 			  {	 this.nno = nno;		   }
	public void setAndo(String ando)          {	 this.ando = ando;	       }
	public void setCategory(String category)  {	 this.category = category; }
	public void setTitle(String title) 		  {	 this.title = title;	   }
	public void setNote(String note) 		  {	 this.note = note;		   }
	public void setWriter(String writer) 	  {	 this.writer = writer;	   }
	public void setWdate(String wdate)		  {	 this.wdate = wdate;	   }
	public void setFimage(String fimage) 	  {	 this.fimage = fimage;	   }
	public void setPimage(String pimage)  	  {	 this.pimage = pimage;	   }
	public void setEmotion(String emotion) 	  {	 this.emotion = emotion;   }
	
}
