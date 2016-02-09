<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/resources/include/include.jsp"%>
<gachonTag:html>


<body>
<!-- 속성 아직 안만들어 놨어요 이거는 임시방편으로 만든 태그라이브러리이고  /WEB-INF/tags/nav-bar.tag 
에다가 링크를 수정해주세양! 나중에 tag class 만들때 참고할게양 ! -->

<%@ taglib tagdir="/WEB-INF/tags/" prefix="GachonTag" %>
<GachonTag:nav-bar name="${LOGIN_MEMBER.memberName}" type="${LOGIN_MEMBER.memberType}"/>


<div class="container">
	<GachonTag:community-nav divs="${divs}"/>
	<div class="well"  style="margin-top:3em;">
		<form action="/community/write/submit" method="post">
			<input type="hidden" name="divs" value="${divs}"/>
			<input type="hidden" name="type" value="${divs}"/>
			
			<div class="row">
				<div class="col-sm-12 form-group">
					<div class="col-sm-2 attr_name ">제목</div>
					<div class="col-sm-10 input-group" style="padding-left:2.8em;">
						<input type="text" name="title" class="form-control" placeholder="제목을 입력하세요" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">회원구분</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="학생" readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">소속 대학</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="글로벌 캠퍼스"
							readonly />
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">단과대학</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="IT대학" readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">학과</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="컴퓨터 미디어 융합"
							readonly />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">이름</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="조용진" readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">학번</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="201133271"
							readonly />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">학년</div>
					<div class="col-sm-7  input-group">
						<input type="text" class="form-control" value="3" readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">이수 학기</div>
					<div class="col-sm-7  input-group">
						<input type="text" class="form-control" value="7" readonly />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name">학적 상태</div>
					<div class="col-sm-7  input-group">
						<input type="text" class="form-control" value="퇴학" readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name ">생년 월일</div>
					<div class="col-sm-7  input-group">
						<input type="text" class="form-control" value="1992-10-15"
							readonly />
					</div>
				</div>
			</div>
	
			<div class="row">
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name">날 짜</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="2015-07-04 22:07:23"	readonly />
					</div>
				</div>
				<div class="col-sm-6 form-group">
					<div class="col-sm-5 attr_name">핸드폰 번호</div>
					<div class="col-sm-7 input-group">
						<input type="text" class="form-control" value="010-5596-6935" readonly />
					</div>
				</div>
			</div>
			
			<c:if test="${ctrl.type=='market'||ctrl.type=='group_buy'}">
				<div class="row thumbnail" style="padding-top:2em;">
					<div class="col-sm-6 form-group">
						<div class="row">
							<div class="col-sm-12 attr_name" style="text-align:center;">
								사진
								<div class="thumbnail" >
									<img src="/resources/image/img1.PNG" width="400" height="300" class="img-responsive" style="display:inline;" />
								</div>
								<button type="file" class="col-sm-12 btn btn-success">사진 선택</button>
							</div>
						</div>
					</div>
					<div class="col-sm-6 form-group"  style="padding-top:2em;">
						<div class="col-sm-5 attr_name">
							물품
						</div>
						<div class="col-sm-7 input-group">
							<input type="text" class="form-control"  placeholder="물품을 입력하세요" />
						</div>
						<div style="padding-top:1em;vertical-align:middle;">
							<div class="col-sm-5 attr_name">가격</div>
							<div class="col-sm-7 input-group">
								<input type="text" class="form-control"  placeholder="가격을 입력하세요" />
								<div class="input-group-addon">&#x20A9;</div>
							</div>
							<div class="form-group col-sm-12">
								<label for="comment">제품 설명 </label>
								<textarea class="form-control" rows="9" id="comment" style=" height:250px; 
 								 min-height:200px; max-height:200px;"></textarea>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			
			
			<div class="row">
				<div class="form-group col-sm-12">
					<label for="comment">내용 작성 </label>
					<textarea class="form-control" rows="20"></textarea>
				</div>
			</div>
			
				
			<div class="row">
				<div class="col-sm-4">&nbsp;</div>
				<div class="col-sm-4">&nbsp;</div>
				<div class="col-sm-4">
					<div class="col-sm-6">
						<button type="reset" value="리셋" class="col-sm-12 btn btn-warning">다시 작성</button>
					</div>
					<div class="col-sm-6">
						<button type="submit" value="삽입" class="col-sm-12 btn btn-success">글 등록</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>

</body>
</gachonTag:html>