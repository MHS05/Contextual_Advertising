package mhs.vo;

public class NewsVO 
{
	public String nno;       //������ȣ
	public String adno;      //�����ȣ
	public String id;	     //ȸ�����̵�
	public String category;  //ī�װ�
	public String title;     //����
	public String note;      //����
	public String wdate;     //�ۼ���
	public String image;     //�̹���_��
	public String phyimage;  //�̹���_����
	public String emotion;   //�����
	public String mainyn;    //���ο���
	
	public NewsVO() 
	{
		nno      = "";
		id       = "";
		adno     = "";
		category = "";
		title    = "";
		note     = "";
		wdate    = "";
		image    = "";
		phyimage = "";
		emotion  = "";
	}
	
	public String getNno()      {	return nno;	     }
	public String getAdno()     {	return adno;	 }
	public String getCategory() {	return category; }
	public String getTitle()    {	return title;	 }
	public String getNote() 	{	return note;	 }
	public String getWdate()    {	return wdate;	 }
	public String getImage()    {	return image;	 }
	public String getPhyimage() {	return phyimage; }
	public String getEmotion()  {	return emotion;	 }
	
	
	public void setNno(String nno) 			  {	 this.nno = nno;		   }
	public void setAdno(String adno)          {	 this.adno = adno;	       }
	public void setCategory(String category)  {	 this.category = category; }
	public void setTitle(String title) 		  {	 this.title = title;	   }
	public void setNote(String note) 		  {	 this.note = note;		   }
	public void setWdate(String wdate)		  {	 this.wdate = wdate;	   }
	public void setImage(String image) 	      {	 this.image = image;	   }
	public void setPhyimage(String phyimage)  {	 this.phyimage = phyimage; }
	public void setEmotion(String emotion) 	  {	 this.emotion = emotion;   }

	public String getMainyn() {
		return mainyn;
	}

	public void setMainyn(String mainyn) {
		this.mainyn = mainyn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}
