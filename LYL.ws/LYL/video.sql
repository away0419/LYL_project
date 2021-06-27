--전체 테이블, 시퀀스 삭제--
drop table myuser CASCADE CONSTRAINTS;
drop table video CASCADE CONSTRAINTS;
drop table mycomment CASCADE CONSTRAINTS;
drop table myboard CASCADE CONSTRAINTS;
drop table boardcomment CASCADE CONSTRAINTS;
drop table commentlike CASCADE CONSTRAINTS;
drop table watchrecord CASCADE CONSTRAINTS;
drop table aftervideo CASCADE CONSTRAINTS;
drop table videolike CASCADE CONSTRAINTS;
drop table theme CASCADE CONSTRAINTS;
drop table hint CASCADE CONSTRAINTS;
drop table subscrib CASCADE CONSTRAINTS;
drop sequence myuser_seq;
drop sequence video_seq;
drop sequence mycomment_seq;
drop sequence myboard_seq;
drop sequence boardcomment_seq;
drop sequence theme_seq;
-- 전체 테이블, 시퀀스 삭제--

--시퀀스---
create sequence myuser_seq
start with 1
increment by 1
nocache;

create sequence video_seq
start with 1
increment by 1
nocache;

create sequence mycomment_seq
start with 1
increment by 1
nocache;

create sequence myboard_seq
start with 1
increment by 1
nocache;

create sequence boardcomment_seq
start with 1
increment by 1
nocache;

create sequence theme_seq
start with 1
increment by 1
nocache;
--시퀀스----

/* 회원 정보 */
CREATE TABLE MYUSER (    
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL, /* 아이디 */
	userPwd VARCHAR2(100) NOT NULL, /* 비밀번호 */
	userName VARCHAR2(50) NOT NULL, /* 이름 */
	userPhone NUMBER NOT NULL, /* 폰번호 */
	userEmail VARCHAR2(255) NOT NULL, /* 이메일 */
	userJoin TIMESTAMP DEFAULT sysdate, /* 가입일 */
	userSub NUMBER DEFAULT 0, /* 구독자수 */
    userImgName varchar(255)  NULL ,/* 유저이미지이름*/
    userImgSize number default 0, /*유저이미지사이즈*/
    userImgOriName varchar(255) null, /*이미지 변경전 파일명*/
    userDelFalg char default 'N' /*삭제 Flag*/     
);

CREATE UNIQUE INDEX PK_MYUSER
	ON MYUSER (
		userNo ASC
	);

ALTER TABLE MYUSER
	ADD
		CONSTRAINT PK_MYUSER
		PRIMARY KEY (
			userNo
		);

/* 시청 기록 */
CREATE TABLE WATCHRECORD (
	userNo NUMBER NOT NULL, /* 크리에이터 */
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	watchDate TIMESTAMP DEFAULT sysdate NOT NULL /* 시청 날짜 */
);

/* 영상좋아요 */
CREATE TABLE VIDEOLIKE (
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

/* 나중에볼 동영상 */
CREATE TABLE AFTERVIDEO (
	userNo NUMBER NOT NULL, /* 크리에이터 */
	vidNo NUMBER NOT NULL /* 영상 번호 */
);

/* 댓글좋아요 */
CREATE TABLE COMMENTLIKE (
	comNo NUMBER NOT NULL, /* 댓글 번호 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

/* 태마별 영상 */
CREATE TABLE THEME (
	thNo NUMBER NOT NULL, /* 태마번호 */
	thName VARCHAR2(100) NOT NULL /* 태마이름 */
);

CREATE UNIQUE INDEX PK_THEME
	ON THEME (
		thNo ASC
	);

ALTER TABLE THEME
	ADD
		CONSTRAINT PK_THEME
		PRIMARY KEY (
			thNo
		);

/* 구독 자 */
CREATE TABLE SUBSCRIB (
	userNo2 NUMBER, /* 크리에이터 */
	userNo NUMBER /* 구독자 */
);

/* 영상 */
CREATE TABLE VIDEO (
	vidNo NUMBER NOT NULL, /* 영상 번호 */
	vidTitle VARCHAR2(255) NOT NULL, /* 제목 */
	vidHits NUMBER DEFAULT 0, /* 조회수 */
	vidCom NUMBER DEFAULT 0, /* 댓글 */
	vidurl VARCHAR2(255) NOT NULL, /* 영상경로 */
	vidLike NUMBER DEFAULT 0, /* 좋아요 */
	vidDate TIMESTAMP DEFAULT sysdate, /* 업로드 시간 */
	vidEx VARCHAR2(255), /* 영상 설명 */
	vidTheme NUMBER NOT NULL, /* 태마 번호 */
	userNo NUMBER, /* 크리에이터 */
	vidThu VARCHAR2(255) NOT NULL, /* 썸네일경로 */
    vidName varchar(255)  NULL ,/* 영상 파일 이름*/
    vidSize number default 0, /*영상 사이즈*/
    vidOriName varchar(255) null /*영상 변경전 파일명*/   
);

CREATE UNIQUE INDEX PK_VIDEO
	ON VIDEO (
		vidNo ASC
	);

ALTER TABLE VIDEO
	ADD
		CONSTRAINT PK_VIDEO
		PRIMARY KEY (
			vidNo
		);

/* 영상댓글 */
CREATE TABLE MYCOMMENT (
	comNo NUMBER NOT NULL, /* 댓글 번호 */
	comCon VARCHAR2(255), /* 내용 */
	comDate TIMESTAMP DEFAULT sysdate, /* 날짜 */
	comRe NUMBER DEFAULT 0, /* 답글수 */
	comLike NUMBER DEFAULT 0, /* 좋아요 */
	comSec NUMBER DEFAULT 0, /* 비밀글 여부 */
	vidNo NUMBER, /* 영상 번호 */
	userNo NUMBER, /* 크리에이터 */
	comStep NUMBER DEFAULT 0, /* 댓글 단계 */
	comSort NUMBER DEFAULT 0, /* 댓글 정렬 번호 */
	comGroup NUMBER /* 댓글 그룹 번호 */
);

CREATE UNIQUE INDEX PK_MYCOMMENT
	ON MYCOMMENT (
		comNo ASC
	);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT PK_MYCOMMENT
		PRIMARY KEY (
			comNo
		);

/* 게시글 댓글 */
CREATE TABLE BOARDCOMMENT (
	bcNo NUMBER NOT NULL, /* 댓글 번호 */
	bcCom VARCHAR2(255) NOT NULL, /* 내용 */
	bcDate TIMESTAMP DEFAULT sysdate NOT NULL, /* 날짜 */
	bcStep NUMBER DEFAULT 0, /* 댓글 단계 */
	bcSort NUMBER DEFAULT 0, /* 댓글 정렬 번호 */
	bcGroupNo NUMBER, /* 댓글 그룹 번호 */
	boNo NUMBER NOT NULL, /* 게시판번호 */
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL /* 글쓴이 */
);
    
ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT PK_BOARDCOMMENT
		PRIMARY KEY (
			bcNo
		);


/* 게시판 */
CREATE TABLE MYBOARD (
	boNo NUMBER NOT NULL, /* 게시판번호 */
	boTitle VARCHAR2(255) NOT NULL, /* 제목 */
	boCon VARCHAR2(255) NOT NULL, /* 내용 */
	boHits NUMBER DEFAULT 0, /* 조회수 */
	boCom NUMBER DEFAULT 0, /* 댓글수 */
	boDate TIMESTAMP DEFAULT sysdate NOT NULL, /* 작성일 */
	userNo NUMBER NOT NULL, /* 크리에이터 */
	userId VARCHAR2(100) NOT NULL /* 글쓴이 */
);

ALTER TABLE MYBOARD
	ADD
		CONSTRAINT PK_MYBOARD
		PRIMARY KEY (
			boNo
		);

/* 힌트 질문  */
CREATE TABLE HINT (
	hintQuest VARCHAR2(255) NOT NULL, /* 질문 */
	hintAns VARCHAR2(255) NOT NULL, /* 답 */
	userNo NUMBER NOT NULL /* 크리에이터 */
);

ALTER TABLE WATCHRECORD
	ADD
		CONSTRAINT FK_MYUSER_TO_WATCHRECORD
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE WATCHRECORD
	ADD
		CONSTRAINT FK_VIDEO_TO_WATCHRECORD
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE VIDEOLIKE
	ADD
		CONSTRAINT FK_VIDEO_TO_VIDEOLIKE
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE VIDEOLIKE
	ADD
		CONSTRAINT FK_MYUSER_TO_VIDEOLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE AFTERVIDEO
	ADD
		CONSTRAINT FK_MYUSER_TO_AFTERVIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE AFTERVIDEO
	ADD
		CONSTRAINT FK_VIDEO_TO_AFTERVIDEO
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE COMMENTLIKE
	ADD
		CONSTRAINT FK_MYCOMMENT_TO_COMMENTLIKE
		FOREIGN KEY (
			comNo
		)
		REFERENCES MYCOMMENT (
			comNo
		);

ALTER TABLE COMMENTLIKE
	ADD
		CONSTRAINT FK_MYUSER_TO_COMMENTLIKE
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_MYUSER_TO_SUBSCRIB
		FOREIGN KEY (
			userNo2
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE SUBSCRIB
	ADD
		CONSTRAINT FK_MYUSER_TO_SUBSCRIB2
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE VIDEO
	ADD
		CONSTRAINT FK_MYUSER_TO_VIDEO
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT FK_VIDEO_TO_MYCOMMENT
		FOREIGN KEY (
			vidNo
		)
		REFERENCES VIDEO (
			vidNo
		);

ALTER TABLE MYCOMMENT
	ADD
		CONSTRAINT FK_MYUSER_TO_MYCOMMENT
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);


ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT FK_MYBOARD_TO_BOARDCOMMENT
		FOREIGN KEY (
			boNo
          
            
		)
		REFERENCES MYBOARD (
			boNo     
       
		)
        ON DELETE CASCADE;

ALTER TABLE BOARDCOMMENT
	ADD
		CONSTRAINT FK_MYUSER_TO_BOARDCOMMENT
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);



ALTER TABLE MYBOARD
	ADD
		CONSTRAINT FK_MYUSER_TO_MYBOARD
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);

ALTER TABLE HINT
	ADD
		CONSTRAINT FK_MYUSER_TO_HINT
		FOREIGN KEY (
			userNo
		)
		REFERENCES MYUSER (
			userNo
		);
        
--유저 정보--        
insert into myuser values(0,'min','min','admin',01000000000,'lyl@gmail.com',default,default,null,default,null, default );
insert into myuser values(myuser_seq.nextval,'admin','admin','admin',01000000000,'lylpro10@gmail.com',default,default,null,default,null, default );
insert into myuser values(myuser_seq.nextval,'aaa','aaa','aaa',01000000001,'aaa@naver.com',default,default,null,default,null, default );
insert into myuser values(myuser_seq.nextval,'bbb','bbb','bbb',01000000002,'bbb@gmail.com',default,default,null,default,null, default );
--유저 정보--


--테마 정보--
insert into theme values(theme_seq.nextval,'게임');
insert into theme values(theme_seq.nextval,'영화');
insert into theme values(theme_seq.nextval,'학습');
insert into theme values(theme_seq.nextval,'스포츠');
insert into theme values(theme_seq.nextval,'기타');
--테마 정보--


--비디오 정보--
--게임 no 1--
insert into video values(video_seq.nextval,'2021년PC온라인게임순위 전세계TOP10',1000,14,'https://www.youtube.com/embed/XDB-ew_nFjo',default,default,'2021년 PC 온라인게임순위 (1월통합)',1,1,'http://img.youtube.com/vi/XDB-ew_nFjo/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'게임판 사고사례는 게임보다 더 황당하다 [2021 2분기 이왜진 게임뉴스]',99999,default,'https://www.youtube.com/embed/0eiDYPxnt4c',default,default,'30년차 테트리스 고인물 / BTS마저 찌바르는 겜덕력 / 추신수 빠른무한 / 일본 국민게임에서 일본 때려잡는 한국인 / 삼탈워 참수 사태 등',1,1,'http://img.youtube.com/vi/0eiDYPxnt4c/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'뉴욕에 또다시 퍼진 바이러스, 알렉스 머서는 죽어야만 한다 - 프로토타입 2 스토리 한눈에 보기',100000,default,'https://www.youtube.com/embed/12280TgSiwU',default,default,'※ 게임 구매',1,1,'http://img.youtube.com/vi/12280TgSiwU/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../video/alal.mp4',1000000,default,'내용',1,1,'../thumbnail/lala.png', 'fileName', 100, 'fileOriName');

--영화 no 2--
insert into video values(video_seq.nextval,'정말... 이 영화가 개봉한다고...?',8888,default,'https://www.youtube.com/embed/R7HGsxi47l8',default,default,'*본 영상은 유료광고를 포함하고 있습니다.',2,1,'http://img.youtube.com/vi/R7HGsxi47l8/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'10,000명 몽골 대군을 막아낸 산골 마을 사냥꾼의 전설 [영화리뷰 결말포함]',666666,default,'https://www.youtube.com/embed/aH9BWyAP2JI',default,default,'[ 라이징 호크, 2019 ]',2,1,'http://img.youtube.com/vi/aH9BWyAP2JI/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'이 여자를 위협하면 어마무시한 일이 벌어집니다... (결말 포함)',333333,default,'https://www.youtube.com/embed/RNbJTDSgTLY',default,default,'틀딱이 소개하는 영화리뷰 시작합니다.',2,1,'http://img.youtube.com/vi/RNbJTDSgTLY/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영화 속 ''조정석'' 웃긴장면 모음 ZIP',99999999,default,'https://www.youtube.com/embed/j5jbymJVGT4',default,default,'영화는 [엑시트], [건축학개론], [형]입니다. 안녕하세요 ''영화에미치다'' 매드무비입니다.',2,1,'http://img.youtube.com/vi/j5jbymJVGT4/maxresdefault.jpg', 'fileName', 100, 'fileOriName');


--학습 no 3 --
insert into video values(video_seq.nextval, '아인슈타인이 받았던 공부', 8888888,default,'https://www.youtube.com/embed/hcymislezjI', default, default, '무언가를 배우고자 할 때 이 공부를 왜 해야 하는가 ', 3, 1,'http://img.youtube.com/vi/hcymislezjI/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '이 계획대로 공부하면 반드시 성공합니다. (학습 계획표)', 123132132,default,'https://www.youtube.com/embed/KQYJ_0yr-1Q', default, default, '공부가 어려우신가요? 이 계획대로라면 반드시 성공합니다! 계획표도 받아가세요', 3, 1,'http://img.youtube.com/vi/KQYJ_0yr-1Q/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '서울대 수석의 스터디 플래너. [학습 계획법 + 공부 집중력] 한꺼번에 2가지.', 456454,default,'https://www.youtube.com/embed/o2-rsPs47Zw', default, default, '수험생의 최대 고민인 계획 세우는 법, 집중 잘하는 법.', 3, 1,'http://img.youtube.com/vi/o2-rsPs47Zw/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '초등학생 자기주도학습 지도하는 10가지 방법 + 미쉘 교육철학', 8188181,default,'https://www.youtube.com/embed/wxdmIjLMPJM', default, default, '아침형 인간인 저희 아이가 주도적으로 스스로 학습을 할 수 있게 ', 3, 1,'http://img.youtube.com/vi/wxdmIjLMPJM/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '자기주도학습은 중요합니다. 그러나 왜곡되어 있습니다. | 자기주도학습의 정확한 방법', 354354,default,'https://www.youtube.com/embed/qIUDyLBAOdg', default, default, '모두가 중요하다고 하는 자기주도학습 ', 3, 1,'http://img.youtube.com/vi/qIUDyLBAOdg/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '공부하는 힘, 몰입 | 황농문 서울대학교 재료공학부 교수 | 공부 학습 시험 강연', 123,default,'https://www.youtube.com/embed/ukjYwSiYT1I', default, default, '? 강연 소개 : 도전이 아무리 어렵다고 해도, 내가 ', 3, 1,'http://img.youtube.com/vi/ukjYwSiYT1I/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '[동기부여,공부자극] 공부의지는 어디서 오는가?', 4545454,default,'https://www.youtube.com/embed/3XvGdiE_RlI', default, default, '나는 왜 ''공부의지''가 좀처럼 생기지 않을까요? ', 3, 1,'http://img.youtube.com/vi/3XvGdiE_RlI/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '서울대3121명이 공통적으로 쓰는 공부법을 공개합니다', 98498,default,'https://www.youtube.com/embed/sacbcLnZt8w', default, default, '서울대3121명이 공통적으로 쓰는 공부법을 공개합니다. ', 3, 1,'http://img.youtube.com/vi/sacbcLnZt8w/maxresdefault.jpg', 'fileName', 100, 'fileOriName');

--스포츠 no 4--
insert into video values(video_seq.nextval, '스포츠 역사상 가장 말도 안되는 30가지 순간', 34543,default,'https://www.youtube.com/embed/kRbC5CJeXec', default, default, '이건 새로 나온 피파 게임의 버그가 아닙니다, 눈으로 직접 봐야지만 믿을 수 있는 스포츠', 4, 1,'http://img.youtube.com/vi/kRbC5CJeXec/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '2020년, 그럼에도 우리가 스포츠를 사랑하는 이유', 818181,default,'https://www.youtube.com/embed/aJzltMZQ2IA', default, default, '2020년을 지내온 모든 분들, 수고하셨습니다.', 4, 1,'http://img.youtube.com/vi/aJzltMZQ2IA/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '프로 선수도 피해갈수 없는 실수들 - 스포츠 실패 모음', 879898,default,'https://www.youtube.com/embed/A3P4c5mwgtA', default, default, '원숭이도 나무에서 떨어질 때가 있다', 4, 1,'http://img.youtube.com/vi/A3P4c5mwgtA/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '[스포츠실험실] ''세팍타크로vs족구''가 붙으면 이런 모습입니다', 456465,default,'https://www.youtube.com/embed/Fm1GRdXS17k', default, default, '스포츠 실험실 2탄!', 4, 1,'http://img.youtube.com/vi/Fm1GRdXS17k/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '세계에서 가장 위험한 스포츠 기네스 TOP9', 1561651,default,'https://www.youtube.com/embed/RAMmLllvZlo', default, default, '400만뷰가 넘었던 이 영상이 사고장면이 혐오스럽다는', 4, 1,'http://img.youtube.com/vi/RAMmLllvZlo/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '스포츠 선수를 울게 만든 순간들', 98498,default,'https://www.youtube.com/embed/G1mGhvG3bbw', default, default, '강인한 스포츠 선수들을 울게 만들었던 슬프고 아픈 순간들', 4, 1,'http://img.youtube.com/vi/G1mGhvG3bbw/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '의도치 않게 발생한 놀라운 스포츠 순간들', 7897987,default,'https://www.youtube.com/embed/rMPTkPlFhwo', default, default, '스포츠 선수들도 놀란 순간들', 4, 1,'http://img.youtube.com/vi/rMPTkPlFhwo/maxresdefault.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval, '믿기지 않는 스포츠 선수들의 괴력', 35473,default,'https://www.youtube.com/embed/Eaad-9jEfdo', default, default, '스포츠 선수가 자신의 한계를 넘어설 때', 4, 1,'http://img.youtube.com/vi/Eaad-9jEfdo/maxresdefault.jpg', 'fileName', 100, 'fileOriName');


insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_181555854.mp4',1000000,default,'내용',5,3,'../videoFile/200x200.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558541.mp4',1000000,default,'내용',5,3,'../videoFile/200x2001.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558542.mp4',1000000,default,'내용',5,3,'../videoFile/200x2002.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558543.mp4',1000000,default,'내용',5,3,'../videoFile/200x2003.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558544.mp4',1000000,default,'내용',5,3,'../videoFile/200x2004.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558545.mp4',1000000,default,'내용',5,3,'../videoFile/200x2005.jpg', 'fileName', 100, 'fileOriName');
insert into video values(video_seq.nextval,'영상 제목',4863215,default,'../videoFile/KakaoTalk_20200811_1815558546.mp4',1000000,default,'내용',5,3,'../videoFile/200x2006.jpg', 'fileName', 100, 'fileOriName');
--비디오 정보--

--댓글 정보--
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다1',default,3,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다2',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다3',default,22,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다4',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다5',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다6',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다7',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다8',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다9',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다10',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다11',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다12',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다13',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다14',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다15',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다16',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다17',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다18',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다19',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다20',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다21',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다22',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다23',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다24',default,default,default,default,1,1,default,default,0);
insert into mycomment values(mycomment_seq.nextval,'댓글내용입니다25',default,default,default,default,1,1,default,default,0);


--답글
insert into mycomment values(mycomment_seq.nextval,'1답글내용입니다1',default,default,default,default,1,1,1,default,1);
insert into mycomment values(mycomment_seq.nextval,'1답글내용입니다1',default,default,default,default,1,1,1,default,1);
insert into mycomment values(mycomment_seq.nextval,'1답글내용입니다1',default,default,default,default,1,1,1,default,1);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다1',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다2',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다3',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다4',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다5',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다6',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다7',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다8',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다9',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다10',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다11',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다12',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다13',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다14',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다15',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다16',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다17',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다18',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다19',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다20',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다21',default,default,default,default,1,1,1,default,3);
insert into mycomment values(mycomment_seq.nextval,'답글내용입니다22',default,default,default,default,1,1,1,default,3);

--댓글 정보

--시청기록--
insert into watchrecord values(3,1,'2021-06-19');
insert into watchrecord values(3,5,'2021-06-21');
insert into watchrecord values(3,3,'2021-06-20');
insert into watchrecord values(3,2,'2021-06-18');
insert into watchrecord values(3,4,'2021-06-16');
insert into watchrecord values(3,6,'2021-06-17');
insert into watchrecord values(3,7,'2021-06-10');
insert into watchrecord values(3,8,'2021-06-12');
insert into watchrecord values(3,9,'2021-06-13');
--시청기록--

--나중에 볼 동영상--
insert into aftervideo values(3,1);
insert into aftervideo values(3,11);
insert into aftervideo values(3,10);
insert into aftervideo values(3,9);
insert into aftervideo values(3,8);
insert into aftervideo values(3,7);
insert into aftervideo values(3,6);
insert into aftervideo values(3,5);
insert into aftervideo values(3,4);
insert into aftervideo values(3,3);
insert into aftervideo values(3,2);
--나중에 볼 동영상--

commit;

--select * from 
--(select vidurl from video order by vidhits desc)
--where rownum <2;

--테이블 확인
--select * from commentLike;
--select count(*) from commentlike where comno=4 and userno=1;
--select * from myuser;
--select * from myboard;
--select * from mycomment order by comno;
--select * from bobycom;
--select * from video order by vidno desc;   
--select * from theme;
--select * from mycomment;
--select * from (select ROWNUM as rowcnt, a.* from mycomment a where vidno=1 and comgroup is null)
--where rowcnt>=10 and rowcnt<20;
--select * from AFTERVIDEO;
--select * from WATCHRECORD;
--select * from SUBSCRIB;
--select * from WATCHRECORD where userNo=3 order by watchdate desc;
--insert into SUBSCRIB(userNo2, userNo) values(1, 2);

--select * from 
--(select  ad.*, rownum as rowcnt from 
--(select * from video where vidtitle like '%'||'게임'||'%' order by vidhits desc)ad)
-- where rowcnt>=0 and rowcnt<10;

--select * from
--(select rownum as rowcnt, ad.* from
--(select * from mycomment where vidno=1 and comstep=0 order by comno)ad)
--where rowcnt>=0 and rowcnt<10

--select * from 
--(select  ad.*, rownum as rowcnt from
--(select * from WATCHRECORD where userno=3 order by watchdate desc)ad)
--where rowcnt>0 and rowcnt<=5