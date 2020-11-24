package kr.co.gdu.cash.vo;

import lombok.Data;

@Data
public class Noticecomment {
	private int commentId;
	private int noticeId;
	private String commentContent;
	private String commentDate;
}
