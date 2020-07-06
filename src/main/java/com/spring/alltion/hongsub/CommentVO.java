/*
create table comment_list(
    comment_number number primary key,
    comment_group_number number,
    comment_product_number number references product(product_number),
    comment_id varchar2(15) references member(member_id),
    comment_reply_id varchar2(15) default 'no' references member(member_id),
    comment_content varchar2(1000),
    comment_lev varchar2(1) default '0' check(comment_lev in('0','1')),
    comment_secret varchar2(1) default '0' check(comment_secret in('0','1')),
    comment_is_deleted varchar2(1) default '0' check(comment_is_deleted in('0','1')),
    comment_date date default sysdate,
    comment_list_no number
);   
*/

package com.spring.alltion.hongsub;

public class CommentVO {
	private int comment_number;
	private int comment_group_number;
	private int comment_product_number;
	private String comment_id;
	private String comment_reply_id;
	private String comment_content;
	private String comment_lev;
	private String comment_secret;
	private String comment_is_deleted;
	private String comment_date;
	private int comment_list_no;
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public int getComment_group_number() {
		return comment_group_number;
	}
	public void setComment_group_number(int comment_group_number) {
		this.comment_group_number = comment_group_number;
	}
	public int getComment_product_number() {
		return comment_product_number;
	}
	public void setComment_product_number(int comment_product_number) {
		this.comment_product_number = comment_product_number;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_secret() {
		return comment_secret;
	}
	public void setComment_secret(String comment_secret) {
		this.comment_secret = comment_secret;
	}
	public String getComment_is_deleted() {
		return comment_is_deleted;
	}
	public void setComment_is_deleted(String comment_is_deleted) {
		this.comment_is_deleted = comment_is_deleted;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	public int getComment_list_no() {
		return comment_list_no;
	}
	public void setComment_list_no(int comment_list_no) {
		this.comment_list_no = comment_list_no;
	}
	public String getComment_reply_id() {
		return comment_reply_id;
	}
	public void setComment_reply_id(String comment_reply_id) {
		this.comment_reply_id = comment_reply_id;
	}
	public String getComment_lev() {
		return comment_lev;
	}
	public void setComment_lev(String comment_lev) {
		this.comment_lev = comment_lev;
	}
	
}
