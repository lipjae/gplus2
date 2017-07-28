package dto;

import java.sql.Date;

public class SYS_MNG_BAS {
	private String sys_user_id;
	private String passwd;
	private String usr_auth_lvl;
	private String use_yn;
	private Date id_allow_dt;
	
	public String getSys_user_id() {
		return sys_user_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public String getUsr_auth_lvl() {
		return usr_auth_lvl;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public Date getId_allow_dt() {
		return id_allow_dt;
	}
	public void setSys_user_id(String sys_user_id) {
		this.sys_user_id = sys_user_id;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public void setUsr_auth_lvl(String usr_auth_lvl) {
		this.usr_auth_lvl = usr_auth_lvl;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public void setId_allow_dt(Date id_allow_dt) {
		this.id_allow_dt = id_allow_dt;
	}
	

}
