package com.example.service;

import javax.mail.Message.RecipientType;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Service
public class PwSearchService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserMapper userDao;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	 
	// �̸��� ���� ����� �޼���
	private String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}
			
		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// ������ �̿��� Ű ����
	private boolean lowerCheck;
	private int size;

	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	public void mailSendWithPassword(String id, String email, HttpServletRequest request) {
		// ��й�ȣ�� 6�ڸ��� ������ �����ͺ��̽� ��й�ȣ�� �ٲ��ش�
		String key = getKey(false, 6);
		userDao = sqlSession.getMapper(UserMapper.class);
		
		// ȸ�� �̸� ������ �ڵ�
		UserVO vo = userDao.read(id);
		String name = vo.getName();
				
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>�ȳ��ϼ��� '"+ name +"' ��</h2><br><br>" 
				+ "<p>��й�ȣ ã�⸦ ��û���ּż� �ӽ� ��й�ȣ�� �߱��ص�Ƚ��ϴ�.</p>"
				+ "<p>�ӽ÷� �߱� �帰 ��й�ȣ�� <h2 style='color : blue'>'" + key +"'</h2>�̸� �α��� �� �������������� ��й�ȣ�� �������ֽø� �˴ϴ�.</p><br>"
				+ "<h3><a href='http://192.168.0.115:8088/index'>Ȩ������ ���� ^0^</a></h3><br><br>"
				+ "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)";
		try {
			mail.setSubject("DDOGDOG �ӽ� ��й�ȣ�� �߱޵Ǿ����ϴ�", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		// ��й�ȣ ��ȣȭ���ִ� �޼���
		key = passEncoder.encode(key);
		// ������ ���̽� ���� ��ȣ�� ������ �����Ų��.
		userDao.searchPassword(id, email, key);
	}

}