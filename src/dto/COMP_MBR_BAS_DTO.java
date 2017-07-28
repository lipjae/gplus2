package dto;

import java.sql.Date;

/*회원사 테이블*/

public class COMP_MBR_BAS_DTO {
	
	private String cust_comp_id;			// 회원사ID
	private String comp_nm;					// 회사명
	private String cont_cat_id;				// 공종카테고리ID
	private String mng_nm;					// 담당자명
	private String pass_no;					// 비밀번호
	private String wire_tel_no;				// 유선전화
	private String wirel_tel_no;				// 무선전화
	private String emai_addr;				// 이메일주소
	private String veri_no;					// 인증번호
	private String join_type_cd;			// 가입유형코드
	private Date join_dt;						// 가입일
	private String cust_reg_stat_cd;		// 회원등록상태코드
	private String bus_cat;					// 주요업종
	public String getCust_comp_id() {
		return cust_comp_id;
	}
	public String getComp_nm() {
		return comp_nm;
	}
	public String getCont_cat_id() {
		return cont_cat_id;
	}
	public String getMng_nm() {
		return mng_nm;
	}
	public String getPass_no() {
		return pass_no;
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
	public String getVeri_no() {
		return veri_no;
	}
	public String getJoin_type_cd() {
		return join_type_cd;
	}
	public Date getJoin_dt() {
		return join_dt;
	}
	public String getCust_reg_stat_cd() {
		return cust_reg_stat_cd;
	}
	public String getBus_cat() {
		return bus_cat;
	}
	public void setCust_comp_id(String cust_comp_id) {
		this.cust_comp_id = cust_comp_id;
	}
	public void setComp_nm(String comp_nm) {
		this.comp_nm = comp_nm;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
	}
	public void setMng_nm(String mng_nm) {
		this.mng_nm = mng_nm;
	}
	public void setPass_no(String pass_no) {
		this.pass_no = pass_no;
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
	public void setVeri_no(String veri_no) {
		this.veri_no = veri_no;
	}
	public void setJoin_type_cd(String join_type_cd) {
		this.join_type_cd = join_type_cd;
	}
	public void setJoin_dt(Date join_dt) {
		this.join_dt = join_dt;
	}
	public void setCust_reg_stat_cd(String cust_reg_stat_cd) {
		this.cust_reg_stat_cd = cust_reg_stat_cd;
	}
	public void setBus_cat(String bus_cat) {
		this.bus_cat = bus_cat;
	}
	
	
}
