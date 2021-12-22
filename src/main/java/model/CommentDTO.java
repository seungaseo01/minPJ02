package model;

import javax.print.DocFlavor.STRING;

public class CommentDTO {
	private int cnum;
	private String ccontent;
	private String cwriter;
	private int bnum;
	private String cregdate;

	public CommentDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(int cnum, String ccontent, String cwriter, int bnum, String cregdate) {
		super();
		this.cnum = cnum;
		this.ccontent = ccontent;
		this.cwriter = cwriter;
		this.bnum = bnum;
		this.cregdate = cregdate;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}

	public String getCwriter() {
		return cwriter;
	}

	public void setCwriter(String cwriter) {
		this.cwriter = cwriter;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getCregdate() {
		return cregdate;
	}

	public void setCregdate(String cregdate) {
		this.cregdate = cregdate;
	}

	@Override
	public String toString() {
		return "CommentDTO [cnum=" + cnum + ", ccontent=" + ccontent + ", cwriter=" + cwriter + ", bnum=" + bnum
				+ ", cregdate=" + cregdate + "]";
	}

}
