package com.tripster.service;

import java.util.Date;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.facebook.api.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripster.common.MailHandler;
import com.tripster.common.TempKey;
import com.tripster.domain.MemberVO;
import com.tripster.dto.LoginDTO;
import com.tripster.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Inject
	private MemberDAO dao;
	@Inject
	private BCryptPasswordEncoder passwordEncoder;
	@Inject
	private JavaMailSender mailSender;

	@Override
	public MemberVO login(LoginDTO dto) throws Exception {

		//DB Null Check
		if(dao.getMemberPw(dto.getMemberEmail())==null) {
			return dao.login(dto);
		}
		
		//암호화된 비밀번호
		String pw = dao.getMemberPw(dto.getMemberEmail()).getMemberPassword();
		//입력한 비밀번호
		String rawPw = dto.getMemberPassword();
		logger.info("비밀번호 : " + rawPw);
				
		if(passwordEncoder.matches(rawPw, pw)) {
			logger.info("비밀번호 일치");
			dto.setMemberPassword(pw);
		} else {
			logger.info("비밀번호 불일치");
		}
		return dao.login(dto);
	}
	
	@Override
	public MemberVO oAuthenticationBinding(MemberVO vo, User facebookUser)throws Exception{
		
		vo.setSnsID(facebookUser.getId());
		vo.setMemberName(facebookUser.getName());

		if(dao.repeatChk(facebookUser.getEmail()) == null) {
			vo.setMemberEmail(facebookUser.getEmail());
		}
		
		
		Date date = new Date();
		
		vo.setMemberBirthday(date);
		
		String sex="";
		if(facebookUser.getGender().equals("male")) {
			sex = "남자";
		} else {
			sex = "여자";
		}
		vo.setMemberSex(sex);
		
		if(dao.facebookLogin(vo.getSnsID()) == null) {
			dao.insertMember(vo);
		}
		
		System.out.println(vo.toString());
		return dao.facebookLogin(vo.getSnsID());
	}
	
	@Override
	public void keepLogin(Integer memberID, String sessionKey, Date next) throws Exception{
		
		dao.keepLogin(memberID, sessionKey, next);
	}
	
	public MemberVO checkLoginBefore(String value) {
		
		return dao.checkSessionKey(value);
	}

	@Transactional
	@Override
	public void register(MemberVO vo) throws Exception {

		String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(encPassword);
		logger.info("암호화된 비밀번호 : " + vo.getMemberPassword());
		
		dao.insertMember(vo);
		
		String key = new TempKey().getKey(40, false);
		
		dao.createAuthKey(vo.getMemberEmail(), key);

		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("Tripster 회원가입 이메일 인증");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
					.append("<a href='http://localhost:10000/member/emailConfirm?memberEmail=")
					.append(vo.getMemberEmail()).append("&key=").append(key)
					.append("' target='_blank'>이메일 인증 확인</a>").toString());
		sendMail.setFrom("projecttripster@gmail.com", "Tripster관리자");
		sendMail.setTo(vo.getMemberEmail());
		sendMail.send();
	}
	
	@Override
	public void findPassword(MemberVO vo) throws Exception {
		
		String key = new TempKey().getKey(6, false);
		
		String encPassword = passwordEncoder.encode(key);
		vo.setMemberPassword(encPassword);
		
		dao.createTempPassword(vo.getMemberEmail(), encPassword);

		MailHandler sendMail = new MailHandler(mailSender);
		
		sendMail.setSubject("Tripster 비밀번호 찾기");
		sendMail.setText(new StringBuffer().append("<h1>임시비밀번호</h1>")
				.append("임시 비밀번호는").append(key)
				.append("입니다. 로그인 후 비밀번호를 변경해주세요.</br>")
				.append("<a href='http://localhost:10000/")
				.append("' target='_blank'>Tripster 바로가기</a>").toString());
		sendMail.setFrom("projecttripster@gmail.com", "Tripster관리자");
		sendMail.setTo(vo.getMemberEmail());
		sendMail.send();
		
	}
	
	@Override
	public void authMember(String memberEmail) throws Exception {
		dao.authMember(memberEmail);
	}
	
	@Override
	public boolean repeatChk(String memberEmail) throws Exception {
		
		if (dao.repeatChk(memberEmail) == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public MemberVO mypage(Integer memberID) throws Exception {
		
		return dao.mypage(memberID);
	}
	
	@Override
	public void changeProfile(MemberVO vo) throws Exception {
		
		dao.changeProfile(vo);
	}
	
	@Override
	public void changePassword(MemberVO vo) throws Exception {
		
		String encPassword = passwordEncoder.encode(vo.getMemberPassword());
		vo.setMemberPassword(encPassword);
		
		dao.changePassword(vo);
	}
	
	@Override
	public boolean passwordChk(MemberVO vo) throws Exception {
		
		//암호화된 비밀번호
		String pw = dao.getMemberPw(vo.getMemberEmail()).getMemberPassword();
		//입력한 비밀번호
		String rawPw = vo.getMemberPassword();
		logger.info("비밀번호 : " + rawPw);
		
		System.out.println("pw : " + pw + ", rawPw : " + rawPw);
		
		if (passwordEncoder.matches(rawPw, pw)) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public void uploadPicture(MemberVO vo) throws Exception {
		dao.uploadPicture(vo);
	}
	
	@Override
	public void dropMember(Integer memberID) throws Exception {
		
		dao.deleteMember(memberID);
	}

}