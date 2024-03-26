package kr.qtorder.model;

public class NoticeVO {
	
	private int notice_idx;
	private String notice_title;
	private String notice_content;
	private String notice_file;
	private String created_at;
	private int ft_idx;


	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public String getNotice_file() {
		return notice_file;
	}

	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String create_at) {
		this.created_at = create_at;
	}

	public int getFt_idx() {
		return ft_idx;
	}

	public void setFt_idx(int ft_idx) {
		this.ft_idx = ft_idx;
	}

	
}
