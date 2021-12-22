package model;

import java.util.Date;

public class BoardDTO {
	private int bnum;
	private String btitle;
	private String bpassword;
	private String bcontent;
	private String bwriter;
	private String bregdate;
	private String count;
	private int viewcnt;

	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int bnum, String btitle, String bpassword, String bcontent, String bwriter, String bregdate,
			String count, int viewcnt) {
		super();
		this.bnum = bnum;
		this.btitle = btitle;
		this.bpassword = bpassword;
		this.bcontent = bcontent;
		this.bwriter = bwriter;
		this.bregdate = bregdate;
		this.count = count;
		this.viewcnt = viewcnt;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBpassword() {
		return bpassword;
	}

	public void setBpassword(String bpassword) {
		this.bpassword = bpassword;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getBregdate() {
		return bregdate;
	}

	public void setBregdate(String bregdate) {
		this.bregdate = bregdate;
	}

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "BoardDTO [bnum=" + bnum + ", btitle=" + btitle + ", bpassword=" + bpassword + ", bcontent=" + bcontent
				+ ", bwriter=" + bwriter + ", bregdate=" + bregdate + ", count=" + count + ", viewcnt=" + viewcnt + "]";
	}

}
