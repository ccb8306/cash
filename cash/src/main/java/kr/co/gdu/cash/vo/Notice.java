package kr.co.gdu.cash.vo;

import java.util.List;

import lombok.Data;

@Data
public class Notice {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<Noticefile> noticefileList;
	private List<Noticecomment> noticecommentList;
}
