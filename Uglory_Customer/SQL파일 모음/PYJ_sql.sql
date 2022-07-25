﻿CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REVIEW_ENROLL_DT"	DATE		NOT NULL,
	"STAR_RATING"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"P_CD"	NUMBER		NULL,
	"P_ORDER_CD"	VARCHAR2(20)		NULL,
	"S_ORDER_CD"	VARCHAR2(20)		NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '게시글 번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '리뷰 내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_ENROLL_DT" IS '작성일';

COMMENT ON COLUMN "REVIEW"."STAR_RATING" IS '별점';

COMMENT ON COLUMN "REVIEW"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "REVIEW"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "REVIEW"."P_ORDER_CD" IS '주문코드';

COMMENT ON COLUMN "REVIEW"."S_ORDER_CD" IS '구독 상품 주문 코드';

CREATE TABLE "PRODUCT" (
	"P_CD"	NUMBER		NOT NULL,
	"P_CATEGORY_NO"	NUMBER		NOT NULL,
	"FARM_NO"	NUMBER		NOT NULL,
	"PRODUCT_NM"	VARCHAR2(50)		NOT NULL,
	"PRODUCT_PRICE"	NUMBER		NOT NULL,
	"PRODUCT_ST"	CHAR(1)	DEFAULT 'I'	NOT NULL,
	"PRODUCT_INFO"	CLOB		NULL,
	"PR_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"PU_DATE"	DATE		NULL
);

COMMENT ON COLUMN "PRODUCT"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "PRODUCT"."P_CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "PRODUCT"."FARM_NO" IS '농장 번호';

COMMENT ON COLUMN "PRODUCT"."PRODUCT_NM" IS '상품명';

COMMENT ON COLUMN "PRODUCT"."PRODUCT_PRICE" IS '상품 가격';

COMMENT ON COLUMN "PRODUCT"."PRODUCT_ST" IS '상품 상태(입고IN, 품절OUT)';

COMMENT ON COLUMN "PRODUCT"."PRODUCT_INFO" IS '상품 설명 및 주문 전 확인 정보';

COMMENT ON COLUMN "PRODUCT"."PR_DATE" IS '상품등록일';

COMMENT ON COLUMN "PRODUCT"."PU_DATE" IS '상품 정보 수정일';

CREATE TABLE "ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_EMAIL"	VARCHAR2(50)		NOT NULL,
	"ADMIN_PW"	VARCHAR2(50)		NOT NULL,
	"ADMIN_NAME"	VARCHAR2(30)		NOT NULL,
	"ADMIN_P_IMG"	VARCHAR2(200)		NOT NULL
);

COMMENT ON COLUMN "ADMIN"."ADMIN_NO" IS '관리자 번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_EMAIL" IS '관리자 아이디';

COMMENT ON COLUMN "ADMIN"."ADMIN_PW" IS '관리자 비밀번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_NAME" IS '관리자 이름';

COMMENT ON COLUMN "ADMIN"."ADMIN_P_IMG" IS '관리자 프로필 이미지';

CREATE TABLE "CART" (
	"CART_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"P_CD"	NUMBER		NOT NULL,
	"OPTION_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CART"."CART_NO" IS '장바구니 번호';

COMMENT ON COLUMN "CART"."MEMBER_NO" IS '장바구니 이용 회원';

COMMENT ON COLUMN "CART"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "CART"."OPTION_NO" IS '옵션 번호';

CREATE TABLE "P_CATEGORY" (
	"P_CATEGORY_NO"	NUMBER		NOT NULL,
	"P_CATEGORY_NM"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "P_CATEGORY"."P_CATEGORY_NO" IS '카테고리 번호';

COMMENT ON COLUMN "P_CATEGORY"."P_CATEGORY_NM" IS '카테고리명';

CREATE TABLE "PRODUCT_ORDER" (
	"P_ORDER_CD"	VARCHAR2(20)		NOT NULL,
	"P_ORDER_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"P_ORDER_NM"	VARCHAR2(30)		NOT NULL,
	"P_ORDER_PHONE"	VARCHAR2(20)		NOT NULL,
	"P_ORDER_ADDR"	VARCHAR2(500)		NOT NULL,
	"TOTAL_PRICE"	NUMBER		NOT NULL,
	"P_DL_REQ"	VARCHAR2(500)		NULL,
	"P_DL_FEE"	NUMBER		NULL,
	"P_REVIEW_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"DELIVERY_CD"	NUMBER		NOT NULL,
	"CART_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PRODUCT_ORDER"."P_ORDER_CD" IS '주문코드';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_ORDER_DT" IS '주문 일자';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_ORDER_NM" IS '수령인 이름';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_ORDER_PHONE" IS '수령인 전화번호';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_ORDER_ADDR" IS '수령인 주소';

COMMENT ON COLUMN "PRODUCT_ORDER"."TOTAL_PRICE" IS '총가격';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_DL_REQ" IS '배송요청사항';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_DL_FEE" IS '배송비';

COMMENT ON COLUMN "PRODUCT_ORDER"."P_REVIEW_ST" IS '리뷰 상태(Y/N)';

COMMENT ON COLUMN "PRODUCT_ORDER"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "PRODUCT_ORDER"."DELIVERY_CD" IS '배송코드';

COMMENT ON COLUMN "PRODUCT_ORDER"."CART_NO" IS '장바구니 번호';

CREATE TABLE "P_MESSAGE" (
	"P_MESSAGE_NO"	NUMBER		NOT NULL,
	"P_M_CONTENT"	VARCHAR2(600)		NOT NULL,
	"P_LIST_NO"	NUMBER		NOT NULL,
	"S_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "P_MESSAGE"."P_MESSAGE_NO" IS '상품 알림 번호';

COMMENT ON COLUMN "P_MESSAGE"."P_M_CONTENT" IS '상품 알림 내용';

COMMENT ON COLUMN "P_MESSAGE"."P_LIST_NO" IS '상품 리스트 번호';

COMMENT ON COLUMN "P_MESSAGE"."S_ORDER_CD" IS '구독 상품 주문 코드';

CREATE TABLE "WEEKLY_LIST" (
	"P_LIST_NO"	NUMBER		NOT NULL,
	"UPLOAD_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"EX_UPLOAD_DATE"	CHAR(1)		NOT NULL,
	"DELIVERY_DATE"	DATE		NOT NULL
);

COMMENT ON COLUMN "WEEKLY_LIST"."P_LIST_NO" IS '상품 리스트 번호';

COMMENT ON COLUMN "WEEKLY_LIST"."UPLOAD_ST" IS '게시 상태(Y/N)';

COMMENT ON COLUMN "WEEKLY_LIST"."EX_UPLOAD_DATE" IS '게시 예정일(E/T/N/A)';

COMMENT ON COLUMN "WEEKLY_LIST"."DELIVERY_DATE" IS '배송 예정일';

CREATE TABLE "FARM" (
	"FARM_NO"	NUMBER		NOT NULL,
	"FARM_NM"	VARCHAR2(100)		NOT NULL,
	"PRODUCER"	VARCHAR2(30)		NOT NULL,
	"ORIGIN"	VARCHAR2(100)		NOT NULL
);

COMMENT ON COLUMN "FARM"."FARM_NO" IS '농장 번호';

COMMENT ON COLUMN "FARM"."FARM_NM" IS '농장 이름';

COMMENT ON COLUMN "FARM"."PRODUCER" IS '생산자';

COMMENT ON COLUMN "FARM"."ORIGIN" IS '원산지';

CREATE TABLE "OPTION_TYPE" (
	"OPTION_CD"	NUMBER		NOT NULL,
	"P_CD"	NUMBER		NOT NULL,
	"OPTION_NM"	VARCHAR2(30)		NOT NULL,
	"OPTION_PRICE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "OPTION_TYPE"."OPTION_CD" IS '옵션 코드';

COMMENT ON COLUMN "OPTION_TYPE"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "OPTION_TYPE"."OPTION_NM" IS '옵션명';

COMMENT ON COLUMN "OPTION_TYPE"."OPTION_PRICE" IS '옵션 가격';

CREATE TABLE "WEEKLY_P" (
	"PRODUCT_NO"	NUMBER		NOT NULL,
	"P_LIST_NO"	NUMBER		NOT NULL,
	"P_CD"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "WEEKLY_P"."PRODUCT_NO" IS '상품 번호';

COMMENT ON COLUMN "WEEKLY_P"."P_LIST_NO" IS '상품 리스트 번호';

COMMENT ON COLUMN "WEEKLY_P"."P_CD" IS '상품 코드';

CREATE TABLE "PRODUCT_IMG" (
	"PRODUCT_IMG"	NUMBER		NOT NULL,
	"P_CD"	NUMBER		NOT NULL,
	"IMG_RENAME"	VARCHAR2(100)		NOT NULL,
	"IMG_ROOT"	VARCHAR2(200)		NOT NULL,
	"IMG_LEVEL"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "PRODUCT_IMG"."PRODUCT_IMG" IS '상품 이미지 번호';

COMMENT ON COLUMN "PRODUCT_IMG"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "PRODUCT_IMG"."IMG_RENAME" IS '이미지 수정명';

COMMENT ON COLUMN "PRODUCT_IMG"."IMG_ROOT" IS '이미지 루트';

COMMENT ON COLUMN "PRODUCT_IMG"."IMG_LEVEL" IS '이미지 레벨';

CREATE TABLE "PRODUCT_DELIVERY" (
	"DELIVERY_CD"	NUMBER		NOT NULL,
	"DELIVERY_ST"	VARCHAR2(10)		NOT NULL
);

COMMENT ON COLUMN "PRODUCT_DELIVERY"."DELIVERY_CD" IS '배송코드';

COMMENT ON COLUMN "PRODUCT_DELIVERY"."DELIVERY_ST" IS '배송상태';

CREATE TABLE "REVIEW_IMG" (
	"REVIEW_IMG_NO"	NUMBER		NOT NULL,
	"REVIEW_IMG_ORIGINAL"	VARCHAR2(200)		NOT NULL,
	"REVIEW_IMG_LEVEL"	NUMBER		NOT NULL,
	"REVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REVIEW_IMG"."REVIEW_IMG_NO" IS '이미지 번호';

COMMENT ON COLUMN "REVIEW_IMG"."REVIEW_IMG_ORIGINAL" IS '이미지 원본명';

COMMENT ON COLUMN "REVIEW_IMG"."REVIEW_IMG_LEVEL" IS '이미지 레벨';

COMMENT ON COLUMN "REVIEW_IMG"."REVIEW_NO" IS '게시글 번호';

CREATE TABLE "PRODUCT_PAY" (
	"P_PAY_NO"	NUMBER		NOT NULL,
	"P_PAY_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"P_PAY_AMOUNT"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"P_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "PRODUCT_PAY"."P_PAY_NO" IS '결제 번호(PK)';

COMMENT ON COLUMN "PRODUCT_PAY"."P_PAY_DT" IS '결제일';

COMMENT ON COLUMN "PRODUCT_PAY"."P_PAY_AMOUNT" IS '결제 금액';

COMMENT ON COLUMN "PRODUCT_PAY"."MEMBER_NO" IS '회원번호';

COMMENT ON COLUMN "PRODUCT_PAY"."P_ORDER_CD" IS '주문코드';

CREATE TABLE "SUBS_PAY" (
	"S_PAY_NO"	NUMBER		NOT NULL,
	"S_PAY_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"S_PAY_AMOUNT"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"S_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "SUBS_PAY"."S_PAY_NO" IS '구독 결제 번호';

COMMENT ON COLUMN "SUBS_PAY"."S_PAY_DT" IS '구독 결제일';

COMMENT ON COLUMN "SUBS_PAY"."S_PAY_AMOUNT" IS '구독 결제금액';

COMMENT ON COLUMN "SUBS_PAY"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "SUBS_PAY"."S_ORDER_CD" IS '구독 상품 주문 코드';

CREATE TABLE "SUBS_ORDER" (
	"S_ORDER_CD"	VARCHAR2(20)		NOT NULL,
	"S_CANCEL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"S_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"S_ORDER_NM"	VARCHAR2(30)		NOT NULL,
	"S_ORDER_PHONE"	VARCHAR2(20)		NOT NULL,
	"S_ORDER_ADDR"	VARCHAR2(500)		NOT NULL,
	"S_DL_REQ"	VARCHAR2(500)		NULL,
	"FIRST_DL_DT"	DATE		NOT NULL,
	"S_REVIEW_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"S_CYCLE"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"S_CD"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SUBS_ORDER"."S_ORDER_CD" IS '구독 상품 주문 코드';

COMMENT ON COLUMN "SUBS_ORDER"."S_CANCEL" IS '구독 해지 여부(Y/N)';

COMMENT ON COLUMN "SUBS_ORDER"."S_DT" IS '구독 일자';

COMMENT ON COLUMN "SUBS_ORDER"."S_ORDER_NM" IS '구독 수령인 이름';

COMMENT ON COLUMN "SUBS_ORDER"."S_ORDER_PHONE" IS '구독 수령인 전화번호';

COMMENT ON COLUMN "SUBS_ORDER"."S_ORDER_ADDR" IS '구독 수령인 주소';

COMMENT ON COLUMN "SUBS_ORDER"."S_DL_REQ" IS '구독 배송 요청사항';

COMMENT ON COLUMN "SUBS_ORDER"."FIRST_DL_DT" IS '구독 첫 배송일';

COMMENT ON COLUMN "SUBS_ORDER"."S_REVIEW_ST" IS '구독 리뷰 상태(Y/N)';

COMMENT ON COLUMN "SUBS_ORDER"."S_CYCLE" IS '구독 배송 주기';

COMMENT ON COLUMN "SUBS_ORDER"."MEMBER_NO" IS '구독 회원 번호';

COMMENT ON COLUMN "SUBS_ORDER"."S_CD" IS '구독 상품 코드';

CREATE TABLE "FAQ_BOARD" (
	"FAQ_CD"	NUMBER		NOT NULL,
	"FAQ_TITLE"	VARCHAR2(400)		NOT NULL,
	"FAQ_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"FAQ_CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "FAQ_BOARD"."FAQ_CD" IS 'FAQ 글 번호';

COMMENT ON COLUMN "FAQ_BOARD"."FAQ_TITLE" IS 'FAQ 제목';

COMMENT ON COLUMN "FAQ_BOARD"."FAQ_CONTENT" IS 'FAQ 내용';

COMMENT ON COLUMN "FAQ_BOARD"."ADMIN_NO" IS '관리자 번호';

COMMENT ON COLUMN "FAQ_BOARD"."FAQ_CATEGORY_NO" IS 'FAQ 카테고리 번호';

CREATE TABLE "FAQ_CATEGORY" (
	"FAQ_CATEGORY_NO"	NUMBER		NOT NULL,
	"FAQ_CATEGORY_NM"	VARCHAR2(50)		NOT NULL
);

COMMENT ON COLUMN "FAQ_CATEGORY"."FAQ_CATEGORY_NO" IS 'FAQ 카테고리 번호';

COMMENT ON COLUMN "FAQ_CATEGORY"."FAQ_CATEGORY_NM" IS 'FAQ 카테고리명';

CREATE TABLE "SUBS_DELIVERY" (
	"S_DELIVERY_CD"	NUMBER		NOT NULL,
	"S_DELIVERY_DT"	DATE		NOT NULL,
	"DELIVERY_CD"	NUMBER		NOT NULL,
	"S_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "SUBS_DELIVERY"."S_DELIVERY_CD" IS '구독 배송 코드';

COMMENT ON COLUMN "SUBS_DELIVERY"."S_DELIVERY_DT" IS '배송일자';

COMMENT ON COLUMN "SUBS_DELIVERY"."DELIVERY_CD" IS '배송코드';

COMMENT ON COLUMN "SUBS_DELIVERY"."S_ORDER_CD" IS '구독 상품 주문 코드';

CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_NAME"	VARCHAR2(20)		NOT NULL,
	"MEMBER_EMAIL"	VARCHAR2(50)		NOT NULL,
	"MEMBER_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"SECESSION_CNT"	VARCHAR2(100)		NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_NAME" IS '회원 이름';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일';

COMMENT ON COLUMN "MEMBER"."MEMBER_ST" IS '회원 상태(Y/N/P)';

COMMENT ON COLUMN "MEMBER"."SECESSION_CNT" IS '회원 탈퇴 사유 내용';

CREATE TABLE "OPTION_TB" (
	"OPTION_NO"	NUMBER		NOT NULL,
	"OPTION_CD"	NUMBER		NOT NULL,
	"P_ORDER_CD"	VARCHAR2(20)		NOT NULL,
	"OPTION_COUNT"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "OPTION_TB"."OPTION_NO" IS '옵션 번호';

COMMENT ON COLUMN "OPTION_TB"."OPTION_CD" IS '옵션 코드';

COMMENT ON COLUMN "OPTION_TB"."P_ORDER_CD" IS '주문코드';

COMMENT ON COLUMN "OPTION_TB"."OPTION_COUNT" IS '옵션 개수';

CREATE TABLE "SUBS" (
	"S_CD"	NUMBER		NOT NULL,
	"S_NM"	VARCHAR2(50)		NOT NULL,
	"S_PRICE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "SUBS"."S_CD" IS '구독 상품 코드';

COMMENT ON COLUMN "SUBS"."S_NM" IS '구독 상품명';

COMMENT ON COLUMN "SUBS"."S_PRICE" IS '구독 상품 가격';

CREATE TABLE "SUBS_EXCEPTION" (
	"P_CD"	NUMBER		NOT NULL,
	"S_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "SUBS_EXCEPTION"."P_CD" IS '상품 코드';

COMMENT ON COLUMN "SUBS_EXCEPTION"."S_ORDER_CD" IS '구독 상품 주문 코드';

CREATE TABLE "PRODUCT_REFUND" (
	"P_REFUND_CD"	NUMBER		NOT NULL,
	"P_REFUND_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"P_REFUND_AMOUNT"	NUMBER		NOT NULL,
	"P_REFUND_ST"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"P_ORDER_CD"	VARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "PRODUCT_REFUND"."P_REFUND_CD" IS '환불 코드';

COMMENT ON COLUMN "PRODUCT_REFUND"."P_REFUND_DT" IS '환불 날짜';

COMMENT ON COLUMN "PRODUCT_REFUND"."P_REFUND_AMOUNT" IS '환불 금액';

COMMENT ON COLUMN "PRODUCT_REFUND"."P_REFUND_ST" IS '환불 처리 상태(Y/N)';

COMMENT ON COLUMN "PRODUCT_REFUND"."P_ORDER_CD" IS '주문코드';

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "PRODUCT" ADD CONSTRAINT "PK_PRODUCT" PRIMARY KEY (
	"P_CD"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "CART" ADD CONSTRAINT "PK_CART" PRIMARY KEY (
	"CART_NO"
);

ALTER TABLE "P_CATEGORY" ADD CONSTRAINT "PK_P_CATEGORY" PRIMARY KEY (
	"P_CATEGORY_NO"
);

ALTER TABLE "PRODUCT_ORDER" ADD CONSTRAINT "PK_PRODUCT_ORDER" PRIMARY KEY (
	"P_ORDER_CD"
);

ALTER TABLE "P_MESSAGE" ADD CONSTRAINT "PK_P_MESSAGE" PRIMARY KEY (
	"P_MESSAGE_NO"
);

ALTER TABLE "WEEKLY_LIST" ADD CONSTRAINT "PK_WEEKLY_LIST" PRIMARY KEY (
	"P_LIST_NO"
);

ALTER TABLE "FARM" ADD CONSTRAINT "PK_FARM" PRIMARY KEY (
	"FARM_NO"
);

ALTER TABLE "OPTION_TYPE" ADD CONSTRAINT "PK_OPTION_TYPE" PRIMARY KEY (
	"OPTION_CD"
);

ALTER TABLE "WEEKLY_P" ADD CONSTRAINT "PK_WEEKLY_P" PRIMARY KEY (
	"PRODUCT_NO"
);

ALTER TABLE "PRODUCT_IMG" ADD CONSTRAINT "PK_PRODUCT_IMG" PRIMARY KEY (
	"PRODUCT_IMG"
);

ALTER TABLE "PRODUCT_DELIVERY" ADD CONSTRAINT "PK_PRODUCT_DELIVERY" PRIMARY KEY (
	"DELIVERY_CD"
);

ALTER TABLE "REVIEW_IMG" ADD CONSTRAINT "PK_REVIEW_IMG" PRIMARY KEY (
	"REVIEW_IMG_NO"
);

ALTER TABLE "PRODUCT_PAY" ADD CONSTRAINT "PK_PRODUCT_PAY" PRIMARY KEY (
	"P_PAY_NO"
);

ALTER TABLE "SUBS_PAY" ADD CONSTRAINT "PK_SUBS_PAY" PRIMARY KEY (
	"S_PAY_NO"
);

ALTER TABLE "SUBS_ORDER" ADD CONSTRAINT "PK_SUBS_ORDER" PRIMARY KEY (
	"S_ORDER_CD"
);

ALTER TABLE "FAQ_BOARD" ADD CONSTRAINT "PK_FAQ_BOARD" PRIMARY KEY (
	"FAQ_CD"
);

ALTER TABLE "FAQ_CATEGORY" ADD CONSTRAINT "PK_FAQ_CATEGORY" PRIMARY KEY (
	"FAQ_CATEGORY_NO"
);

ALTER TABLE "SUBS_DELIVERY" ADD CONSTRAINT "PK_SUBS_DELIVERY" PRIMARY KEY (
	"S_DELIVERY_CD"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "OPTION_TB" ADD CONSTRAINT "PK_OPTION_TB" PRIMARY KEY (
	"OPTION_NO"
);

ALTER TABLE "SUBS" ADD CONSTRAINT "PK_SUBS" PRIMARY KEY (
	"S_CD"
);

ALTER TABLE "PRODUCT_REFUND" ADD CONSTRAINT "PK_PRODUCT_REFUND" PRIMARY KEY (
	"P_REFUND_CD"
);


-- FAQ FK 제약조건 추가

-- FAQ_BOARD - ADMIN 연결
ALTER TABLE FAQ_BOARD
ADD FOREIGN KEY(ADMIN_NO)
REFERENCES ADMIN(ADMIN_NO);

-- FAQ_BOARD - FAQ_CATEGORY 연결
ALTER TABLE FAQ_BOARD
ADD FOREIGN KEY(FAQ_CATEGORY_NO)
REFERENCES FAQ_CATEGORY(FAQ_CATEGORY_NO);

--------------------------------------------------------------------------------

-- 리뷰게시판 FK 제약조건 추가

-- REVIEW - MEMBER 연결
ALTER TABLE REVIEW
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- REVIEW - PRODUCT 연결
ALTER TABLE REVIEW
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

-- REVIEW - PRODUCT_ORDER 연결
ALTER TABLE REVIEW
ADD FOREIGN KEY(P_ORDER_CD)
REFERENCES PRODUCT_ORDER(P_ORDER_CD);

-- REVIEW - SUBS 연결
ALTER TABLE REVIEW
ADD FOREIGN KEY(S_ORDER_CD)
REFERENCES SUBS_ORDER(S_ORDER_CD);


-- 리뷰 이미지 FK 추가
-- REVIEW_IMG - REVIEW 연결
ALTER TABLE REVIEW_IMG
ADD FOREIGN KEY(REVIEW_NO)
REFERENCES REVIEW(REVIEW_NO);

--------------------------------------------------------------------------------

-- 개별 상품 주문 FK 추가

-- PRODUCT_ORDER - MEMBER 연결
ALTER TABLE PRODUCT_ORDER
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- PRODUCT_ORDER - PRODUCT_DELIVERY 연결
ALTER TABLE PRODUCT_ORDER
ADD FOREIGN KEY(DELIVERY_CD)
REFERENCES PRODUCT_DELIVERY(DELIVERY_CD);

-- PRODUCT_ORDER - CART 연결
ALTER TABLE PRODUCT_ORDER
ADD FOREIGN KEY(CART_NO)
REFERENCES CART(CART_NO);


-- 개별상품 결제 FK 추가

-- PRODUCT_PAY - MEMBER 연결
ALTER TABLE PRODUCT_PAY
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- PRODUCT_PAY - PRODUCT_ORDER 연결
ALTER TABLE PRODUCT_PAY
ADD FOREIGN KEY(P_ORDER_CD)
REFERENCES PRODUCT_ORDER(P_ORDER_CD);


-- 개별상품 환불 FK 추가

-- PRODUCT_REFUND - PRODUCT_ORDER
ALTER TABLE PRODUCT_REFUND
ADD FOREIGN KEY(P_ORDER_CD)
REFERENCES PRODUCT_ORDER(P_ORDER_CD);

--------------------------------------------------------------------------------

-- 장바구니 FK 추가

-- CART - MEMBER 연결
ALTER TABLE CART
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- CART - PRODUCT 연결
ALTER TABLE CART
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

-- CART - OPTION 연결
ALTER TABLE CART
ADD FOREIGN KEY(OPTION_NO)
REFERENCES OPTION_TB(OPTION_NO);

--------------------------------------------------------------------------------

-- 주문별 선택 옵션 FK 추가

-- OPTION_TB - OPTION_TYPE 연결
ALTER TABLE OPTION_TB
ADD FOREIGN KEY(OPTION_CD)
REFERENCES OPTION_TYPE(OPTION_CD);

-- OPTION_TB - PRODUCT_ORDER 연결
ALTER TABLE OPTION_TB
ADD FOREIGN KEY(P_ORDER_CD)
REFERENCES PRODUCT_ORDER(P_ORDER_CD);

-- 옵션 종류 FK 추가

-- OPTION_TYPE - PRODUCT 연결
ALTER TABLE OPTION_TYPE
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

--------------------------------------------------------------------------------

-- 구독 상품 주문 FK 추가

-- SUBS_ORDER - MEMBER 연결
ALTER TABLE SUBS_ORDER
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- SUBS_ORDER - SUBS 연결
ALTER TABLE SUBS_ORDER
ADD FOREIGN KEY(S_CD)
REFERENCES SUBS(S_CD);

-- 구독 결제 FK 추가

-- SUBS_PAY - MEMBER 연결
ALTER TABLE SUBS_PAY
ADD FOREIGN KEY(MEMBER_NO)
REFERENCES MEMBER(MEMBER_NO);

-- SUBS_PAY - SUBS_ORDER 연결
ALTER TABLE SUBS_PAY
ADD FOREIGN KEY(S_ORDER_CD)
REFERENCES SUBS_ORDER(S_ORDER_CD);

-- 구독 배송 내역 FK 추가

-- SUBS_DELIVERY - PRODUCT_DELIVERY 연결
ALTER TABLE SUBS_DELIVERY
ADD FOREIGN KEY(DELIVERY_CD)
REFERENCES PRODUCT_DELIVERY(DELIVERY_CD);

-- SUBS_DELIVERY - SUBS_ORDER
ALTER TABLE SUBS_DELIVERY
ADD FOREIGN KEY(S_ORDER_CD)
REFERENCES SUBS_ORDER(S_ORDER_CD);

-- 제외 상품 FK 추가

-- SUBS_EXCEPTION - PRODUCT
ALTER TABLE SUBS_EXCEPTION
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

-- SUBS_EXCEPTION - SUBS_ORDER
ALTER TABLE SUBS_EXCEPTION
ADD FOREIGN KEY(S_ORDER_CD)
REFERENCES SUBS_ORDER(S_ORDER_CD);

--------------------------------------------------------------------------------

-- 상품 FK 추가

-- PRODUCT - P_CATEGORY 연결
ALTER TABLE PRODUCT
ADD FOREIGN KEY(P_CATEGORY_NO)
REFERENCES P_CATEGORY(P_CATEGORY_NO);

-- PRODUCT - FARM 연결
ALTER TABLE PRODUCT
ADD FOREIGN KEY(FARM_NO)
REFERENCES FARM(FARM_NO);

-- 상품 이미지 FK 추가

-- PRODUCT_IMG - PRODUCT 연결
ALTER TABLE PRODUCT_IMG
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

--------------------------------------------------------------------------------

-- 주별 상품 FK 추가

-- WEEKLY_P - PRODUCT
ALTER TABLE WEEKLY_P
ADD FOREIGN KEY(P_CD)
REFERENCES PRODUCT(P_CD);

-- WEEKLY_P - WEEKLY_LIST
ALTER TABLE WEEKLY_P
ADD FOREIGN KEY(P_LIST_NO)
REFERENCES WEEKLY_LIST(P_LIST_NO);

-- 상품 알림 FK 추가

-- P_MESSAGE - WEEKLY_LIST 연결
ALTER TABLE P_MESSAGE
ADD FOREIGN KEY(P_LIST_NO)
REFERENCES WEEKLY_LIST(P_LIST_NO);

-- P_MESSAGE - SUBS_ORDER 연결
ALTER TABLE P_MESSAGE
ADD FOREIGN KEY(S_ORDER_CD)
REFERENCES SUBS_ORDER(S_ORDER_CD);

CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;

CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;
CREATE SEQUENCE SEQ_P_CD NOCACHE;
CREATE SEQUENCE SEQ_ADMIN_NO NOCACHE;
CREATE SEQUENCE SEQ_CART_NO NOCACHE;
CREATE SEQUENCE SEQ_P_CATEGORY_NO NOCACHE;
CREATE SEQUENCE SEQ_P_ORDER_CD NOCACHE;
CREATE SEQUENCE SEQ_P_MESSAGE_NO NOCACHE;
CREATE SEQUENCE SEQ_P_LIST_NO NOCACHE;
CREATE SEQUENCE SEQ_FARM_NO NOCACHE;
CREATE SEQUENCE SEQ_OPTION_CD NOCACHE;
CREATE SEQUENCE SEQ_PRODUCT_NO NOCACHE;
CREATE SEQUENCE SEQ_PRODUCT_IMG NOCACHE;
CREATE SEQUENCE SEQ_DELIVERY_CD NOCACHE;
CREATE SEQUENCE SEQ_REVIEW_IMG_NO NOCACHE;
CREATE SEQUENCE SEQ_P_PAY_NO NOCACHE;
CREATE SEQUENCE SEQ_S_PAY_NO NOCACHE;
CREATE SEQUENCE SEQ_S_ORDER_CD NOCACHE;
CREATE SEQUENCE SEQ_FAQ_CD NOCACHE;
CREATE SEQUENCE SEQ_FAQ_CATEGORY_NO NOCACHE;
CREATE SEQUENCE SEQ_S_DELIVERY_CD NOCACHE;
DROP SEQUENCE SEQ_S_DELIVERY_CD;
CREATE SEQUENCE SEQ_OPTION_NO NOCACHE;
CREATE SEQUENCE SEQ_S_NO NOCACHE;
CREATE SEQUENCE SEQ_P_REFUND_CD NOCACHE;

INSERT INTO PRODUCT_DELIVERY
VALUES(SEQ_DELIVERY_CD.NEXTVAL, '배송완');

INSERT INTO PRODUCT
VALUES(SEQ_P_CD.NEXTVAL, 1, 1, '못난이바나나' , 15000, DEFAULT, '못난이 바나나 아주 맛나요~' , DEFAULT, SYSDATE);


INSERT INTO FARM
VALUES(SEQ_FARM_NO.NEXTVAL, '다영이네', '다영' , '제주도');

INSERT INTO P_CATEGORY
VALUES(SEQ_P_CATEGORY_NO.NEXTVAL, '과일류');

SELECT * FROM FARM;
SELECT * FROM P_CATEGORY;

SELECT PRODUCT_NM, ORIGIN

ALTER TABLE MEMBER
DROP COLUMN SECESSION_CNT;

DROP TABLE SECESSION_CNT;

--회원 탈퇴 사유 테이블
CREATE TABLE "SECESSION_CNT" (
	"SECESSION_CD"	NUMBER	NOT NULL,
	"SECESSION_CNT"	VARCHAR2(200)	NOT NULL
   
);

--MEMBER 테이블에 SECESSION_CD 추가
ALTER TABLE MEMBER add (SECESSION_CD NUMBER); 

--제약조건 추가
ALTER TABLE "SECESSION_CNT" ADD CONSTRAINT "PK_SECESSION_CNT" PRIMARY KEY (
	"SECESSION_CD"
);

--컬럼 추가
COMMENT ON COLUMN "SECESSION_CNT"."SECESSION_CD" IS '회원 탈퇴 코드';
COMMENT ON COLUMN "SECESSION_CNT"."SECESSION_CNT" IS '회원 탈퇴 사유 내용';

--사유  샘플테이블 
INSERT INTO SECESSION_CNT VALUES(1, '더 이상 서비스가 필요하지 않아요.');
INSERT INTO SECESSION_CNT VALUES(2, '서비스가 마음에 들지 않아요.');
INSERT INTO SECESSION_CNT VALUES(3, '구독료가 부담스러워요.');
INSERT INTO SECESSION_CNT VALUES(4, '비밀!!');


SELECT * FROM SECESSION_CNT;


INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, 1, '감자', '10000', 'I', NULL, SYSDATE, NULL);

INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, 1, '고구마', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, 1, '우엉', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, 1, '무', '10000', 'I', NULL, SYSDATE, NULL);
INSERT INTO PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 1, 1, '연근', '10000', 'I', NULL, SYSDATE, NULL);

-- FARM SAMPLE DATA
INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '당근 농장', '바니바니', '뿌리채소 마을', DEFAULT
);

INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '감자 농장', '감사합니다', '뿌리채소 마을', DEFAULT
);

INSERT INTO FARM VALUES(
    SEQ_FARM_NO.NEXTVAL, '토마토 농장', '멋쟁이', '열매채소 마을', DEFAULT
);


ALTER TABLE FARM
ADD FARM_ST CHAR(1) DEFAULT 'Y';

UPDATE FARM SET
FARM_ST = 'Y';

ALTER TABLE FARM
MODIFY FARM_ST NOT NULL;

COMMENT ON COLUMN FARM.FARM_ST IS '농장 등록 상태';

-- 배송 상태 샘플데이터
INSERT INTO PRODUCT_DELIVERY VALUES(1, '배송 전');
INSERT INTO PRODUCT_DELIVERY VALUES(2, '배송 중');
INSERT INTO PRODUCT_DELIVERY VALUES(3, '배송 완');

-- 개별 상품 주문 샘플데이터1
INSERT INTO PRODUCT_ORDER VALUES(
   SEQ_P_ORDER_CD.NEXTVAL, SYSDATE, '김민규', '01017171717', '우리집', '3000', 
   '빨리!', '3000', DEFAULT, 3, 3, 1);


select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME from user_constraints
where CONSTRAINT_NAME = 'SYS_C0023161' ;

-- 개별 상품 주문 샘플데이터2
INSERT INTO PRODUCT_ORDER VALUES(
  'J20220720-005', SYSDATE, '백떡볶이', '01042542168', '청담동 79-29 1층', '10000', 
   '딱복 땡긴다', '3000', DEFAULT, 3, 3, 1);


-- 개별 상품 주문 샘플데이터3
INSERT INTO PRODUCT_ORDER VALUES(
  'J20220720-007', SYSDATE, '쩐다영', '01042542168', '공평동 꼼장어 1층', '10000', 
   '딱복 땡긴다', '3000', DEFAULT, 3, 1, 1);


-- 개별 상품 주문 샘플데이터4
INSERT INTO PRODUCT_ORDER VALUES(
  'J20220720-010', SYSDATE, '쩐다영', '01042542123', '이도 곰탕', '11000', 
   ' 김치 많이', '3000', DEFAULT, 3, 1, 1);

SELECT * FROM PRODUCT_ORDER;

ALTER TABLE OPTION_TB DROP CONSTRAINT SYS_C0023621;

ALTER TABLE CART DROP CONSTRAINT SYS_C0023161;


SELECT * FROM OPTION_TB;

DELETE FROM PRODUCT_ORDER
WHERE P_ORDER_CD ='J20220720-007' ;


SELECT * FROM PRODUCT_PAY;

DELETE FROM PRODUCT_PAY
WHERE P_ORDER_CD = 3;

SELECT * FROM PRODUCT_ORDER;




DELETE FROM PRODUCT_ORDER;
WHERE DELIVERY_CD = 7;

-- 장바구니 샘플데이터
INSERT INTO CART VALUES(SEQ_CART_NO.NEXTVAL, 3, 1);
INSERT INTO CART VALUES(SEQ_CART_NO.NEXTVAL, 3, 2);

SELECT * FROM PRODUCT_ORDER;


-- 주문별 선택 옵션 샘플데이터
INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 1, DEFAULT,'J20220720-005');
INSERT INTO OPTION_TB VALUES(SEQ_OPTION_NO.NEXTVAL, 2, DEFAULT,'J20220720-010');

-- 옵션 종류 샘플데이터
INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 1, '1.5kg', 3000);
INSERT INTO OPTION_TYPE VALUES(SEQ_OPTION_CD.NEXTVAL, 1, '3kg', 6000);

ALTER TABLE OPTION_TB DROP COLUMN P_ORDER_CD;

ALTER TABLE CART
DROP COLUMN P_CD;


-- 멤버 컬럼 추가
ALTER TABLE MEMBER ADD SECESSION_DT DATE ;

--회원 탈퇴 SQL
UPDATE MEMBER SET 
MEMBER_ST='Y',
SECESSION_CD = #{choice},
SECESSION_DT = SYSDATE
WHERE MEMBER_NO = #{memberNo};


--회원 탈퇴 N 으로 수정
UPDATE MEMBER SET 
MEMBER_ST ='Y'
WHERE MEMBER_NO=3;

--회원탈퇴후 24시 지남 업데이트
UPDATE MEMBER SET
SECESSION_DT = SYSDATE - 1.5
WHERE MEMBER_EMAIL = 'qkqh2387@hanmail.net';



SELECT MEMBER_NO, MEMBER_NAME, MEMBER_EMAIL, MEMBER_ST, FLOOR(SYSDATE - SECESSION_DT) PASS_ST
FROM MEMBER;


UPDATE MEMBER SET
SECESSION_DT = SYSDATE - 1.5
WHERE MEMBER_EMAIL = 'qkqh2387@hanmail.net';


-- 구독 상품(SUBS)
INSERT INTO SUBS VALUES('1', '스탠다드', '15500'); 
INSERT INTO SUBS VALUES('2', '점보', '25000');

-- 구독 상품 주문(SUBS_ORDER)
INSERT INTO SUBS_ORDER VALUES(
   SEQ_S_ORDER_CD.NEXTVAL, DEFAULT, DEFAULT, '김민규', 
   '01017171717', '우리집', '빨리조심',
   SYSDATE, 'Y', '2', 3, '1'
);
-- 구독 배송 조회 및 샘플데이터 삽입
SELECT * FROM SUBS_DELIVERY;
INSERT INTO SUBS_DELIVERY VALUES(
    SEQ_S_DELIVERY_CD.NEXTVAL, TO_DATE('20220718', 'YYYY-MM-DD'), 2, 3
); 
SELECT * FROM SUBS_ORDER;

SELECT COUNT(*) , MEMBER_NAME, S_NM, S_CYCLE
FROM SUBS_ORDER
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS USING(S_CD)

WHERE MEMBER_NO = 3
GROUP BY S_ORDER_CD,MEMBER_NAME, S_NM, S_CYCLE ;



--내구독취소
UPDATE SUBS_ORDER SET
S_CANCEL = 'Y'
WHERE MEMBER_NO = #{memberNo};
--구독 상품명, 구독 상품가격


-- 내 구독 상품 조회
SELECT MEMBER_NAME, S_NM, S_CYCLE
FROM SUBS_ORDER
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS USING(S_CD)
WHERE MEMBER_NO = 4
GROUP BY S_ORDER_CD,MEMBER_NAME, S_NM, S_CYCLE;


UPDATE SUBS_ORDER SET
S_CANCEL = 'N'
WHERE MEMBER_NO = 3;


--내 구독 현황 조회
SELECT MEMBER_NAME, S_NM, S_CYCLE
FROM SUBS_ORDER
JOIN MEMBER
USING(MEMBER_NO)
JOIN SUBS USING(S_CD)
WHERE MEMBER_NO = 3
AND S_CANCEL = 'N'
GROUP BY S_ORDER_CD,MEMBER_NAME, S_NM, S_CYCLE;




-- 개별 상품 주문 내역 조회
SELECT PRODUCT_ORDER.P_ORDER_CD, P_ORDER_DT, TOTAL_PRICE, DELIVERY_ST, PRODUCT_NM, ORIGIN
FROM PRODUCT_ORDER
JOIN PRODUCT_DELIVERY ON (PRODUCT_ORDER.DELIVERY_CD = PRODUCT_DELIVERY.DELIVERY_CD)
JOIN OPTION_TB ON (PRODUCT_ORDER.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
JOIN OPTION_TYPE ON (OPTION_TB.OPTION_CD = OPTION_TYPE.OPTION_CD)
JOIN PRODUCT ON (OPTION_TYPE.P_CD = PRODUCT.P_CD)
JOIN FARM ON (PRODUCT.FARM_NO = FARM.FARM_NO)
WHERE MEMBER_NO = 1
ORDER BY OPTION_TB.OPTION_CD;


SELECT * FROM PRODUCT_ORDER;
SELECT * FROM PRODUCT ORDER BY 1;
SELECT * FROM OPTION_TYPE ORDER BY 1;
SELECT * FROM OPTION_TB ORDER BY 1;
SELECT * FROM PRODUCT_ORDER;

UPDATE OPTION_TB SET 
P_ORDER_CD = '3';


-- *** 주문 내역 목록 ***
	SELECT P_ORDER_CD,TOTAL_PRICE,DELIVERY_ST,
			TO_CHAR(P_ORDER_DT,'YYYY-MM-DD') P_ORDER_DT
			, '[원산지 ' || (SELECT ORIGIN || '] ' ||	PRODUCT_NM 
							FROM PRODUCT_ORDER C
							JOIN OPTION_TB ON(C.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
							JOIN OPTION_TYPE USING(OPTION_CD)
							JOIN PRODUCT USING(P_CD)
							JOIN FARM USING(FARM_NO)
							WHERE C.P_ORDER_CD = B.P_ORDER_CD
							WHERE ROWNUM = 1) ORIGIN,
		
			(SELECT COUNT(*) - 1 CNT 
			FROM PRODUCT_ORDER B
			JOIN OPTION_TB ON(B.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
			JOIN OPTION_TYPE USING(OPTION_CD)
			JOIN PRODUCT USING(P_CD)
			JOIN FARM USING(FARM_NO)
			WHERE B.P_ORDER_CD = A.P_ORDER_CD ) CNT,
		
			NVL( (SELECT '1' FROM PRODUCT_REFUND WHERE P_ORDER_CD = A.P_ORDER_CD ), 0) REFUND_ST
		
		FROM PRODUCT_ORDER A
		JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
		WHERE MEMBER_NO = #{memberNo}
	ORDER BY P_ORDER_DT DESC


SELECT P_ORDER_CD,TOTAL_PRICE,DELIVERY_ST,
	TO_CHAR(P_ORDER_DT, 'YYYY/MM/DD') P_ORDER_DT,

	'[원산지 ' || (SELECT ORIGIN || '] ' || PRODUCT_NM FROM PRODUCT_ORDER
				JOIN OPTION_TB USING(P_ORDER_CD)
				JOIN OPTION_TYPE USING(OPTION_CD)
				JOIN PRODUCT USING(P_CD)
				JOIN FARM USING(FARM_NO)
				WHERE P_ORDER_CD = '20220724-0047'
				AND ROWNUM = 1) ORIGIN,

	(SELECT COUNT(*) - 1 CNT FROM PRODUCT_ORDER
	JOIN OPTION_TB USING(P_ORDER_CD)
	JOIN OPTION_TYPE USING(OPTION_CD)
	JOIN PRODUCT USING(P_CD)
	JOIN FARM USING(FARM_NO)
	WHERE P_ORDER_CD = '20220724-0047') CNT
FROM PRODUCT_ORDER
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
WHERE MEMBER_NO =5
AND P_ORDER_CD = '20220724-0047';


SELECT P_ORDER_CD,TOTAL_PRICE,DELIVERY_ST,
			TO_CHAR(P_ORDER_DT,'YYYY-MM-DD') P_ORDER_DT
			, '[원산지 ' || (SELECT ORIGIN || '] ' ||	PRODUCT_NM 
							FROM PRODUCT_ORDER C
							JOIN OPTION_TB ON(C.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
							JOIN OPTION_TYPE USING(OPTION_CD)
							JOIN PRODUCT USING(P_CD)
							JOIN FARM USING(FARM_NO)
							WHERE ROWNUM = 1
                     AND C.P_ORDER_CD = '20220724-0047') ORIGIN,
		
			(SELECT COUNT(*) - 1 CNT 
			FROM PRODUCT_ORDER B
			JOIN OPTION_TB ON(B.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
			JOIN OPTION_TYPE USING(OPTION_CD)
			JOIN PRODUCT USING(P_CD)
			JOIN FARM USING(FARM_NO)
			WHERE B.P_ORDER_CD = A.P_ORDER_CD ) CNT,
		
			NVL( (SELECT '1' FROM PRODUCT_REFUND WHERE P_ORDER_CD = A.P_ORDER_CD ), 0) REFUND_ST
		
		FROM PRODUCT_ORDER A
		JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
		WHERE MEMBER_NO = '5'
      AND A.P_ORDER_CD = '20220724-0047'
	ORDER BY P_ORDER_DT DESC;



--주문 EX_UPLOAD_DATE내역 목록에 사용할 원산지 상품명 1행
SELECT ORIGIN || '] ' || PRODUCT_NM FROM PRODUCT_ORDER
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
JOIN FARM USING(FARM_NO)
WHERE P_ORDER_CD ='20220724-0047'
AND ROWNUM = 1;


-- 주문 내역 목록에 표시할 상품 개수 -1 ( XXX 외 3개 )
SELECT COUNT(*) - 1 CNT FROM PRODUCT_ORDER
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT USING(P_CD)
JOIN FARM USING(FARM_NO)
WHERE P_ORDER_CD ='20220724-0047';






SELECT * FROM PRODUCT_IMG;

-- *** 주문 내역 상세 조회 *** 
SELECT P_ORDER_CD, PRODUCT_NM, PRODUCT_PRICE, OPTION_PRICE, OPTION_NM, DELIVERY_ST, OPTION_COUNT, IMG_RENAME
FROM PRODUCT_ORDER
JOIN OPTION_TB USING(P_ORDER_CD)
JOIN OPTION_TYPE USING(OPTION_CD)
JOIN PRODUCT ON(OPTION_TYPE.P_CD = PRODUCT.P_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
LEFT JOIN PRODUCT_IMG ON(PRODUCT.P_CD = PRODUCT_IMG.P_CD)
WHERE P_ORDER_CD = 3;



-- *** 주문 정보 조회 ***
SELECT P_ORDER_CD, MEMBER_NAME, P_PAY_DT,TOTAL_PRICE,  P_ORDER_NM,P_ORDER_PHONE,P_ORDER_ADDR,P_DL_REQ
FROM PRODUCT_ORDER 
JOIN MEMBER USING(MEMBER_NO)
JOIN PRODUCT_PAY USING(P_ORDER_CD)
WHERE P_ORDER_CD = 3;


INSERT INTO PRODUCT_PAY VALUES (1,SYSDATE,6000,3,3);

UPDATE PRODUCT_PAY SET 
P_PAY_DT = TO_DATE('2022/07/18 20:20:20', 'YYYY/MM/DD HH24:MI:SS')
WHERE MEMBER_NO = 3;

--배송 정보 조회
SELECT P_ORDER_NM,P_ORDER_PHONE,P_ORDER_ADDR,P_DL_REQ
FROM PRODUCT_ORDER ;


-- 구독 내역 목록 조회할려고 이것저것..
SELECT * FROM SUBS_ORDER;
SELECT * FROM SUBS;
SELECT * FROM SUBS_DELIVERY;
SELECT * FROM PRODUCT_DELIVERY;
SELECT SEQ_S_DELIVERY_CD.NEXTVAL FROM DUAL;
SELECT SEQ_S_DELIVERY_CD.CURRVAL FROM DUAL; 
INSERT INTO SUBS_DELIVERY VALUES (SEQ_S_DELIVERY_CD.NEXTVAL,SYSDATE,1,2);
SELECT * FROM SUBS_PAY;
INSERT INTO SUBS_PAY VALUES(SEQ_SUBS_PAY_CD, , 구독 결제금액, 3,2 );
SELECT * FROM PRODUCT;
SELECT * FROM SUBS_EXCEPTION;
INSERT INTO SUBS_EXCEPTION VALUES(1,2);


-- <은비코드>구독 관련 조회
SELECT  S_ORDER_CD, MEMBER_NAME, S_PAY_AMOUNT, S_PAY_DT, S_ORDER_ADDR, 
        S_DELIVERY_DT, DELIVERY_ST, S_DL_REQ, S_NM, S_CYCLE,
        (SELECT LISTAGG(PRODUCT_NM, ', ') WITHIN GROUP (ORDER BY S_ORDER_CD)
        FROM SUBS_ORDER 
        JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
        JOIN PRODUCT USING(P_CD)
        WHERE S_ORDER_CD = 3) PRODUCT_NM
FROM SUBS_PAY
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN SUBS_ORDER USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
JOIN SUBS USING(S_CD)
WHERE S_ORDER_CD = 3;

-- <은비코드>LISTAGG(team, '/') WITHIN GROUP (ORDER BY team desc)
-- 제외 품목명만 나오는 sql
SELECT LISTAGG(PRODUCT_NM, ',') WITHIN GROUP (ORDER BY S_ORDER_CD)
FROM SUBS_ORDER 
JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
JOIN PRODUCT USING(P_CD)
WHERE S_ORDER_CD = 3;


SELECT * FROM SUBS_DELIVERY;

INSERT INTO SUBS_DELIVERY VALUES (
	SEQ_S_DELIVERY_CD.NEXTVAL,
	SYSDATE,
	1,
	'J20220720-004'
);





-- *** 구독 내역 목록 ***
-- SELECT 	S_ORDER_CD,S_NM,
-- 		TO_CHAR(S_DT,'YYYY/MM/DD') S_PAY_DT,
-- 		S_PAY_AMOUNT,
-- 		DELIVERY_ST

-- FROM SUBS_ORDER A
-- JOIN SUBS B USING(S_CD)
-- JOIN SUBS_PAY USING(S_ORDER_CD)
-- JOIN SUBS_DELIVERY USING(S_ORDER_CD)
-- JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
-- WHERE MEMBER_NO = 3;

SELECT *FROM MEMBER;

SELECT * FROM SUBS_PAY;
SELECT * FROM SUBS_ORDER;





--구독 결제 테이블 샘플데이터
INSERT INTO SUBS_PAY VALUES(
	SEQ_S_PAY_NO.NEXTVAL,
	SYSDATE,
	'25500',
	3,
	'J20220720-004'
);





--*** 구독 내역 목록 ***
SELECT 	S_ORDER_CD,S_NM,
		TO_CHAR(S_DT,'YYYY/MM/DD') S_PAY_DT,
		S_PAY_AMOUNT,
		DELIVERY_ST

FROM SUBS_ORDER A
JOIN SUBS B ON (A.S_CD = B.S_CD)
JOIN SUBS_PAY USING(S_ORDER_CD)
JOIN SUBS_DELIVERY USING(S_ORDER_CD)
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
WHERE A.MEMBER_NO = 3;

-- *** 구독 정보 조회 ***
SELECT S_ORDER_CD,MEMBER_NAME,S_PAY_DT,S_PAY_AMOUNT,S_ORDER_NM,S_ORDER_PHONE,S_ORDER_ADDR,S_DL_REQ,
	(SELECT LISTAGG(PRODUCT_NM, ',') WITHIN GROUP (ORDER BY S_ORDER_CD)
	FROM SUBS_ORDER 
	JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
	JOIN PRODUCT USING(P_CD)
	WHERE S_ORDER_CD = 'J20220720-004') PRODUCT_NM
FROM SUBS_ORDER
JOIN MEMBER USING(MEMBER_NO)
JOIN SUBS_PAY USING(S_ORDER_CD)
JOIN SUBS USING(S_CD);

ALTER TABLE PRODUCT_PAY MODIFY P_PAY_NO VARCHAR2(20);

SELECT * FROM PRODUCT_ORDER;
SELECT * FROM PRODUCT_PAY;
INSERT INTO PRODUCT_PAY VALUES(1,SYSDATE,10000,3,'J20220720-005');

SELECT * FROM PRODUCT_REFUND;


--환불 샘플데이터
INSERT INTO PRODUCT_REFUND VALUES(SEQ_P_REFUND_CD.NEXTVAL, SYSDATE, 20500, DEFAULT, 
    (SELECT P_ORDER_CD FROM PRODUCT_ORDER 
    WHERE MEMBER_NO = 3)
);




--**개별 주문 목록 조회**
SELECT P_ORDER_CD,TOTAL_PRICE,DELIVERY_ST,
	TO_CHAR(P_ORDER_DT,'YYYY/MM/DD') P_ORDER_DT
	, '[원산지 ' || (SELECT ORIGIN || '] ' ||	PRODUCT_NM 
					FROM PRODUCT_ORDER C
					JOIN OPTION_TB ON(C.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
					JOIN OPTION_TYPE USING(OPTION_CD)
					JOIN PRODUCT USING(P_CD)
					JOIN FARM USING(FARM_NO)
					WHERE ROWNUM = 1) ORIGIN,

	(SELECT COUNT(*) - 1 CNT 
	FROM PRODUCT_ORDER B
	JOIN OPTION_TB ON(B.P_ORDER_CD = OPTION_TB.P_ORDER_CD)
	JOIN OPTION_TYPE USING(OPTION_CD)
	JOIN PRODUCT USING(P_CD)
	JOIN FARM USING(FARM_NO)
	WHERE B.P_ORDER_CD = A.P_ORDER_CD ) CNT,

	NVL( (SELECT '1' FROM PRODUCT_REFUND WHERE P_ORDER_CD = A.P_ORDER_CD ), 0) REFUND_ST

FROM PRODUCT_ORDER A
JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
WHERE MEMBER_NO = 3 /* #{memberNo} */
ORDER BY P_ORDER_DT DESC;



;


SELECT '1' FROM PRODUCT_REFUND WHERE P_ORDER_CD = 'J20220720-005';

-- UPDATE PRODUCT_ORDER SET
-- DELIVERY_CD=4
-- WHERE P_ORDER_CD = 'J20220720-005';

-- SELECT * FROM PRODUCT_DELIVERY;


select * from product_order;
SELECT * FROM SUBS_PAY;
DELETE FROM SUBS_ORDER
WHERE S_ORDER_CD = '2';

SELECT * FROM PRODUCT_ORDER;
SELECT * FROM OPTION_TB;
SELECT * FROM OPTION_TYPE;
SELECT * FROM PRODUCT;
SELECT * FROM FARM;

INSERT INTO OPTION_TB VALUES(
	
);
SELECT * FROM SUBS_ORDER;

DELETE FROM SUBS_ORDER
WHERE S_ORDER_CD =2;



--상세조회
SELECT S_ORDER_CD,MEMBER_NAME,S_PAY_DT,S_PAY_AMOUNT,S_ORDER_NM,S_ORDER_PHONE,S_ORDER_ADDR,S_DL_REQ,
	(SELECT LISTAGG(PRODUCT_NM, ',') WITHIN GROUP (ORDER BY S_ORDER_CD)
	FROM SUBS_ORDER 
	JOIN SUBS_EXCEPTION USING(S_ORDER_CD)
	JOIN PRODUCT USING(P_CD)
	JOIN MEMBER USING(MEMBER_NO)
	WHERE S_ORDER_CD = 'J20220722-0048'
	) PRODUCT_NM
	
	
	FROM SUBS_ORDER
	JOIN MEMBER USING(MEMBER_NO)
	JOIN SUBS_PAY USING(S_ORDER_CD)
	JOIN SUBS USING(S_CD)
	WHERE S_ORDER_CD = 'J20220722-0048'
	AND S_CANCEL = 'N';
	


SELECT * FROM SUBS_ORDER;

--구독 목록 조회
	SELECT S_ORDER_CD,S_NM,
	TO_CHAR(S_PAY_DT,'YYYY/MM/DD') S_PAY_DT,
	S_PAY_AMOUNT,
	DELIVERY_ST

	FROM SUBS_ORDER A
	JOIN SUBS B ON (A.S_CD = B.S_CD)
	JOIN SUBS_PAY USING(S_ORDER_CD)
	JOIN SUBS_DELIVERY USING(S_ORDER_CD)
	JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
	WHERE A.MEMBER_NO = #{memberNo}
    AND S_CANCEL = 'N'
	ORDER BY S_PAY_DT DESC;

INSERT INTO PRODUCT_REFUND VALUES(    SEQ_P_REFUND_CD.NEXTVAL, SYSDATE,     (SELECT TOTAL_PRICE FROM PRODUCT_ORDER WHERE P_ORDER_CD = '20220723-0040'),  DEFAULT, '20220723-0040'  );

CREATE SEQUENCE SEQ_P_REFUND_CD NOCACHE;


SELECT P_ORDER_CD, PRODUCT_NM, PRODUCT_PRICE, OPTION_PRICE, OPTION_NM, DELIVERY_ST, OPTION_COUNT, IMG_ROOT

		FROM PRODUCT_ORDER
		JOIN OPTION_TB USING(P_ORDER_CD)
		JOIN OPTION_TYPE USING(OPTION_CD)
		JOIN PRODUCT ON(OPTION_TYPE.P_CD = PRODUCT.P_CD)
		JOIN PRODUCT_DELIVERY USING(DELIVERY_CD)
		LEFT JOIN PRODUCT_IMG ON(PRODUCT.P_CD = PRODUCT_IMG.P_CD)
		WHERE P_ORDER_CD = '20220723-0040'
		AND PRODUCT_IMG='1';