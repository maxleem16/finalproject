package com.example.service;

import java.util.Random;

import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Service
public class UserMailSendService {

	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private SqlSessionTemplate sqlSession;
	private UserMapper userDao;

	//���� Ȯ�� �޼��� (Y ������ �ٲ��ִ� �޼���)
	public int alter_userKey_service(String id, String key) {
		int resultCnt = 0;
		userDao = sqlSession.getMapper(UserMapper.class);
		resultCnt = userDao.alter_userKey(id, key);
		return resultCnt;
	}
	
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

	// ȸ������ �߼� �̸���(����Ű �߼�)
	public void mailSendWithUserKey(String email, String id, HttpServletRequest request) {
		String key = getKey(false, 20);
		userDao = sqlSession.getMapper(UserMapper.class);
		userDao.GetKey(id, key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>�ȳ��ϼ���~ ����� ����Ʈ DDOGDOG �Դϴ�!</h2><br><br>" 
				+ "<h3>" + id + "��</h3>" + "<p>�����ϱ� ��ư�� �����ø� �α����� �Ͻ� �� �ֽ��ϴ� : " 
				+ "<a href='http://192.168.0.115:8088" + request.getContextPath() + "/user/key_alter?id="+ id +"&user_key="+key+"'>�����ϱ�</a></p>"
				+ "(Ȥ�� �߸� ���޵� �����̶�� �� �̸����� �����ϼŵ� �˴ϴ�)";
		try {
			mail.setSubject("[��������] DDOGDOG ���������Դϴ�", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}

}
