package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticecommentMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	@Autowired private NoticecommentMapper noticecommentMapper;

	// localhost로 작업 할 때의 경로
    /*File file = new File("");
	String PATH = file.getAbsolutePath() + "\\src\\main\\webapp\\upload\\";  */
	
	// aws에 업로드 시 사용하는 경로
	String PATH = "/home/ubuntu/tomcat9/webapps/cash/upload/";  

	
	// 공지사항 최신 5개
	public List<Notice> getLatestNoticeList(){
		return noticeMapper.selectLatestNoiceList();
	}
	
	// 공지사항 전체 리스트
	public List<Notice> getNoticeList(Map<String, Integer> map){
		return noticeMapper.selectNoiceList(map);
	}
	
	// 공지사항 마지막 페이지 구하기
	public int getEndPage(int rowPage) {
		int endPage = noticeMapper.selectNoticeCount();
		if(endPage%rowPage == 0) {
			return (int)(endPage/rowPage);
		}else {
			return (int)(endPage/rowPage) +1;
		}
	}
	
	// 공지사항 추가하기
	public void addNotice(NoticeForm noticeForm) {
		// 공지사항 내용 추가
		Notice notice = new Notice();
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.insertNotice(notice);
		
		// 공지사항 파일 추가
		// 파일이 들어 올 시 실제 파일 저장, 리스트에 파일 정보 저장
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefileList()!= null) {
			noticefile = new ArrayList<Noticefile>();
			// 파일을 각각 저장 -> 파일의 개수만큼 반복
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				int p = mf.getOriginalFilename().lastIndexOf("."); // 확장자 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");

				// 파일 정보 저장
				nf.setNoticeId(notice.getNoticeId());
				nf.setNoticefileName(filename + ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				
				// 리스트에 저장
				noticefile.add(nf);
				
				try {
					mf.transferTo(new File(PATH + filename + ext));
					System.out.println("************************************************************************");
					System.out.println("*****************PATH : " + PATH);
					System.out.println("************************************************************************");
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		// 파일이 들어 올 시 리스트를 DB에 저장
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
			
		return;
	}
	
	// 공지사항 상세보기
	public Notice getNoticeOne(int noticeId) {
		return noticeMapper.selectNoticeOne(noticeId);
	}
	
	// 공지사항 삭제
	public void removeNotie(int noticeId) {
		// 파일 이름들 가져오기
		List<String> noticefileList = noticefileMapper.selectNoticefileNameList(noticeId);
		// 실제 파일 삭제
		for(String s : noticefileList) {
			File f = new File(PATH + s);
			f.delete();
		}
		// 댓글 삭제
		noticecommentMapper.deleteNoticecommentList(noticeId);
		// DB에서 파일 삭제
		noticefileMapper.deleteNoticefileList(noticeId);
		// DB에서 공지사항 삭제
		noticeMapper.deleteNotice(noticeId);
		return;
	}
	
	// 공지사항 파일 한개 삭제
	public int removeNoticefileOne(int noticefileId) {
		// 파일 이름들 가져오기
		String noticefileList = noticefileMapper.selectNoticefileNameOne(noticefileId);
		// 실제 파일 삭제
		File f = new File(PATH + noticefileList);
		f.delete();
		
		return noticefileMapper.deleteNoticefileOne(noticefileId);
	}
	
	// 공지사항 수정
	public void modifyNotice(NoticeForm noticeForm) {
		// 공지사항 내용 수정
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		noticeMapper.updateNotice(notice);
		
		// 공지사항 파일 추가
		// 파일이 들어 올 시 실제 파일 저장, 리스트에 파일 정보 저장
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefileList()!= null) {
			noticefile = new ArrayList<Noticefile>();
			// 파일을 각각 저장 -> 파일의 개수만큼 반복
			for(MultipartFile mf : noticeForm.getNoticefileList()) {
				Noticefile nf = new Noticefile();
				int p = mf.getOriginalFilename().lastIndexOf("."); // 확장자 저장
				String ext = mf.getOriginalFilename().substring(p).toLowerCase();
				String filename = UUID.randomUUID().toString().replace("-", "");

				// 파일 정보 저장
				nf.setNoticeId(notice.getNoticeId());
				nf.setNoticefileName(filename + ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				
				// 리스트에 저장
				noticefile.add(nf);
				
				try {
					mf.transferTo(new File(PATH + filename + ext));
				} catch(Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		// 파일이 들어 올 시 리스트를 DB에 저장
		if(noticefile != null) {
			for(Noticefile nf : noticefile) {
				noticefileMapper.insertNoticefile(nf);
			}
		}
		return;
	}
}
