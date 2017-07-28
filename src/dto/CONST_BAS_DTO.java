package dto;

import java.sql.Date;

/* 공사기본 */

public class CONST_BAS_DTO {
	private String const_id;					// 공사ID
	private String bus_nm;					// 사업명
	private String place_nm;					// 현장명
	private String cont_zone_cd;			// 권역코드
	private int tot_area_no;					// 연면적
	private String place_loc;					// 현장위치
	private String bus_area_loc;			// 사업지위치
	private String cont_strut_cd;			// 건축구조코드
	private String cont_size;					// 건축규모
	private int grnd_area_no;				// 대지면적
	private int const_area_no;				// 건축면적
	private int flor_area_rat;				// 건폐율
	private int use_area_rat;				// 용적률
	private int prk_no;						// 주차대수
	private String const_bus_nm;			// 건설사명
	private String rep_mng_nm;			// 대표담당자명
	private String rep_contat_tel_no;		// 대표연락처
	private String add_info;					// 추가정보
	private Date reg_dt;						// 공사등록일자
	private Date reg_req_dt;					// 등록요청일자
	private String rep_mng_email;			//대표담당자EMAIL
	private float lati_pos;					//위도
	private float longi_pos;					//경도
	private int mng_join_cnt;			//관리자 카운트
	public String getConst_id() {
		return const_id;
	}
	public String getBus_nm() {
		return bus_nm;
	}
	public String getPlace_nm() {
		return place_nm;
	}
	public String getCont_zone_cd() {
		return cont_zone_cd;
	}
	public int getTot_area_no() {
		return tot_area_no;
	}
	public String getPlace_loc() {
		return place_loc;
	}
	public String getBus_area_loc() {
		return bus_area_loc;
	}
	public String getCont_strut_cd() {
		return cont_strut_cd;
	}
	public String getCont_size() {
		return cont_size;
	}
	public int getGrnd_area_no() {
		return grnd_area_no;
	}
	public int getConst_area_no() {
		return const_area_no;
	}
	public int getFlor_area_rat() {
		return flor_area_rat;
	}
	public int getUse_area_rat() {
		return use_area_rat;
	}
	public int getPrk_no() {
		return prk_no;
	}
	public String getConst_bus_nm() {
		return const_bus_nm;
	}
	public String getRep_mng_nm() {
		return rep_mng_nm;
	}
	public String getRep_contat_tel_no() {
		return rep_contat_tel_no;
	}
	public String getAdd_info() {
		return add_info;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public Date getReg_req_dt() {
		return reg_req_dt;
	}
	public String getRep_mng_email() {
		return rep_mng_email;
	}
	public float getLati_pos() {
		return lati_pos;
	}
	public float getLongi_pos() {
		return longi_pos;
	}
	public int getMng_join_cnt() {
		return mng_join_cnt;
	}
	public void setConst_id(String const_id) {
		this.const_id = const_id;
	}
	public void setBus_nm(String bus_nm) {
		this.bus_nm = bus_nm;
	}
	public void setPlace_nm(String place_nm) {
		this.place_nm = place_nm;
	}
	public void setCont_zone_cd(String cont_zone_cd) {
		this.cont_zone_cd = cont_zone_cd;
	}
	public void setTot_area_no(int tot_area_no) {
		this.tot_area_no = tot_area_no;
	}
	public void setPlace_loc(String place_loc) {
		this.place_loc = place_loc;
	}
	public void setBus_area_loc(String bus_area_loc) {
		this.bus_area_loc = bus_area_loc;
	}
	public void setCont_strut_cd(String cont_strut_cd) {
		this.cont_strut_cd = cont_strut_cd;
	}
	public void setCont_size(String cont_size) {
		this.cont_size = cont_size;
	}
	public void setGrnd_area_no(int grnd_area_no) {
		this.grnd_area_no = grnd_area_no;
	}
	public void setConst_area_no(int const_area_no) {
		this.const_area_no = const_area_no;
	}
	public void setFlor_area_rat(int flor_area_rat) {
		this.flor_area_rat = flor_area_rat;
	}
	public void setUse_area_rat(int use_area_rat) {
		this.use_area_rat = use_area_rat;
	}
	public void setPrk_no(int prk_no) {
		this.prk_no = prk_no;
	}
	public void setConst_bus_nm(String const_bus_nm) {
		this.const_bus_nm = const_bus_nm;
	}
	public void setRep_mng_nm(String rep_mng_nm) {
		this.rep_mng_nm = rep_mng_nm;
	}
	public void setRep_contat_tel_no(String rep_contat_tel_no) {
		this.rep_contat_tel_no = rep_contat_tel_no;
	}
	public void setAdd_info(String add_info) {
		this.add_info = add_info;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	public void setReg_req_dt(Date reg_req_dt) {
		this.reg_req_dt = reg_req_dt;
	}
	public void setRep_mng_email(String rep_mng_email) {
		this.rep_mng_email = rep_mng_email;
	}
	public void setLati_pos(float lati_pos) {
		this.lati_pos = lati_pos;
	}
	public void setLongi_pos(float longi_pos) {
		this.longi_pos = longi_pos;
	}
	public void setMng_join_cnt(int mng_join_cnt) {
		this.mng_join_cnt = mng_join_cnt;
	}
	
	
	
}
