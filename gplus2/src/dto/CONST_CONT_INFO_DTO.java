package dto;

import java.sql.Date;

/* 공사공종정보 */

public class CONST_CONT_INFO_DTO {
	
	private String const_id;					// 공사ID
	private String cont_cat_id;				// 공종카테고리
	private String quot_prg_stat_cd;		// 견적진행상태코드
	private Date input_expt_dt;				// 투입예정일
	private String quot_expt_cd;			// 견적예가코드
	private int quot_expt_amt;				// 견적예가
	private String quot_met_cd;			// 견적방법코드
	private int quot_met_amt;				// 견적금액
	private String pay_cond_cd;			// 결제조건코드
	private int pay_cond_amt;				// 결제조건
	private String one_linc_yn;				// 단종면허유무
	private int pre_ym_test_amt;			// 전년도시평액
	private Date reg_dt;						// 등록일자
	
	public String getConst_id() {
		return const_id;
	}
	public String getCont_cat_id() {
		return cont_cat_id;
	}
	public String getQuot_prg_stat_cd() {
		return quot_prg_stat_cd;
	}
	public Date getInput_expt_dt() {
		return input_expt_dt;
	}
	public String getQuot_expt_cd() {
		return quot_expt_cd;
	}
	public int getQuot_expt_amt() {
		return quot_expt_amt;
	}
	public String getQuot_met_cd() {
		return quot_met_cd;
	}
	public int getQuot_met_amt() {
		return quot_met_amt;
	}
	public String getPay_cond_cd() {
		return pay_cond_cd;
	}
	public int getPay_cond_amt() {
		return pay_cond_amt;
	}
	public String getOne_linc_yn() {
		return one_linc_yn;
	}
	public int getPre_ym_test_amt() {
		return pre_ym_test_amt;
	}
	public Date getReg_dt() {
		return reg_dt;
	}
	public void setConst_id(String const_id) {
		this.const_id = const_id;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
	}
	public void setQuot_prg_stat_cd(String quot_prg_stat_cd) {
		this.quot_prg_stat_cd = quot_prg_stat_cd;
	}
	public void setInput_expt_dt(Date input_expt_dt) {
		this.input_expt_dt = input_expt_dt;
	}
	public void setQuot_expt_cd(String quot_expt_cd) {
		this.quot_expt_cd = quot_expt_cd;
	}
	public void setQuot_expt_amt(int quot_expt_amt) {
		this.quot_expt_amt = quot_expt_amt;
	}
	public void setQuot_met_cd(String quot_met_cd) {
		this.quot_met_cd = quot_met_cd;
	}
	public void setQuot_met_amt(int quot_met_amt) {
		this.quot_met_amt = quot_met_amt;
	}
	public void setPay_cond_cd(String pay_cond_cd) {
		this.pay_cond_cd = pay_cond_cd;
	}
	public void setPay_cond_amt(int pay_cond_amt) {
		this.pay_cond_amt = pay_cond_amt;
	}
	public void setOne_linc_yn(String one_linc_yn) {
		this.one_linc_yn = one_linc_yn;
	}
	public void setPre_ym_test_amt(int pre_ym_test_amt) {
		this.pre_ym_test_amt = pre_ym_test_amt;
	}
	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}
	

}
