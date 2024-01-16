//커뮤니티 정보 클래스
package mhs.vo;

public class CommunityVO
{
	private String no;		//게시물 번호
	private String uno;	    //회원번호
	private String id;	    //회원아이디
	private String title;	//제목
	private String type;    //구분
	private String note;	//내용
	private String phyname; //첨부파일_물리명
	private String fname;	//첨부파일_논리명
	private String wdate;   //조회수
	private String hit; 	//작성일
	private String image; 	//이미지_논리
	private String phyimage;//이미지_물리
		
	
	//추가 변수 설정
	private String name;    //회원이름
	private String nickname;//회원닉네임
	private String recount; //댓글 갯수

	
	public CommunityVO()
	{
		no       = "";
		uno      = "";
		id		 = "";
		title    = "";
		type 	 = "";
		note     = "";
		phyname  = "";
		fname    = "";
		wdate    = "";
		hit      = "";
		image    = ""; 
		phyimage = "";
		name	 = "";
		nickname = "";
		recount  = "";
	}

	//getter
	public String getNo() 		{	return no;		}
	public String getUno() 		{	return uno;		}
	public String getId() 		{	return id;		}
	public String getName()     {   return name;    }
	public String getNickname() {   return nickname;}
	public String getTitle() 	{	return title;	}
	public String getType() 	{	return type;	}
	public String getNote() 	{	return note;	}
	public String getPhyname()  {	return phyname;	}
	public String getFname()  	{	return fname;	}
	public String getWdate() 	{	return wdate;	}
	public String getHit()	 	{	return hit;		}
	public String getImage() 	{	return image;	}
	public String getRecount()  {   return recount; }
	public String getPhyimage() {   return phyimage;}
	
	//setter
	public void setNo(String no) 			{	this.no = no;			 }
	public void setUno(String uno) 			{	this.uno = uno;			 }
	public void setId(String id) 			{	this.id = id;			 }
	public void setTitle(String title) 		{	this.title = title;		 }
	public void setName(String name)        {   this.name = name;	     }
	public void setNickname(String nickname){	this.nickname = nickname;}
	public void setType(String type) 		{	this.type = type;		 }
	public void setNote(String note) 		{	this.note = note;		 }
	public void setPhyname(String phyname)  {	this.phyname = phyname;	 }
	public void setFname(String fname)		{	this.fname = fname;		 }
	public void setWdate(String wdate)	    {	this.wdate = wdate;		 }
	public void setHit(String hit) 			{	this.hit = hit;			 }
	public void setImage(String image) 		{	this.image = image;		 }
	public void setRecount(String recount)  {	this.recount = recount;  }
	public void setPhyimage(String phyimage){	this.phyimage = phyimage;}

}
