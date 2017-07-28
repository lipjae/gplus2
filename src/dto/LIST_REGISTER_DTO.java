package dto;

import java.sql.Date;

public class LIST_REGISTER_DTO {
	
	private int no;
	private Date reg_dt;
	private String bus_nm;
	private Date reg_req_dt;
	private String const_bus_nm;
	private String cont_cat_nm;
	private String rep_mng_nm;
	private String rep_contat_tel_no;
	private String rep_mng_email;
	
	public int getNo() {
		return no;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public String getBus_nm() {
		return bus_nm;
	}
	public Date getReg_req_dt() {
		return reg_req_dt;
	}
	public String getConst_bus_nm() {
		return const_bus_nm;
	}
	public String getCont_cat_nm() {
		return cont_cat_nm;
	}
	public String getRep_mng_nm() {
		return rep_mng_nm;
	}
	public String getRep_contat_tel_no() {
		return rep_contat_tel_no;
	}
	public String getRep_mng_email() {
		return rep_mng_email;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public void setBus_nm(String bus_nm) {
		this.bus_nm = bus_nm;
	}
	public void setReg_req_dt(Date reg_req_dt) {
		this.reg_req_dt = reg_req_dt;
	}
	public void setConst_bus_nm(String const_bus_nm) {
		this.const_bus_nm = const_bus_nm;
	}
	public void setCont_cat_nm(String cont_cat_nm) {
		this.cont_cat_nm = cont_cat_nm;
	}
	public void setRep_mng_nm(String rep_mng_nm) {
		this.rep_mng_nm = rep_mng_nm;
	}
	public void setRep_contat_tel_no(String rep_contat_tel_no) {
		this.rep_contat_tel_no = rep_contat_tel_no;
	}
	public void setRep_mng_email(String rep_mng_email) {
		this.rep_mng_email = rep_mng_email;
	}
	

}
