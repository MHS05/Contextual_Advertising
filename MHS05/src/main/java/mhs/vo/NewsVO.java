package mhs.vo;

public class NewsVO 
{
	public String nno;       //뉴스번호
	public String adno;      //광고번호
	public String id;	     //회원아이디
	public String category;  //카테고리
	public String title;     //제목
	public String note;      //내용
	public String wdate;     //작성일
	public String image;     //이미지_논리
	public String phyimage;  //이미지_물리
	public String emotion;   //긍부정
	public String mainyn;    //메인여부
	
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
