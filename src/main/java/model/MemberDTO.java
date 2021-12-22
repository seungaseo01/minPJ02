package model;

public class MemberDTO {

	private int mnum;
	private String mid;
	private String admin;
	private String mname;
	private String mpassword;
	private String mtel;
	private String mbirth;
	private String memail;
	private String mgender;
	private String mpreference;
	private String mregdate;

	public int getMnum() {
		return mnum;
	}

	public void setMnum(int mnum) {
		this.mnum = mnum;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMpassword() {
		return mpassword;
	}

	public void setMpassword(String mpassword) {
		this.mpassword = mpassword;
	}

	public String getMtel() {
		return mtel;
	}

	public void setMtel(String mtel) {
		this.mtel = mtel;
	}

	public String getMbirth() {
		return mbirth;
	}

	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMgender() {
		return mgender;
	}

	public void setMgender(String mgender) {
		this.mgender = mgender;
	}

	public String getMpreference() {
		return mpreference;
	}

	public void setMpreference(String mpreference) {
		this.mpreference = mpreference;
	}

	public String getMregdate() {
		return mregdate;
	}

	public void setMregdate(String mregdate) {
		this.mregdate = mregdate;
	}

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(int mnum, String mid, String admin, String mname, String mpassword, String mtel, String mbirth,
			String memail, String mgender, String mpreference, String mregdate) {
		super();
		this.mnum = mnum;
		this.mid = mid;
		this.admin = admin;
		this.mname = mname;
		this.mpassword = mpassword;
		this.mtel = mtel;
		this.mbirth = mbirth;
		this.memail = memail;
		this.mgender = mgender;
		this.mpreference = mpreference;
		this.mregdate = mregdate;
	}

	@Override
	public String toString() {
		return "MemberDTO [mnum=" + mnum + ", mid=" + mid + ", admin=" + admin + ", mname=" + mname + ", mpassword="
				+ mpassword + ", mtel=" + mtel + ", mbirth=" + mbirth + ", memail=" + memail + ", mgender=" + mgender
				+ ", mpreference=" + mpreference + ", mregdate=" + mregdate + "]";
	}

}
