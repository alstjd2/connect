package kr.or.ddit.web.subscribe.vo;

import lombok.Data;

@Data
public class KakaoPayReadyVO {
	private String tid; //결제 고유 번호
	private String next_redirect_mobile_url;//요청한 클라이언트 모바일 웹일때
	private String next_redirect_pc_url; //요청한 클라이언트가 pc 웹일때
	private String partner_order_id; //가맹점 주문번호
}
