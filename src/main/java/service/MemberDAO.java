package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import model.BoardDTO;
import model.MemberDTO;


public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt ;
	ResultSet rs ;

public List<MemberDTO> memberList(){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		List<MemberDTO> result= new ArrayList<MemberDTO>();
		
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();

			String sql = "select * from member order by mnum desc";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();	

			while (rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				dto.setMnum(rs.getInt("mnum"));
				dto.setMid(rs.getString("mid"));
				dto.setAdmin(rs.getString("admin"));
				dto.setMname(rs.getString("mname"));
				dto.setMpassword(rs.getString("mpassword"));
				dto.setMtel(rs.getString("mtel"));
				dto.setMbirth(rs.getString("mbirth"));
				dto.setMemail(rs.getString("memail"));
				dto.setMgender(rs.getString("mgender"));
				dto.setMregdate(rs.getString("mregdate"));
				
				result.add(dto);
			
			}

			return result; 
	            

			
		}catch(Exception ex){
			System.out.println("selectMemberList 占쏙옙占쏙옙");
			ex.printStackTrace();
		}finally {
	         try {
	             rs.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             pstmt.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             conn.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }
	       
	    	return null;
		
	}
	
	
	

public List<MemberDTO> selectMember(String mid){
	
	conn=null;
	pstmt=null;
	rs=null;
	
	List<MemberDTO> result= new ArrayList<MemberDTO>();
	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
		conn = ds.getConnection();
		
		String sql = "select * from member where mid = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, mid);
		
		rs = pstmt.executeQuery();	
		
		while (rs.next()) {
			
			MemberDTO dto = new MemberDTO();
			dto.setMnum(rs.getInt("mnum"));
			dto.setMid(rs.getString("mid"));
			dto.setAdmin(rs.getString("admin"));
			dto.setMname(rs.getString("mname"));
			dto.setMpassword(rs.getString("mpassword"));
			dto.setMtel(rs.getString("mtel"));
			dto.setMbirth(rs.getString("mbirth"));
			dto.setMemail(rs.getString("memail"));
			dto.setMgender(rs.getString("mgender"));
			dto.setMregdate(rs.getString("mregdate"));
			
			result.add(dto);
			
		}
		
		return result; 
		
		
		
	}catch(Exception ex){
		System.out.println("selectCommentList 占쏙옙占쏙옙");
		ex.printStackTrace();
	}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return null;
	
}


public List<MemberDTO>  searchView(String selectwt, String msearch){
	
	conn=null;
	pstmt=null;
	rs=null;
	
	List<MemberDTO> result= new ArrayList<MemberDTO>();
	
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
		conn = ds.getConnection();

		
		
		if(selectwt.equals("아이디")) {
			

			String sql = "select * from member  where mid like ?  order by mnum desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+msearch+"%");
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setMnum(rs.getInt("mnum"));
				dto.setMid(rs.getString("mid"));
				dto.setAdmin(rs.getString("admin"));
				dto.setMname(rs.getString("mname"));
				dto.setMpassword(rs.getString("mpassword"));
				dto.setMtel(rs.getString("mtel"));
				dto.setMbirth(rs.getString("mbirth"));
				dto.setMemail(rs.getString("memail"));
				dto.setMgender(rs.getString("mgender"));
				dto.setMregdate(rs.getString("mregdate"));
				
				result.add(dto);
				
				
			}
			
			return result; 
			
			
		}else if(selectwt.equals("권한")) {
			
			String sql = "select * from member  where admin like ?  order by mnum desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%"+msearch+"%");
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {
				
				MemberDTO dto = new MemberDTO();
				
				dto.setMnum(rs.getInt("mnum"));
				dto.setMid(rs.getString("mid"));
				dto.setAdmin(rs.getString("admin"));
				dto.setMname(rs.getString("mname"));
				dto.setMpassword(rs.getString("mpassword"));
				dto.setMtel(rs.getString("mtel"));
				dto.setMbirth(rs.getString("mbirth"));
				dto.setMemail(rs.getString("memail"));
				dto.setMgender(rs.getString("mgender"));
				dto.setMregdate(rs.getString("mregdate"));
				
				result.add(dto);
				
				
			}
			
			return result;
		}

		
		
		
	}catch(Exception ex){
		System.out.println("searchList 占쏙옙占쏙옙");
		ex.printStackTrace();
	}finally {
		try {
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	return null;
	
}




	public int idChecker(String newID){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		try{
			 Context init = new InitialContext();
		     DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
		     conn = ds.getConnection();

			String sql = "select * from member where mid = ?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,newID);
				
			rs = pstmt.executeQuery();	
	
			if(rs.next()) {
				return 1;
			}else if(newID.equals("")) {
				return 2;
			}else {
				return 0;
			}
			

		}catch(Exception ex){
			System.out.println("占쏙옙占싱듸옙占� 占쏙옙占쏙옙");
	         ex.printStackTrace();
		}finally {
	         try {
	             rs.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             pstmt.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             conn.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }
	       
	       return -1;
	    

	}
	
	public int joinMember(String newID, String mname, String mpassword, String mtel, String mbirth, String memail, String mgender){
		
		conn=null;
		pstmt=null;


		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			String sql = "INSERT INTO member(mid, mname, mpassword, mtel, mbirth, memail, mgender) VALUES(?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,newID);
			pstmt.setString(2,mname);
			pstmt.setString(3,mpassword);
			pstmt.setString(4,mtel);
			pstmt.setString(5,mbirth);
			pstmt.setString(6,memail);
			pstmt.setString(7,mgender);
			
			pstmt.executeUpdate();	
			
			return 1;
		}catch(Exception ex){
			System.out.println("회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
			ex.printStackTrace();
		}finally {			
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			return -1;		
	}
	
	
	
	
	
	
	public int updateMember(String mid, String mname, String mpassword, String mtel, String mbirth, String memail, String mgender){
		
		conn=null;
		pstmt=null;
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			String sql = "UPDATE member SET mname=?, mpassword=?, mbirth=?, memail=?, mtel=?, mgender=?, mregdate=CURRENT_TIMESTAMP WHERE mid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,mname);
			pstmt.setString(2,mpassword);
			pstmt.setString(3,mbirth);
			pstmt.setString(4,memail);
			pstmt.setString(5,mtel);
			pstmt.setString(6,mgender);
			pstmt.setString(7,mid);
			
			pstmt.executeUpdate();	
			
			return 1;
		}catch(Exception ex){
			System.out.println("회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
			ex.printStackTrace();
		}finally {			
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	
	
	
	
	   public void memberListDelete(String[] chkArr) {
		      
		      conn = null;
		      pstmt = null;
		      
		      
		      try {
		         Context init = new InitialContext();
		         DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");
		         
		         conn = ds.getConnection();
		         
		         String sql = "DELETE FROM member WHERE mnum=?";
		         
		         pstmt = conn.prepareStatement(sql);
		         
		         
		         for(int i = 0; i<chkArr.length; i++) {
		         
		            pstmt.setString(1, chkArr[i]);
		            pstmt.addBatch();
		            pstmt.executeUpdate(); 
		            
		         }
		         
		         
		      } catch(Exception e) {
		         System.out.println(e.getMessage());
		         System.out.println("delete 占쏙옙占쏙옙");
		         e.printStackTrace();
		      } finally {
		         try {
		            pstmt.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		         try {
		            conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		      
		   }
	
	
	
	public int deleteMember(String mid){
		
		conn=null;
		pstmt=null;
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			String sql = "DELETE FROM member WHERE mid=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,mid);
		
			pstmt.executeUpdate();	
			
			return 1;
		}catch(Exception ex){
			System.out.println("회占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙");
			ex.printStackTrace();
		}finally {			
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	
	
	
	
	
	public int memberLogin(String mid, String mpassword){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();

			String sql = "select * from member where mid = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,mid);

			
			rs = pstmt.executeQuery();	

		
		  if (rs.next()) {
	            
	            if(mid.equals(rs.getString("mid"))){
	               if(mpassword.equals(rs.getString("mpassword"))) {
	                  return 1;
	               }else {
	                  return 2;
	               }
	            }
	            
	         }else {
	            

	            return -1;
	         }   

		}catch(Exception ex){
			System.out.println("占싸깍옙占쏙옙 占쏙옙占쏙옙");
			ex.printStackTrace();
		}finally {
	         try {
	             rs.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             pstmt.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	          try {
	             conn.close();
	          } catch (SQLException e) {
	             e.printStackTrace();
	          }
	       }
	       
	       return -1;
	    
		
	}
	
	
	
	
	

	
	
	
	
	
	
}
