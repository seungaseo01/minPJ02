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
import model.CommentDTO;

public class CommentDAO {
	Connection conn;
	PreparedStatement pstmt ;
	ResultSet rs ;
	

	public List<CommentDTO> commentList(String bnum){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		List<CommentDTO> result= new ArrayList<CommentDTO>();
		
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();

			String sql = "select * from comment where bnum =? order by cnum desc";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bnum);
			
			rs = pstmt.executeQuery();	

			while (rs.next()) {
				
				CommentDTO dto = new CommentDTO();

				dto.setCnum(rs.getInt("cnum"));
				dto.setCcontent(rs.getString("ccontent"));
				dto.setCwriter(rs.getString("cwriter"));
				dto.setCregdate(rs.getString("cregdate"));
				dto.setBnum(rs.getInt("bnum"));
				
				result.add(dto);
				
			}

			return result; 
	            

			
		}catch(Exception ex){
			System.out.println("selectCommentList 실패");
			ex.printStackTrace();
		}finally {
	         try {
	             rs.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	          try {
	             pstmt.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	          try {
	             conn.close();
	          } catch (Exception e) {
	             e.printStackTrace();
	          }
	       }
	       
	    	return null;
		
	}
	
	public void commentInsert(int bnum,String cwriter,String ccontent){
		
		conn=null;
		pstmt=null;

		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
			String sql = "INSERT INTO comment(ccontent, cwriter, bnum) VALUES(?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, ccontent);
			pstmt.setString(2, cwriter);
			pstmt.setInt(3, bnum);
			
			pstmt.executeUpdate();	
			
	
		}catch(Exception ex){
			System.out.println("insertComment 실패");
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
		
	
		
	}
	
	
	public void commentdelete(String cnum){
		
		conn=null;
		pstmt=null;
		
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
			String sql = "DELETE FROM comment WHERE cnum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cnum);
	
			
			pstmt.executeUpdate();	
			
			
		}catch(Exception ex){
			System.out.println("deleteComment 실패");
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
		
		
		
	}
	
	
	public void commentupdate(String cnum){
		
		conn=null;
		pstmt=null;
		
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
			String sql = "DELETE FROM comment WHERE cnum=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, cnum);
			
			
			pstmt.executeUpdate();	
			
			
		}catch(Exception ex){
			System.out.println("deleteComment 실패");
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
		
		
		
	}
	
	
	
	
	
}
