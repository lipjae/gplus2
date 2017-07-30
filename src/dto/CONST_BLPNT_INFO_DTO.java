package dto;

/* 공사도면 */

public class CONST_BLPNT_INFO_DTO {
	
	private String const_id;			// 공사ID
	private String cont_cat_id;		// 공종카테고리ID
	private int cont_seq_no;			// 순번
	private String bl_prnt_nm;		// 도면명
	private String bl_prnt_url;		// 도면 URL
	
	public String getConst_id() {
		return const_id;
	}
	public String getCont_cat_id() {
		return cont_cat_id;
	}
	public int getCont_seq_no() {
		return cont_seq_no;
	}
	public String getBl_prnt_nm() {
		return bl_prnt_nm;
	}
	public String getBl_prnt_url() {
		return bl_prnt_url;
	}
	public void setConst_id(String const_id) {
		this.const_id = const_id;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
	}
	public void setCont_seq_no(int cont_seq_no) {
		this.cont_seq_no = cont_seq_no;
	}
	public void setBl_prnt_nm(String bl_prnt_nm) {
		this.bl_prnt_nm = bl_prnt_nm;
	}
	public void setBl_prnt_url(String bl_prnt_url) {
		this.bl_prnt_url = bl_prnt_url;
	}

		
	
}
