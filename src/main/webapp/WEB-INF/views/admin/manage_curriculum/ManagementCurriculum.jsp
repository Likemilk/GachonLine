<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/resources/include/include.jsp"%>
<gachonTag:html>
<gachonTag:script bootstrapTable="YES">

	<style>
.glyphicon-ok {
	color: red;
}
</style>

	<script type="text/javascript">
		//show, hide modal
		function showModal(modalId) {
			$('#' + modalId).modal('show');
		}
		function hideModal(modalId) {
			$('#' + modalId).modal('hide');
		}

		function modalType(type) {
			inputTextInit("#curriMODAL");
			inputTextInit("#curriMODAL");

			if (type == "addMst") {
				$('h4[id="myModalLabel"]').html("커리큘럼 추가");

				// modal 내 readonly 해제
				$("input[id=CourseNum]").attr("readonly", false);
				$("input[id=CourseName]").attr("readonly", false);
				$("input[id=Year]").attr("readonly", false);
				$("input[id=Major]").attr("readonly", false);
				$("select[id=CompleteDivision]").attr("readonly",false);
				$("select[id=Major]").attr("readonly",false);

				// 추가하는 파트 modal 처리
				showModal('curriMODAL');

// 				var completeDivision = document.getElementById('CompleteDivision').value;
// 				var major = document.getElementById('Major').value;
				
// 				$('#saveMst').attr('href', 'javascript:insertMst("' + completeDivision + '", "' + major + '" );');
				$('#saveMst').attr('href', 'javascript:insertMst();');
			} else if (type == "modifyMst") {
				// 질문!!!!! if~else if 를 써서, row를 클릭 했을 때 수정이 실행되고,
				// row를 클릭하지 않았을때는 클릭하고 수정하라는 메시지를 출력 하고 싶은데, row를 click했는지 안했는지(boolean) 어떻게 판별?
				// bootstrap-table table attribute 에 clickToSelect 가 있는데, 이걸 이용 가능??

				$('h4[id="myModalLabel"]').html("커리큘럼 수정");

				showModal('curriMODAL');
				// courseNum 에는 courseNum과 courseName이 같이 들어가 있어서, 이중에서 숫자만 뽑아내는 구문이 필요함 (.replace)
				// 아래 방식이 아니라 index of로 숫자+문자를 떼어낼 수 있다. 하지만 여기서는 단순히 칼럼을 나눠서 처리하자. 편의성
				// var courseNum = $('#MST').bootstrapTable('getSelections')[0].courseNum;
				// courseNum = courseNum.replace(/[^0-9]/g,'');

				// db에서 pk 순서 바꾸기 / courseNum이랑 courseName 분할해서 처리할 것
				document.getElementById("Year").value = $('#MST').bootstrapTable('getSelections')[0].year;
				document.getElementById("CourseNum").value = $('#MST').bootstrapTable('getSelections')[0].courseNum;
				document.getElementById("CourseName").value = $('#MST').bootstrapTable('getSelections')[0].courseName;
				document.getElementById("SchoolYear").value = $('#MST').bootstrapTable('getSelections')[0].schoolYear;
				document.getElementById("Semester").value = $('#MST').bootstrapTable('getSelections')[0].semester;
				document.getElementById("Grade").value = $('#MST').bootstrapTable('getSelections')[0].grade;
				
				var selectedVal1 = $('#MST').bootstrapTable('getSelections')[0].completeDivision;
				var selectedVal2 = $('#MST').bootstrapTable('getSelections')[0].major;
				
				$("#CompleteDivision").val(selectedVal1);
				$("#Major").val(selectedVal2);
				
				$("input[id=Year]").attr("readonly", true); // disabled도 동일
				$("input[id=CourseNum]").attr("readonly", true);
				$("input[id=CourseName]").attr("readonly", true);
				$("select[id=CompleteDivision]").attr("readonly",true);
				$("select[id=Major]").attr("readonly",true);

				$('#saveMst').attr('href', 'javascript:updateMst();');
			}
		}

		function deleteFunciton() {
			var year = $('#MST').bootstrapTable('getSelections')[0].year;
			var courseNum = $('#MST').bootstrapTable('getSelections')[0].courseNum;
			var major = $('#MST').bootstrapTable('getSelections')[0].major;

			deleteMst(year, courseNum, major);
		}

		//초기 로드 테이블
		$(document).ready(function() {
			selectMst();
		});

		function selectMst() {
			var dataForm = {};
			$.ajax({
				type : "POST",
				url : "/admin/manage_curriculum/curriculumMST.json",
				cache : false,
				async : true,
				data : dataForm,
				dataType : "json",
				complete : function() {
				},
				success : function(response) {
					// 				console.log(response);
					$('#MST').bootstrapTable('load', response);
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}

		function insertMst() {
			
			var dataForm = {
				year : $('#Year').val(),
				courseNum : $('#CourseNum').val(),
				courseName : $('#CourseName').val(),
				schoolYear : $('#SchoolYear').val(),
				semester : $('#Semester').val(),
				completeDivision : $("#CompleteDivision option:selected").val(),
				grade : $('#Grade').val(),
				major : $("#Major option:selected").val(),
				updtUser : 'test'
			};
			$.ajax({
				type : "POST",
				url : "/admin/manage_curriculum/curriculumMST.insert", // insert는 임의 지정
				cache : false,
				async : true,
				data : dataForm,
				dataType : "json",
				complete : function() {
				},
				success : function(response) {
					GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
					hideModal('curriMODAL');
					selectMst();
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}

		function updateMst() {

			var dataForm = {
				// pk 값 (AND조건)
				year : $('#MST').bootstrapTable('getSelections')[0].year,
				courseNum : $('#MST').bootstrapTable('getSelections')[0].courseNum,
				major :  $("#Major option:selected").val(),

				// 변경 값
				courseName : $('#CourseName').val(),
				semester : $('#Semester').val(),
				completeDivision :  $("#CompleteDivision option:selected").val(),
				grade : $('#Grade').val(),
				schoolYear : $('#SchoolYear').val(),
				updtUser : 'test'
			};
			$.ajax({
				type : "POST",
				url : "/admin/manage_curriculum/curriculumMST.update",
				cache : false,
				async : true,
				data : dataForm,
				dataType : "json",
				complete : function() {
				},
				success : function(response) {
					GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
					hideModal('curriMODAL');
					selectMst();
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}

		function deleteMst(year, courseNum, major) {
			var dataForm = {
				year : year,
				courseNum : courseNum,
				major : major
			};
			$.ajax({
				type : "POST",
				url : "/admin/manage_curriculum/curriculumMST.delete",
				cache : false,
				async : true,
				data : dataForm,
				dataType : "json",
				complete : function() {
				},
				success : function(response) {
					GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
					selectMst();
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}
	</script>
</gachonTag:script>

<body>
	<%@ taglib tagdir="/WEB-INF/tags/" prefix="GachonTag"%>
	<GachonTag:nav-bar name="${LOGIN_MEMBER.memberName}" type="${LOGIN_MEMBER.memberType}"/>

	<div class="container">
		<div class="page_title">커리큘럼 관리</div>
		<hr />

		<table id="MST" data-toggle="table" data-url="#"
			data-show-columns="false" data-search="false"
			data-show-refresh="false" data-show-toggle="false"
			data-page-size="25" data-page-list="[25, 50, 100]"
			data-show-export="true" data-pagination="true" data-height="500"
			data-click-to-select="true" data-select-item-name="radioName">
			<thead>
				<tr>
					<th data-field="state" data-radio="true"></th>
					<th data-field="year">입학년도</th>
					<th data-field="courseNum">학수번호</th>
					<th data-field="courseName">교과목 명</th>
					<th data-field="schoolYear">학년</th>
					<th data-field="semester">학기</th>
					<th data-field="completeDivision_nm">이수구분</th>
					<th data-field="grade">학점</th>
					<th data-field="major_nm">개설조직</th>
					<th data-field="updtUser">수정자</th>
					<th data-field="updtdt">수정일시</th>
				</tr>
			</thead>
		</table>

		<!-- 커리큘럼 관리에 해당하는 버튼 3 -->
		<div style="margin-top: 1%; margin-bottom: 3%;">
			<!-- Button trigger modal 1 -->
			<input type="button" class="btn btn-info" data-toggle="modal"
				onclick="modalType('addMst');"
				style="font-weight: bold;" value="추가">
			</input>

			<!-- Button trigger modal 2 -->
			<input type="button" class="btn btn-info" data-toggle="modal"
				onclick="modalType('modifyMst');"
				style="font-weight: bold;" value="수정">
			</input>
			<!-- href="javascript:deleteMst();" -->
			<!-- Button trigger modal 3 -->
			<input type="button" class="btn btn-info" data-toggle="modal"
				onclick="deleteFunciton();"
				style="font-weight: bold;" value="삭제">
			</input>
		</div>

		<!-- Modal. : 커리큘럼 추가, 수정하기 -->
		<div class="modal fade" id="curriMODAL" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel">커리큘럼 추가</h4>
					</div>
					<div class="modal-body">
						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">입학년도
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="Year" class="form-control input-sm"
									placeholder="Admissions_year" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">학수번호
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="CourseNum"
									class="glyphicon glyphicon-star form-control input-sm"
									placeholder="courseNum" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">교과목명
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="CourseName"
									class="glyphicon glyphicon-star form-control input-sm"
									placeholder="courseName" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">학년
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="SchoolYear"
									class="glyphicon glyphicon-star form-control input-sm"
									placeholder="schoolYear" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">학기
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="Semester"
									class="glyphicon glyphicon-star form-control input-sm"
									placeholder="semester" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">이수구분
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<gachonTag:select code="${COMPLETE_DIVISION }"
									id="CompleteDivision" required="required" />
							</div>
						</div>
						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">학점
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<input id="Grade"
									class="glyphicon glyphicon-star form-control input-sm"
									placeholder="grade" type="text">
							</div>
						</div>

						<div class="row form-group">
							<label for="Category" class="col-sm-3 control-label"
								style="margin-top: 1%; text-align: right;">개설조직
								<div class="glyphicon glyphicon-ok"></div>
							</label>
							<div class="col-sm-9">
								<gachonTag:select code="${MAJOR }" id="Major" required="required" />
							</div>
						</div>
					</div>
					<div class="modal-footer" style="text-align: center;">
						<a href="#" id="saveMst" class="btn btn-success">저장</a> <a
							href="#" class="btn btn-warning" data-dismiss="modal">닫기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</gachonTag:html>
