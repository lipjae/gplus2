package dto;

/*공종카테고리*/

public class CONT_CAT_INFO_DTO {
	
	private String cont_cat_id;			// 공종카테고리ID
	private String cont_cat_nm;		// 카테고리명
	private String cat_cd;           		// 카테고리구분코드
	private String det_cat_cd;       	// 상세카테고리구분코드
	private int cat_lvl;       				// 카테고리레벨
	
	public String getCont_cat_id() {
		return cont_cat_id;
	}
	public String getCont_cat_nm() {
		return cont_cat_nm;
	}
	public String getCat_cd() {
		return cat_cd;
	}
	public String getDet_cat_cd() {
		return det_cat_cd;
	}
	public int getCat_lvl() {
		return cat_lvl;
	}
	public void setCont_cat_id(String cont_cat_id) {
		this.cont_cat_id = cont_cat_id;
	}
	public void setCont_cat_nm(String cont_cat_nm) {
		this.cont_cat_nm = cont_cat_nm;
	}
	public void setCat_cd(String cat_cd) {
		this.cat_cd = cat_cd;
	}
	public void setDet_cat_cd(String det_cat_cd) {
		this.det_cat_cd = det_cat_cd;
	}
	public void setCat_lvl(int cat_lvl) {
		this.cat_lvl = cat_lvl;
	}
	


}
