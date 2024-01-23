//댓글 정보 클래스
package mhs.vo;

public class ReplyVO 
{
	private String rno;    	 //댓글번호
	private String no;    	 //게시물번호
	private String uno;   	 //회원번호
	private String id;    	 //회원아이디
	private String rnote; 	 //댓글내용
	private String rdate;  	 //작성일
	
	//추가 변수 설정
	private String name;     //회원이름	
	private String nickname; //회원닉네임	
	private String title;    //글제목	
	
	
	public ReplyVO()
	{
		rno      = "";
		no       = "";
		uno      = "";
		id       = "";
		rnote    = "";
		rdate    = "";	
		name     = "";
		nickname = "";
		title    = "";
	}

	//getter
	public String getRno()   	 { return rno;	 }
	public String getNo()     	 { return no;	 }
	public String getUno()    	 { return uno;	 }
	public String getId()        { return id;	 }
	public String getRnote()     { return rnote; }
	public String getRdate()     { return rdate; }
	public String getName()      { return name;	 }
	public String getNickname()  { return nickname;	 }
	public String getTitle()     { return title;	 }

	//setter
	public void setRno(String rno)    		   { this.rno = rno;		   }
	public void setNo(String no)     		   { this.no = no;	     	   }
	public void setUno(String uno)     		   { this.uno = uno;		   }
	public void setId(String id)      	       { this.id = id;	     	   }
	public void setRnote(String rnote)	       { this.rnote = rnote; 	   }
	public void setRdate(String rdate)         { this.rdate = rdate;  	   }
	public void setName(String name)   		   { this.name = name;		   }
	public void setNickname(String nickname)   { this.nickname = nickname; }
	public void setTitle(String title)  	   { this.title = title;	   }
}
