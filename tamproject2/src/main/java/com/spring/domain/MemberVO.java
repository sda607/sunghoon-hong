package com.spring.domain;

import lombok.Data;

@Data
public class MemberVO {
	private String userid, username, userpw, email, birth, gender;
	private int adminCk;
}
