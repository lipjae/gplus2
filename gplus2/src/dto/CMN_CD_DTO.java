package dto;

/* 공통코드 */

public class CMN_CD_DTO {
	private String cmn_cd_grp_id;				// 공통코드그룹ID
	private String cmn_cd_grp_nm;			// 공통코드그룹명
	private String uper_cmm_cd_grp_id;	// 상위공통코드그룹ID
	private int cmn_cd_len;					// 공통코드길이
	private String cd_attr_1;						// 그룹코드속성1
	
	public String getCmn_cd_grp_id() {
		return cmn_cd_grp_id;
	}
	public String getCmn_cd_grp_nm() {
		return cmn_cd_grp_nm;
	}
	public String getUper_cmm_cd_grp_id() {
		return uper_cmm_cd_grp_id;
	}
	public int getCmn_cd_len() {
		return cmn_cd_len;
	}
	public String getCd_attr_1() {
		return cd_attr_1;
	}
	public void setCmn_cd_grp_id(String cmn_cd_grp_id) {
		this.cmn_cd_grp_id = cmn_cd_grp_id;
	}
	public void setCmn_cd_grp_nm(String cmn_cd_grp_nm) {
		this.cmn_cd_grp_nm = cmn_cd_grp_nm;
	}
	public void setUper_cmm_cd_grp_id(String uper_cmm_cd_grp_id) {
		this.uper_cmm_cd_grp_id = uper_cmm_cd_grp_id;
	}
	public void setCmn_cd_len(int cmn_cd_len) {
		this.cmn_cd_len = cmn_cd_len;
	}
	public void setCd_attr_1(String cd_attr_1) {
		this.cd_attr_1 = cd_attr_1;
	}
	

}
