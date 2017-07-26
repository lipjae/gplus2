package dto;

import java.sql.Date;

/* 견적참여 */

public class QUOT_JOIN_INFO_DTO {
	
	
	private String cust_comp_id;		// 회원ID
	private String const_id;				// 공사ID
	private String cont_cat_id;			// 공종카테고리
	private String const_like_cd;		// 공사관심유형코드
	private Date quot_join_dt;			// 견적참여일자
		
	public String getCust_comp_id() {
		return cust_comp_id;
	}
	public String getConst_id() {
		return const_id;
	}
	public String getCont_cat_id() {
		return cont_cat_id;
	}
	public String getConst_like_cd() {
		return const_like_cd;
	}
	public Date getQuot_join_dt() {
		return quot_join_dt;
	}
	public void setCust_comp_id(String cust_comp_id) {
		this.cust_comp_id = cust_comp_id;
	}
	public void setConst_id(String const_id) {
		this.const_id = const_id;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
	}
	public void setConst_like_cd(String const_like_cd) {
		this.const_like_cd = const_like_cd;
	}
	public void setQuot_join_dt(Date quot_join_dt) {
		this.quot_join_dt = quot_join_dt;
	}
	
		

}
