package kr.co.gdu.cash.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeForm {
	private int noticeId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<MultipartFile> noticefileList;
}
