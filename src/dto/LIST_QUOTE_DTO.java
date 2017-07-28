package dto;

import java.sql.Date;

public class LIST_QUOTE_DTO {
	private int no;
	private Date quot_join_dt;
	private String comp_nm;
	private String cont_cat_nm;
	private String mng_nm;
	private String wire_tel_no;
	private String wirel_tel_no;
	private String emai_addr;
	private String place_nm;
	
	public int getNo() {
		return no;
	}
	public Date getQuot_join_dt() {
		return quot_join_dt;
	}
	public String getComp_nm() {
		return comp_nm;
	}
	public String getCont_cat_nm() {
		return cont_cat_nm;
	}
	public String getMng_nm() {
		return mng_nm;
	}
	public String getWire_tel_no() {
		return wire_tel_no;
	}
	public String getWirel_tel_no() {
		return wirel_tel_no;
	}
	public String getEmai_addr() {
		return emai_addr;
	}
	public String getPlace_nm() {
		return place_nm;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setQuot_join_dt(Date quot_join_dt) {
		this.quot_join_dt = quot_join_dt;
	}
	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}
	public void setCont_cat_nm(String cont_cat_nm) {
		this.cont_cat_nm = cont_cat_nm;
	}
	public void setMng_nm(String mng_nm) {
		this.mng_nm = mng_nm;
	}
	public void setWire_tel_no(String wire_tel_no) {
		this.wire_tel_no = wire_tel_no;
	}
	public void setWirel_tel_no(String wirel_tel_no) {
		this.wirel_tel_no = wirel_tel_no;
	}
	public void setEmai_addr(String emai_addr) {
		this.emai_addr = emai_addr;
	}
	public void setPlace_nm(String place_nm) {
		this.place_nm = place_nm;
	}

}
