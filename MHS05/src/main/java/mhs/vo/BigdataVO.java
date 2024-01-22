package mhs.vo;

public class BigdataVO 
{
	//빅데이터 테이블
	public String adno;		    //광고번호
	public String no;		    //게시글번호
	public String similar1;		//유사도1
	public String similar2;		//유사도2
	public String emotion;		//감정
	public String fgraph;		//긍부정그래프_논리
	public String pgraph;		//긍부정그래프_물리
	public String fsgraph;		//유사도그래프_논리
	public String psgraph;		//유사도그래프_물리
	
	public BigdataVO()
	{
		adno        = "";
		no          = "";
		similar1    = "";
		similar2    = "";
		emotion     = "";
		fgraph 	    = "";
		pgraph 	    = "";
		fsgraph     = "";
		psgraph     = "";
	
	}

	public String getAdno() {
		return adno;
	}

	public String getNo() {
		return no;
	}

	public void setAdno(String adno) {
		this.adno = adno;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getSimilar1() {
		return similar1;
	}

	public String getSimilar2() {
		return similar2;
	}

	public String getEmotion() {
		return emotion;
	}

	public String getFgraph() {
		return fgraph;
	}

	public String getPgraph() {
		return pgraph;
	}

	public String getFsgraph() {
		return fsgraph;
	}

	public String getPsgraph() {
		return psgraph;
	}

	public void setSimilar1(String similar1) {
		this.similar1 = similar1;
	}

	public void setSimilar2(String similar2) {
		this.similar2 = similar2;
	}

	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}

	public void setFgraph(String fgraph) {
		this.fgraph = fgraph;
	}

	public void setPgraph(String pgraph) {
		this.pgraph = pgraph;
	}

	public void setFsgraph(String fsgraph) {
		this.fsgraph = fsgraph;
	}

	public void setPsgraph(String psgraph) {
		this.psgraph = psgraph;
	}
}
