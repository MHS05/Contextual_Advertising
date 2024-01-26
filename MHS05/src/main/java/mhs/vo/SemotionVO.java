package mhs.vo;

public class SemotionVO 
{
	public String senno;		   	//문장별감정관리번호
	public String nno;				//뉴스번호
	public String sentance;			//문장
	public String emotion;			//긍부정여부
	public String score;			//긍부정점수
	
	public SemotionVO() 
	{
		nno      = "";
		sentance = "";
		emotion  = "";
		score    = "";
	}
	
	
	public String getSenno()	 {	 return senno;		}
	public String getNno() 		 {	 return nno;		}
	public String getSentance()  {	 return sentance;	}
	public String getEmotion()   {	 return emotion;	}
	public String getScore()     {	 return score;		}
	
	
	public void setSenno(String senno) 		  {		this.senno = senno;			}
	public void setNno(String nno) 			  {		this.nno = nno;				}
	public void setSentance(String sentance)  {		this.sentance = sentance;	}
	public void setEmotion(String emotion)	  {		this.emotion = emotion;		}
	public void setScore(String score) 		  {		this.score = score;			}	
	
	
}
