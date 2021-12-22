package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



import model.BoardDTO;

public class BoardDAO {
	
	Connection conn;
	PreparedStatement pstmt ;
	ResultSet rs ;

	
	public List<BoardDTO> viewList(){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		List<BoardDTO> result= new ArrayList<BoardDTO>();
		
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();

			String sql = "select *, count(cnum) from board b left join comment c on b.bnum = c.bnum group by b.bnum order by b.bnum desc";
			
			pstmt = conn.prepareStatement(sql);

			
			rs = pstmt.executeQuery();	

			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setBnum(rs.getInt("bnum"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setBpassword(rs.getString("bpassword"));
				dto.setBcontent(rs.getString("bcontent"));
				dto.setBwriter(rs.getString("bwriter"));
				dto.setBregdate(rs.getString("bregdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setCount(rs.getString("count(cnum)"));
				
				result.add(dto);
				
				
			}

			return result; 
	            

			
		}catch(Exception ex){
			System.out.println("selectList ï¿½ï¿½ï¿½ï¿½");
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

	

	
	public List<BoardDTO>  selectView(String bnum){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		List<BoardDTO> result= new ArrayList<BoardDTO>();
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
			String sql = "select * FROM board where bnum =?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bnum);
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {
				
				BoardDTO dto = new BoardDTO();
				
				dto.setBnum(rs.getInt("bnum"));
				dto.setBtitle(rs.getString("btitle"));
				dto.setBpassword(rs.getString("bpassword"));
				dto.setBcontent(rs.getString("bcontent"));
				dto.setBwriter(rs.getString("bwriter"));
				dto.setBregdate(rs.getString("bregdate"));
				dto.setViewcnt(rs.getInt("viewcnt"));			
				
				result.add(dto);
				
				
			}
			
			return result;

			
			
			
		}catch(Exception ex){
			System.out.println("selectList ï¿½ï¿½ï¿½ï¿½");
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
	
		
	public List<BoardDTO>  searchView(String bsearch, String selectwt){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		List<BoardDTO> result= new ArrayList<BoardDTO>();
		
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();

			
			
			if(selectwt.equals("ÀÛ¼ºÀÚ")) {
				

				String sql = "select *, count(cnum) from board b left join comment c on b.bnum = c.bnum where bwriter like ? group by b.bnum order by b.bnum desc";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%"+bsearch+"%");
				rs = pstmt.executeQuery();	
				
				while (rs.next()) {
					
					BoardDTO dto = new BoardDTO();
					
					dto.setBnum(rs.getInt("bnum"));
					dto.setBtitle(rs.getString("btitle"));
					dto.setBpassword(rs.getString("bpassword"));
					dto.setBcontent(rs.getString("bcontent"));
					dto.setBwriter(rs.getString("bwriter"));
					dto.setBregdate(rs.getString("bregdate"));
					dto.setViewcnt(rs.getInt("viewcnt"));
					dto.setCount(rs.getString("count(cnum)"));
					
					result.add(dto);
					
					
				}
				
				return result; 
				
				
			}else if(selectwt.equals("Á¦¸ñ")) {
				String sql = "select *, count(cnum) from board b left join comment c on b.bnum = c.bnum where btitle like ? group by b.bnum order by b.bnum desc";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,"%"+bsearch+"%");
				rs = pstmt.executeQuery();	
				
				while (rs.next()) {
					
					BoardDTO dto = new BoardDTO();
					
					dto.setBnum(rs.getInt("bnum"));
					dto.setBtitle(rs.getString("btitle"));
					dto.setBpassword(rs.getString("bpassword"));
					dto.setBcontent(rs.getString("bcontent"));
					dto.setBwriter(rs.getString("bwriter"));
					dto.setBregdate(rs.getString("bregdate"));
					dto.setViewcnt(rs.getInt("viewcnt"));
					dto.setCount(rs.getString("count(cnum)"));
					
					result.add(dto);
					
					
				}
				
				return result;
			}

			
			
			
		}catch(Exception ex){
			System.out.println("searchList ï¿½ï¿½ï¿½ï¿½");
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
	
	

	public int pwCheck(String bnum, int pwCheck){
		
		conn=null;
		pstmt=null;
		rs=null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
			String sql = "select * FROM board where bnum =?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bnum);
			rs = pstmt.executeQuery();	
			
			while (rs.next()) {
				if(rs.getInt("bpassword")==pwCheck) {
					return 1;
				}else {
					return 2;
				}
			
			}
			
	
			
			
		}catch(Exception ex){
			System.out.println("selectList ï¿½ï¿½ï¿½ï¿½");
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
	
	

	
	
	
	
	public int boardInsert( String btitle,String bpassword,String bpw,String bcontent ,String bwriter){
		
		conn=null;
		pstmt=null;
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			

			
			if(bpw.equals("1")){
				
				String sql = "INSERT INTO board(btitle, bcontent, bwriter,bpassword) VALUES(?, ?, ?, ?);";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,btitle);
				pstmt.setString(2,bcontent);
				pstmt.setString(3,bwriter);
				pstmt.setString(4,bpassword);

				
				pstmt.executeUpdate();			
				return 1;
			}else if(bpw.equals("0")){
				
				String sql = "INSERT INTO board(btitle, bcontent, bwriter) VALUES(?, ?, ?)";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,btitle);
				pstmt.setString(2,bcontent);
				pstmt.setString(3,bwriter);

				
				pstmt.executeUpdate();	
				return 1;
			}
					
			
		}catch(Exception ex){
			System.out.println("selectList ï¿½ï¿½ï¿½ï¿½");
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
	
	

	
	
	public int boardUpdate( String btitle,String bpassword,String bpw,String bcontent ,String bwriter, String bnum){
		
		conn=null;
		pstmt=null;
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			
		
			if(bpw.equals("1")){
				
				String sql = "UPDATE board SET btitle=?, bpassword=?, bcontent=?, bwriter=?, bregdate=CURRENT_TIMESTAMP WHERE bnum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,btitle);
				pstmt.setString(2,bpassword);
				pstmt.setString(3,bcontent);
				pstmt.setString(4,bwriter);
				pstmt.setString(5,bnum);

				
				pstmt.executeUpdate();			
				return 1;
			}else if(bpw.equals("0")){
				
				String sql = "UPDATE board SET btitle=?, bpassword=null, bcontent=?, bwriter=?, bregdate=CURRENT_TIMESTAMP WHERE bnum=?";

				System.out.println("==========" + sql);				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,btitle);
				pstmt.setString(2,bcontent);
				pstmt.setString(3,bwriter);
				pstmt.setString(4,bnum);

				
				pstmt.executeUpdate();	
				return 1;
			}
				
			
		}catch(Exception ex){
			System.out.println("updateboard ï¿½ï¿½ï¿½ï¿½");
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
	

	
	
	
	
	public int boardDelete( String bnum){
		
		conn=null;
		pstmt=null;
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
			

				
				String sql = "DELETE FROM board WHERE bnum=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,bnum);


				
				pstmt.executeUpdate();	
				
				
				return 1;
		
					
			
		}catch(Exception ex){
			System.out.println("boardupdate ï¿½ï¿½ï¿½ï¿½");
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
	
	
	
	
	
	
	
	public void updateViews( String bnum){
		
		conn=null;
		pstmt=null;

		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MySQL");	      
			conn = ds.getConnection();
									
			String sql = "update board set viewcnt= viewcnt+1 where bnum =?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,bnum);
			
					
			pstmt.executeUpdate();	
						
			
		}catch(Exception ex){
			System.out.println("updateViews ï¿½ï¿½ï¿½ï¿½");
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
