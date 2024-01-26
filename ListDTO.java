//寃���臾쇱�� 紐⑸��� 議고������ �대����
package mhs.dto;

import java.util.*;
import mhs.dao.*;
import mhs.vo.*;

public class ListDTO extends DBManager
{
	//��泥� 寃���臾쇱�� 媛���瑜� �삳����.
	//type : N, F, TY, TE, SY, SE 
	//type : J ���� H 
	//type : F, TY, TE, SY, SE 
	//keyword : 寃��� �ㅼ����
	public int GetTotal(String type,String keyword)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total ";
		sql += "from community ";
		sql += "where type = '" + type + "' ";
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}

		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	//寃���臾쇱�� 紐⑸��� �삳����.
	//type : F, TY, TE, SY, SE 
	//keyword : 寃��� �ㅼ����	
	public ArrayList<CommunityVO> GetList(int pageNo,String type,String keyword)
	{
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select no,title,date(wdate) as wdate,hit,image,";
		sql += "(select name from user where id = community.id) as name, ";
		sql += "(select nickname from user where id = community.id) as nickname, ";
		sql += "(select uno from user where id = community.id) as uno, ";
		sql += "(select count(*) from reply where no = community.no) as count ";
		sql += "from community ";
		sql += "where type = '" + type + "' ";
		//��紐⑹���� 寃���
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}	
		//���깆�� �대┝李⑥��
		sql += "order by no desc ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CommunityVO vo = new CommunityVO();
			vo.setNo(this.GetValue("no"));
			vo.setUno(this.GetValue("uno"));
			vo.setTitle(this.GetValue("title"));
			vo.setWdate(this.GetValue("wdate"));
			vo.setHit(this.GetValue("hit"));
			vo.setImage(this.GetValue("image"));
			vo.setName(this.GetValue("name"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setRecount(this.GetValue("count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	public ArrayList<NewsVO> getnewslist(int pageNo,String category,String keyword)
	{
		ArrayList<NewsVO> list = new ArrayList<NewsVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select * from news ";
		sql += "where category = '" + category + "' ";
		//��紐⑹���� 寃���
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}	
		//���깆�� �대┝李⑥��
		sql += "order by nno desc ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			NewsVO vo = new NewsVO();
			vo.setNno(this.GetValue("nno"));
			vo.setTitle(this.GetValue("title"));
			vo.setWdate(this.GetValue("wdate"));
			vo.setImage(this.GetValue("image"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	public int getnewstotal(String category,String keyword)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total ";
		sql += "from news ";
		sql += "where category = '" + category + "' ";
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}

		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	public int GetuTotal(String isretire, String keyword, String gender)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from user ";
		if(!isretire.equals(""))
		{ 
			sql += "where isretire = '" + isretire + "' ";
		}
		if(isretire.equals("") && !gender.equals(""))
		{ 
			sql += "where gender = '" + gender + "' ";
		}
		if( !isretire.equals("") && !gender.equals("") )
		{
			sql += "and gender = '" + gender + "' ";
		}
		if((!isretire.equals("") || !gender.equals("")) && !keyword.equals(""))
		{
			sql += "and nickname like '%" + _R(keyword) + "%' ";
		}
		if(isretire.equals("") && gender.equals("") && !keyword.equals(""))
		{
			sql += "where nickname like '%" + _R(keyword) + "%' ";
		}
		
		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	//寃���臾쇱�� 紐⑸��� �삳����.
	//type : F, TY, TE, SY, SE 
	//keyword : 寃��� �ㅼ����	
	public ArrayList<UserVO> GetuList(int pageNo,String isretire,String keyword, String newest, String gender)
	{
		ArrayList<UserVO> list = new ArrayList<UserVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select uno,id,date(joindate) as joindate,name,nickname,gender,birth,con,isretire ";
		sql += "from user ";
		//���댁�щ�
		if(!isretire.equals(""))
		{ 
			sql += "where isretire = '" + isretire + "' ";
		}
		if( isretire.equals("") && !gender.equals(""))
		{
			sql += "where gender = '" + gender +"' ";
		}
		if( !isretire.equals("") && !gender.equals("") )
		{
			sql += "and gender = '" + gender +"' ";
		}
		//id���� 寃���
		if((!isretire.equals("") || !gender.equals("")) && !keyword.equals("") )
		{
			sql += "and nickname like '%" + _R(keyword) + "%' ";
		}
		if((isretire.equals("") && gender.equals("")) && !keyword.equals("") )
		{
			sql += "where nickname like '%" + _R(keyword) + "%' ";
		}
		//����踰��몄��
		if(newest.equals("newest"))
		{
			sql += "order by uno desc ";
		} else
		{
			sql += "order by uno ";
		}
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			UserVO vo = new UserVO();
			vo.setUno(this.GetValue("uno"));
			vo.setId(this.GetValue("id"));
			vo.setJoindate(this.GetValue("joindate"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setName(this.GetValue("name"));
			vo.setGender(this.GetValue("gender"));
			vo.setBirth(this.GetValue("birth"));
			vo.setCon(this.GetValue("con"));
			vo.setIsretire(this.GetValue("isretire"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;
	}
	
	//議고���� �������쇰� 由ъ�ㅽ�� 戮�湲�
	public ArrayList<CommunityVO> GetHighHitList(int pageNo,String type,String keyword)
	{
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select no,title,date(wdate) as wdate,hit,";
		sql += "(select name from user where id = community.id) as name, ";
		sql += "(select nickname from user where id = community.id) as nickname, ";
		sql += "(select count(*) from reply where no = community.no) as count ";
		sql += "from community ";
		sql += "where type = '" + type + "' ";
		//��紐⑹���� 寃���
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}	
		//���깆�� �대┝李⑥��
		sql += "order by hit desc ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CommunityVO vo = new CommunityVO();
			vo.setNo(this.GetValue("no"));
			vo.setTitle(this.GetValue("title"));
			vo.setWdate(this.GetValue("wdate"));
			vo.setHit(this.GetValue("hit"));
			vo.setName(this.GetValue("name"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setRecount(this.GetValue("count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	//議고���� �������쇰� 由ъ�ㅽ�� 戮�湲�
	public ArrayList<CommunityVO> GetLowHitList(int pageNo,String type,String keyword)
	{
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select no,title,date(wdate) as wdate,hit,";
		sql += "(select name from user where id = community.id) as name, ";
		sql += "(select nickname from user where id = community.id) as nickname, ";
		sql += "(select count(*) from reply where no = community.no) as count ";
		sql += "from community ";
		sql += "where type = '" + type + "' ";
		//��紐⑹���� 寃���
		if( !keyword.equals("") )
		{
			sql += "and title like '%" + _R(keyword) + "%' ";
		}	
		//���깆�� �대┝李⑥��
		sql += "order by hit ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CommunityVO vo = new CommunityVO();
			vo.setNo(this.GetValue("no"));
			vo.setTitle(this.GetValue("title"));
			vo.setWdate(this.GetValue("wdate"));
			vo.setHit(this.GetValue("hit"));
			vo.setName(this.GetValue("name"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setRecount(this.GetValue("count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	
	public int GetcTotal(String type,String keyword,String tag_age,String tag_pgender, String tag_pcon)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from category ";
		//援щ�(J-JAVA,H-HTML,C-CSS)
		sql += "where ptype = '" + type + "' ";
		if( !keyword.equals("") )
		{
			sql += "and pname like '%" + _R(keyword) + "%' ";
		}	
		if( !tag_age.equals("") )
		{
			sql += "and tag_age = '" + tag_age + "' ";
		}	
		if( !tag_pgender.equals("") )
		{
			sql += "and tag_pgender = '" + tag_pgender + "' ";
		}	
		if( !tag_pcon.equals("") )
		{
			sql += "and tag_pcon = '" + tag_pcon + "' ";
		}

		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	
	//������泥� 湲� 媛��� 援ы��湲�
	public int GetUserCTotal(String uno)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from community ";
		//援щ�(J-JAVA,H-HTML,C-CSS)
		sql += "where uno = '" + uno + "' ";

		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	public int GetUserRTotal(String uno)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from reply ";
		//援щ�(J-JAVA,H-HTML,C-CSS)
		sql += "where uno = '" + uno + "' ";
		
		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	//�������깃� 由ъ�ㅽ�몄�� �닿린
	public ArrayList<CommunityVO> GetUserCList(int pageNo,String uno)
	{
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select no,title,date(wdate) as wdate,hit,";
		sql += "(select name from user where id = community.id) as name, ";
		sql += "(select nickname from user where id = community.id) as nickname, ";
		sql += "(select count(*) from reply where no = community.no) as count ";
		sql += "from community ";
		sql += "where uno = '" + uno + "' ";
		//���깆�� �대┝李⑥��
		sql += "order by no desc ";
		int startno = 10 * (pageNo - 1);
		sql += "limit " + startno + ",10 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CommunityVO vo = new CommunityVO();
			vo.setNo(this.GetValue("no"));
			vo.setTitle(this.GetValue("title"));
			vo.setWdate(this.GetValue("wdate"));
			vo.setHit(this.GetValue("hit"));
			vo.setName(this.GetValue("name"));
			vo.setNickname(this.GetValue("nickname"));
			vo.setRecount(this.GetValue("count"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	//�������� ��湲� 由ъ�ㅽ�몄�� �닿린
		public ArrayList<ReplyVO> GetUserRList(int pageNo,String uno)
		{
			ArrayList<ReplyVO> list = new ArrayList<ReplyVO>();
			
			this.DBOpen();
			
			String sql = "";
			
			sql  = "select rno,no,id,rnote,date(rdate) as rdate,";
			sql += "(select name from user where id = reply.id) as name, ";
			sql += "(select nickname from user where id = reply.id) as nickname, ";
			sql += "(select title from community where no = reply.no) as title ";
			sql += "from reply ";
			sql += "where uno = '" + uno + "' ";
			//���깆�� �대┝李⑥��
			sql += "order by rno desc ";
			int startno = 10 * (pageNo - 1);
			sql += "limit " + startno + ",10 ";		
			this.RunSelect(sql);
			while( this.GetNext() == true)
			{
				ReplyVO vo = new ReplyVO();
				vo.setRno(this.GetValue("rno"));
				vo.setNo(this.GetValue("no"));
				vo.setId(this.GetValue("id"));
				vo.setRnote(this.GetValue("rnote"));
				vo.setRdate(this.GetValue("rdate"));
				vo.setName(this.GetValue("name"));
				vo.setNickname(this.GetValue("nickname"));
				vo.setTitle(this.GetValue("title"));
				
				list.add(vo);
			}		
			this.DBClose();
			
			return list;		
		}
	
	//寃���臾쇱�� 紐⑸��� �삳����.
	//type : J ���� H 
	//keyword : 寃��� �ㅼ����	
	public ArrayList<CategoryVO> GetcList(int pageNo,String ptype,String keyword, String tag_age, String tag_pgender, String tag_pcon)
	{
		ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select pno,pname,age,ppimage,pfimage,age,pgender,pcon,tag_age,tag_pgender,tag_pcon,month_start,month_end ";
		sql += "from category ";
		//援щ�(J-JAVA,H-HTML,C-CSS)
		sql += "where ptype = '" + ptype + "' ";
		//��紐⑹���� 寃���
		if( !keyword.equals("") )
		{
			sql += "and pname like '%" + _R(keyword) + "%' ";
		}	
		if( !tag_age.equals("") )
		{
			sql += "and tag_age = '" + tag_age + "' ";
		}	
		if( !tag_pgender.equals("") )
		{
			sql += "and (tag_pgender = '" + tag_pgender + "' or tag_pgender = '�⑤��遺�臾�') ";
		}	
		if( !tag_pcon.equals("") )
		{
			sql += "and tag_pcon = '" + tag_pcon + "' ";
		}	
		
		//���깆�� �대┝李⑥��
		sql += "order by pno desc ";
		int startno = 6 * (pageNo - 1);
		sql += "limit " + startno + ",6 ";		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CategoryVO vo = new CategoryVO();
			vo.setPno(this.GetValue("pno"));
			vo.setPname(this.GetValue("pname"));
			vo.setAge(this.GetValue("age"));
			vo.setPgender(this.GetValue("pgender"));
			vo.setPcon(this.GetValue("pcon"));
			vo.setTag_age(this.GetValue("tag_age"));
			vo.setTag_pgender(this.GetValue("tag_pgender"));
			vo.setTag_pcon(this.GetValue("tag_pcon"));
			vo.setMonth_start(this.GetValue("month_start"));
			vo.setMonth_end(this.GetValue("month_end"));
			vo.setPpimage(this.GetValue("ppimage"));
			vo.setPfimage(this.GetValue("pfimage"));
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
	public int GetMainTotal(String month)
	{
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select count(*) as total  ";
		sql += "from category ";
		//援щ�(J-JAVA,H-HTML,C-CSS)
		sql += "where (month_start <= month_end";
		sql += " and " + month + " between month_start and month_end) ";
		sql += " or (month_start > month_end";
		sql += " and (" + month + "  between month_start AND 12";
		sql += " OR " + month + " between 1 AND month_end))";
		
		this.RunSelect(sql);
		this.GetNext();				
		int total = Integer.parseInt(this.GetValue("total")); //��泥� �곗�댄�� 媛���
		
		this.DBClose();
		return total;
	}
	
	
	public ArrayList<CategoryVO> GetMainList(int pageNo,String month, int listNum)
	{
		ArrayList<CategoryVO> list = new ArrayList<CategoryVO>();
		
		this.DBOpen();
		
		String sql = "";
		
		sql  = "select pno,pname,ppimage,pfimage,month_start,month_end,info ";
		sql += "from category ";
		sql += "where (month_start <= month_end";
		sql += " and " + month + " between month_start and month_end) ";
		sql += " or (month_start > month_end";
		sql += " and (" + month + "  between month_start AND 12";
		sql += " OR " + month + " between 1 AND month_end))";
		
		//���깆�� �대┝李⑥��
		sql += "order by pno desc ";
		int startno = listNum * (pageNo - 1);
		sql += "limit " + startno + "," + listNum;		
		this.RunSelect(sql);
		while( this.GetNext() == true)
		{
			CategoryVO vo = new CategoryVO();
			vo.setPno(this.GetValue("pno"));
			vo.setPname(this.GetValue("pname"));
			vo.setPpimage(this.GetValue("ppimage"));
			vo.setPfimage(this.GetValue("pfimage"));
			vo.setMonth_start(this.GetValue("month_start"));
			vo.setMonth_end(this.GetValue("month_end"));
			vo.setInfo(this.GetValue("info"));
			
			
			list.add(vo);
		}		
		this.DBClose();
		
		return list;		
	}
	
}