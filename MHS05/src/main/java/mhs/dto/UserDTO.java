//회원정보 관리 클래스
package mhs.dto;

import mhs.vo.*;
import mhs.dao.*;

public class UserDTO extends DBManager
{
	//아이디 중복 검사
	//리턴값 : true - 중복된 ID, false - 중복이 안된 ID
	public boolean CheckID(String id)
	{
		String sql = "";
		this.DBOpen();
		sql  = "select id ";
		sql += "from   user ";
		sql += "where  id = '" + this._R(id) + "' ";
		this.RunSelect(sql);
		if(this.GetNext() == true)
		{
			//아이디가 있음
			this.DBClose();
			return true;
		}
		//아이디가 없음
		this.DBClose();
		return false;
		
	}
	
	public boolean CheckPW(String pw)
	{
		String sql = "";
		this.DBOpen();
		sql = "select id from user where pw = md5('" + this._R(pw) + "') ";
		this.RunSelect(sql);
		if(this.GetNext() == true)
		{
			//비밀번호가 있음
			this.DBClose();
			return true;
		}
		//비밀번호가 없음
		this.DBClose();
		return false;
	}
	
	//닉네임 중복 검사
	//리턴값 : true - 중복된 ID, false - 중복이 안된 ID
	public boolean CheckNick(String nick)
	{
		String sql = "";
		this.DBOpen();
		sql = "select id from user where nickname ='" + this._R(nick) + "' ";
		this.RunSelect(sql);
		if(this.GetNext() == true)
		{
			//닉네임이 있음
			this.DBClose();
			return true;
		}
		//닉네임이 없음
		this.DBClose();
		return false;
		
	}
	//이름 중복 검사
	//리턴값 : true - 있는 이름 , false - 없는 이름
	public boolean CheckName(String name)
	{
		String sql = "";
		this.DBOpen();
		sql = "select name from user where name ='" + this._R(name) + "' ";
		this.RunSelect(sql);
		if(this.GetNext() == true)
		{
			//이름이 있음
			this.DBClose();
			return true;
		}
		//이름이 없음
		this.DBClose();
		return false;
		
	}
	
	//이메일 중복 검사
	//리턴값 : true - 중복된 email, false - 중복이 안된 email
	public boolean CheckEmail(String email)
	{
		String sql = "";
		this.DBOpen();
		sql = "select id from user where email ='" + this._R(email) + "' ";
		this.RunSelect(sql);
		if(this.GetNext() == true)
		{
			//이메일이 있음
			this.DBClose();
			return true;
		}
		//이메일이 없음
		this.DBClose();
		return false;
		
	}
	//회원가입 처리
	//리턴값 : true - 가입성공, false - 가입실패
	public boolean Join(UserVO vo)
	{
		//중복된 아이디 인지 검사한다.
		if(CheckID(vo.getId()) == true)
		{
			return false;
		}
		
		//중복된 아이디 인지 검사한다.
		if(CheckNick(vo.getNickname()) == true)
		{
			return false;
		}
		
		this.DBOpen();
			
		//회원정보를 Insert 한다.
		String sql = "";
		sql  = "insert into user (id,pw,name,nickname,gender,birth,email,con) ";
		sql += "values (";
		sql += "'" + _R(vo.getId()) + "',";
		sql += "md5('" + _R(vo.getPw()) + "'),";
		sql += "'" + _R(vo.getName()) + "',";
		sql += "'" + _R(vo.getNickname()) + "',";
		sql += "'" + _R(vo.getGender()) + "',";
		sql += "'" + _R(vo.getBirth()) + "',";
		sql += "'" + _R(vo.getEmail()) + "',";
		sql += "'" + _R(vo.getCon()) + "'";
		sql += ") ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	
	//회원 로그인 처리
	public UserVO Login(String id,String pw)
	{
		String sql = "";
		this.DBOpen();
		sql  = "select id,name,gender,con,birth,uno,email,nickname,pw ";
		sql += "from user ";
		sql += "where id = '" + _R(id) + "' and pw = md5('" + _R(pw) + "') ";
		//탈퇴회원은 제외
		sql += "and isretire = 'N' ";
		this.RunSelect(sql);
		if(this.GetNext() == false)
		{
			//해당 회원 정보가 없음.
			this.DBClose();
			return null;
		}
		UserVO vo = new UserVO();
		vo.setId(id);
		vo.setUno(this.GetValue("uno"));
		vo.setEmail(this.GetValue("email"));
		vo.setNickname(this.GetValue("nickname"));
		vo.setPw(this.GetValue("pw"));
		vo.setName(this.GetValue("name"));
		vo.setGender(this.GetValue("gender"));
		vo.setCon(this.GetValue("con"));
		vo.setBirth(this.GetValue("birth"));
		this.DBClose();
		return vo;
	}
	
	//관리자 페이지에서 회원정보 가져오기
	public UserVO memberInfo(String uno)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "select id,name,nickname,gender,birth,email,con,date(joindate) as joindate,isretire, ";
		sql += "(select count(*) from community where id = user.id) as cocount, ";
		sql += "(select count(*) from reply where id = user.id) as recount ";
		sql += "from user ";
		sql += "where uno = " + uno;
		this.RunSelect(sql);
		if(this.GetNext() == false)
		{
			//해당 회원 정보가 없음.
			this.DBClose();
			return null;
		}
		
		UserVO vo = new UserVO();
		vo.setUno(uno);
		vo.setId(this.GetValue("id"));
		vo.setName(this.GetValue("name"));
		vo.setNickname(this.GetValue("nickname"));
		vo.setGender(this.GetValue("gender"));
		vo.setBirth(this.GetValue("birth"));
		vo.setEmail(this.GetValue("email"));
		vo.setCon(this.GetValue("con"));
		vo.setJoindate(this.GetValue("joindate"));
		vo.setIsretire(this.GetValue("isretire"));
		vo.setCocount(this.GetValue("cocount"));
		vo.setRecount(this.GetValue("recount"));

		this.DBClose();
		
		return vo;
	}
	
	public boolean membermodify(String uno, String nickname, String isretire)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "nickname = '" + _R(nickname) + "', ";
		sql += "isretire = '" + isretire + "' ";
		sql += "where uno = " + uno;
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean Delete(String uno)
	{
		this.DBOpen();
		
		String sql = "";

		sql = "delete from reply where uno = " + uno;
		this.RunCommand(sql);

		sql = "delete from community where uno = " + uno;
		this.RunCommand(sql);
		
		sql = "delete from user where uno = " + uno;
		this.RunCommand(sql);
		
		this.DBClose();
		
		return true;
	}
	
	//회원 1명의 정보를 조회한다.
	//uno : 회원 번호
	public UserVO Read(String uno)
	{
		String sql = "";
		
		this.DBOpen();

		sql  = "select id,name,nickname,gender,birth,email,con,joindate,isretire ";
		sql += "from user where uno = " + uno;
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//해당 유저 없음.
			this.DBClose();
			return null;
		}
		UserVO vo = new UserVO();
		vo.setUno     (uno);
		vo.setId      (this.GetValue("id"));
		vo.setName    (this.GetValue("name"));
		vo.setNickname(this.GetValue("nickname"));
		vo.setGender  (this.GetValue("gender"));
		vo.setBirth   (this.GetValue("birth"));
		vo.setEmail   (this.GetValue("email"));
		vo.setCon     (this.GetValue("con"));
		vo.setJoindate(this.GetValue("joindate"));
		vo.setIsretire(this.GetValue("isretire"));

		this.DBClose();
		
		return vo;
	}
	
	//회원 1명의 정보를 조회한다.
	//name : 회원 이름
	public UserVO readname(String name)
	{
		String sql = "";
		
		this.DBOpen();
		
		sql  = "select id,name,nickname,gender,birth,email,con,joindate,isretire ";
		sql += "from user ";
		sql += "where name = '" + _R(name) + "' ";
		this.RunSelect(sql);
		if( this.GetNext() == false)
		{
			//해당 유저 없음.
			this.DBClose();
			return null;
		}
		UserVO vo = new UserVO();
		vo.setId      (this.GetValue("id"));
		vo.setName    (this.GetValue("name"));
		vo.setNickname(this.GetValue("nickname"));
		vo.setGender  (this.GetValue("gender"));
		vo.setBirth   (this.GetValue("birth"));
		vo.setEmail   (this.GetValue("email"));
		vo.setCon     (this.GetValue("con"));
		vo.setJoindate(this.GetValue("joindate"));
		vo.setIsretire(this.GetValue("isretire"));
		
		this.DBClose();
		
		return vo;
	}
	
	
	public boolean pwmodify(UserVO vo)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "pw=md5('" + _R(vo.getPw()) + "') ";
		sql += "where uno = " + vo.getUno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean loginpwmodify(String id, String pw)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "pw=md5('" + _R(pw) + "') ";
		sql += "where id = '" + _R(id) + "' ";
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean nickmodify(UserVO vo)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "nickname = '" + _R(vo.getNickname()) + "' ";
		sql += "where uno = " + vo.getUno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean conmodify(UserVO vo)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "con = '" + _R(vo.getCon()) + "', ";
		sql += "nickname = '" + _R(vo.getNickname()) + "' ";
		sql += "where uno = " + vo.getUno();
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
	
	public boolean isretiremodify(String uno, String isretire)
	{
		this.DBOpen();
		
		//회원정보 업데이트
		String sql = "";
		sql  = "update user set ";
		sql += "isretire = '" + isretire + "' ";
		sql += "where uno = " + uno;
		this.RunCommand(sql);
		
		this.DBClose();
		return true;
	}
}
