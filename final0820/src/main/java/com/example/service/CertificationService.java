package com.example.service;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class CertificationService {

	 public void certifiedPhoneNumber(String phoneNumber, String cerNum) {

			 String api_key = "NCSI0SCL38JZTKHJ";
	         String api_secret = "43PP0NJDISC8N55SFZHCHHO42GBV1AQA";
	        Message coolsms = new Message(api_key, api_secret);

	        // 4 params(to, from, type, text) are mandatory. must be filled
	        HashMap<String, String> params = new HashMap<String, String>();
	        params.put("to", phoneNumber);    // ������ȭ��ȣ
	        params.put("from", "01087754343");    // �߽���ȭ��ȣ. �׽�Ʈ�ÿ��� �߽�,���� �Ѵ� ���� ��ȣ�� �ϸ� ��
	        params.put("type", "SMS");
	        params.put("text", "DDOGDOG �޴������� �޽��� : ������ȣ��" + "["+cerNum+"]" + "�Դϴ�.");
	        params.put("app_version", "test app 1.2"); // application name and version

	        try {
	            JSONObject obj = (JSONObject) coolsms.send(params);
	            System.out.println(obj.toString());
	        } catch (CoolsmsException e) {
	            System.out.println(e.getMessage());
	            System.out.println(e.getCode());
	        }
	    
	 }
	 
}