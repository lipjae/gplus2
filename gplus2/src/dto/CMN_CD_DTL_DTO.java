package dto;

/* 공통코드 상세 */

public class CMN_CD_DTL_DTO {
	private String cmn_cd_id;			// 공통코드ID
	private String cmn_cd_grp_id;		// 공통코드그룹ID
	private String cd_nm;					// 공통코드명
	private String usg_yn;				// 사용여부
	private String cd_attr_1;				// 코드속성1
	private String cd_attr_2;				// 코드속성2
	private String cd_attr_3;				// 코드속성3
	
	public String getCmn_cd_id() {
		return cmn_cd_id;
	}
	public String getCmn_cd_grp_id() {
		return cmn_cd_grp_id;
	}
	public String getCd_nm() {
		return cd_nm;
	}
	public String getUsg_yn() {
		return usg_yn;
	}
	public String getCd_attr_1() {
		return cd_attr_1;
	}
	public String getCd_attr_2() {
		return cd_attr_2;
	}
	public String getCd_attr_3() {
		return cd_attr_3;
	}
	public void setCmn_cd_id(String cmn_cd_id) {
		this.cmn_cd_id = cmn_cd_id;
	}
	public void setCmn_cd_grp_id(String cmn_cd_grp_id) {
		this.cmn_cd_grp_id = cmn_cd_grp_id;
	}
	public void setCd_nm(String cd_nm) {
		this.cd_nm = cd_nm;
	}
	public void setUsg_yn(String usg_yn) {
		this.usg_yn = usg_yn;
	}
	public void setCd_attr_1(String cd_attr_1) {
		this.cd_attr_1 = cd_attr_1;
	}
	public void setCd_attr_2(String cd_attr_2) {
		this.cd_attr_2 = cd_attr_2;
	}
	public void setCd_attr_3(String cd_attr_3) {
		this.cd_attr_3 = cd_attr_3;
	}

}
