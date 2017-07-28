package dto;

import java.sql.Date;

public class LIST_MEMBER_DTO {

	private int no;
	private String cust_comp_id;
	private Date join_dt;
	private String comp_nm;
	private String cont_cat_id;
	private String cont_cat_nm;
	private String mng_nm;
	private String wire_tel_no;
	private String wirel_tel_no;
	private String emai_addr;
	private String cust_reg_stat_cd;
	private String cd_nm;
	
	public int getNo() {
		return no;
	}
	public String getCust_comp_id() {
		return cust_comp_id;
	}
	public Date getJoin_dt() {
		return join_dt;
	}
	public String getComp_nm() {
		return comp_nm;
	}
	public String getCont_cat_id() {
		return cont_cat_id;
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
	public String getCust_reg_stat_cd() {
		return cust_reg_stat_cd;
	}
	public String getCd_nm() {
		return cd_nm;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setCust_comp_id(String cust_comp_id) {
		this.cust_comp_id = cust_comp_id;
	}
	public void setJoin_dt(Date join_dt) {
		this.join_dt = join_dt;
	}
	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
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
	public void setCust_reg_stat_cd(String cust_reg_stat_cd) {
		this.cust_reg_stat_cd = cust_reg_stat_cd;
	}
	public void setCd_nm(String cd_nm) {
		this.cd_nm = cd_nm;
	}


}
