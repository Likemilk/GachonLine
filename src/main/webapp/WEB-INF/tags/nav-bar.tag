<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="name" %>
<%@ attribute name="type" %>

<nav class="navbar navbar-inverse">
	<div class="container-fluid"  style="background-color:#212121">
		<div class="navbar-header" style="padding-top:0.5em">
			<c:choose>
				<c:when test="${type eq 'ADM' or type eq 'ETC' or type eq 'PRO' or type eq 'STD'}">
					<a href="/home"><img src="/resources/image/menu_logo.png"/></a>
				</c:when>
				<c:otherwise>
					<a href="/"><img src="/resources/image/menu_logo.png"/></a>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<c:if test="${type eq 'ADM' or type eq 'ETC' or type eq 'PRO' or type eq 'STD'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">학생서비스<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/member/my_info">내 정보보기</a></li>
							<li><a href="/member/friend_find">친구 찾기</a></li>
							<li><a href="/course/course">수강조회</a></li>
							<li><a href="/course/curriculum">커리큘럼보기</a></li>
							<li><a href="/course/change_course">수업교환하기</a></li>
							<li><a href="/timetable/show_timetable">나의 시간표 보기</a></li>
							<li><a href="/timetable/share_timetable">친구와 공유</a></li>
							<li><a href="/timetable/pro_timetable">교수님 시간표</a></li>
						</ul>
					</li>
				</c:if>
				<!--  조용진  -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">커뮤니티<span
						class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/community?divs=gachon">가천대 게시판</a></li>
						<c:choose>
							<c:when test="${!(LOGIN_MEMBER eq null) }">
								<li><a href="/community?divs=${LOGIN_MEMBER.department}">단대별 게시판</a></li>
								<li><a href="/community?divs=${LOGIN_MEMBER.schoolYear}">학년별 게시판</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="/community?divs=H">단대별 게시판</a></li>
								<li><a href="/community?divs=1">학년별 게시판</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="/community?divs=music_club">동아리 게시판</a></li>
						<li><a href="/community?divs=noname">익명게시판</a></li>
						<!-- 우뮴뮤뮤뮤뮤뮤 -->
						<li><a href="/community?divs=sell">가천 장터</a></li>
						<li><a href="/community?divs=thunder">번개모임</a></li>
						<li><a href="/community?divs=sinmungo">신문고</a></li>
						<li><a href="/community?divs=group_buy">공동구매</a></li>
					</ul>
				</li>
				<!-- 지연누나 -->
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">외부
						커뮤니티<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/outCommunity/store">상점 보기</a></li>
						<li><a href="/outCommunity/alba">알바 공고</a></li>
						<li><a href="/outCommunity/event">이벤트 정보</a></li>
					</ul>
				</li>

				<!-- 관리자  -->
				<c:if test="${type eq 'ADM'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">관리자<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/admin/manage_member">회원관리</a></li>
							<li><a href="/admin/manage_code">코드관리</a></li>
							<li><a href="/admin/manage_menu">메뉴관리</a></li>
							<li><a href="/admin/manage_store">상점관리</a></li>
							<li><a href="/admin/manage_curriculum">커리큘럼관리</a></li>
							<li><a href="/admin/manage_course">수강관리</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${type eq 'ADM' or type eq 'ETC' or type eq 'PRO' or type eq 'STD'}">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">기타<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/common/show_all">서비스 한눈에 보기</a></li>
						</ul>
					</li>
				</c:if>
				<c:if test="${type eq 'ADM'}">				
					<!-- 자유롭게 만져도 되는부분 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">개발자
							샘플<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">조용진 샘플 ㅋ </a></li>
							<li><a href="#">태수형 샘플 ㅋ </a></li>
							<li><a href="#">지연누나 샘플 ㅋ </a></li>
							<li><a href="#">동준이형 샘플 ㅋ </a></li>
	
						</ul>
					</li>
				</c:if>
				<c:if test="${type eq 'ADM'}">				
					<!-- 자유롭게 만져도 되는부분 -->
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">참고사이트<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a
								href="http://www.w3schools.com/bootstrap/bootstrap_ref_css_tables.asp">W3schools.com</a></li>
							<li><a href="http://getbootstrap.com/components/#navbar">bootstrap.com</a></li>
							<li><a href="http://www.codecademy.com/">www.codeacademy.com</a></li>
	
						</ul>
					</li>
				</c:if>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li>
					<c:choose>
						<c:when test="${type eq 'ADM' or type eq 'ETC' or type eq 'PRO' or type eq 'STD'}">
							<a href="/member/my_info">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
								 ${name}님
							</a>
						</c:when>
						<c:otherwise>
							<a href="/">
								<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
							 	로그인 해주십시오.
							</a>						
						</c:otherwise>
					</c:choose>
				 </li>
				<c:if test="${type eq 'ADM' or type eq 'ETC' or type eq 'PRO' or type eq 'STD'}">
					<li><a href="/logout"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
					 로그아웃 </a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>