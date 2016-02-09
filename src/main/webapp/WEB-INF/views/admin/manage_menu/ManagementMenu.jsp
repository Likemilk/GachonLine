<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/resources/include/include.jsp"%>
<gachonTag:html>
<gachonTag:script bootstrapTable="YES">
</gachonTag:script>
<body>
<script type="text/javascript">

$(document).ready(function() {
	menuTypeTag(document.getElementById('menuType').value);
	list();
	$('#adminTable').bootstrapTable({
		onClickRow : function(row) {
			
		}
	}).on('click-row.bs.table', function(e, row, $element) {
		show(row.menuId);
	});
	
});

</script>
	<!-- 속성 아직 안만들어 놨어요 이거는 임시방편으로 만든 태그라이브러리이고  /WEB-INF/tags/nav-bar.tag 
에다가 링크를 수정해주세양! 나중에 tag class 만들때 참고할게양 ! -->

	<%@ taglib tagdir="/WEB-INF/tags/" prefix="GachonTag"%>
	<GachonTag:nav-bar name="${LOGIN_MEMBER.memberName}" type="${LOGIN_MEMBER.memberType}"/>

	<div class="container">
		<div class="page_title">메뉴 관리</div>
		<hr />

		<div class="table-responsive">
			<table id="adminTable" data-toggle="table" data-show-columns="true"
				data-search="true" data-show-refresh="true" data-show-toggle="false"
				data-show-export="true" data-pagination="true">
				<thead class="row">
					<tr>
						<th data-field="parentMenuId" class="text_center">부모 메뉴ID</th>
						<th data-field="menuId" class="text_center">메뉴ID</th>
						<th data-field="menuName" class="text_center">메뉴 이름</th>
						<th data-field="menuType_nm" class="text_center">메뉴 타입</th>
						<th data-field="power_nm" class="text_center">권 한</th>
						<th data-field="useYn" class="text_center">사용 여부</th>
						<th data-field="sortseq" class="text_center">메뉴 순서</th>
						<th data-field="url" class="text_center">URL</th>

					</tr>
				</thead>
			</table>
		</div>
		<br /><br />

		<div id="newMenuHeader" class="page_title">메뉴 추가</div>
		<hr />
		<div id="newMenu" class="well">
		
			<div class="row form-group">
				<div class="col-sm-1 attr_name text-center">
					메뉴타입
				</div>
				<div class="col-sm-3">
					<gachonTag:select code="${MENU_TYPE }" onChange="menuTypeTag(this.value);"
									id="menuType" required="required" />
				</div>
					
				<div class="col-sm-1 attr_name text-center">
					부모 ID
				</div>
				<div class="col-sm-3">
					<input type="text" id="parentMenuId" class="form-control" readonly/>
				</div>
					
				<div class="col-sm-1 attr_name text-center">
					자신ID
				</div>
				<div class="col-sm-3">
					
					<input type="text" id="menuId" onChange="menuIdTag(this.value);" class="form-control" />
				</div>
				
			</div>

			<div class="row form-group">
				<div class="col-sm-1 attr_name text-center">
					메뉴권한
				</div>
				<div class="col-sm-3">
					<gachonTag:select code="${POWER }" id="power" required="required" />
					
				</div>
				<div class="col-sm-1 attr_name text-center">
					메뉴잠금
				</div>
				<div class="col-sm-3">
					<gachonTag:select code="${USE_YN}" id="useYesNo" required="required" />

				</div>
				<div class="col-sm-1 attr_name text-center">
					메뉴순서
				</div>
				<div class="col-sm-3">
					<input type="text" id="sortseq" class="form-control" />
				</div>
			</div>


			<div class="row form-group">
				<div class="col-sm-1 attr_name text-center">메뉴이름</div>
				<div class="col-sm-5">
					<input type="text" id="menuName" class="form-control" />
				</div>
		
				<div class="col-sm-1 attr_name text-center">URL</div>
				<div class="col-sm-5">
					<input type="text" id="url" class="form-control" />
				</div>
			</div>			
		</div>
		<div id="newMenuFooter" style="text-align: center;">
				<a href="#" class="btn btn-warning" onclick="inputTextInit('#newMenu');menuTypeTag(document.getElementById('parentMenuId').value);">입력취소</a>
				<a href="#" class="btn btn-success" onclick="submit();">등록하기</a>
		</div>
		<div id="modal" class="modal fade bs-example-modal-lg" tabindex="-1"
			role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">메뉴 수정</h4>
					</div>

					<div class="modal-body">
						
					</div>

					<div class="modal-footer" style="text-align: center;">
						<button type="button" onclick="delete1();"
							class="btn btn-warning" data-dismiss="modal">삭제하기</button>
						<button type="button" class="btn btn-info"
							onclick="modify();">수정하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- Modal : 수업 교환 하기 공통 모달 -->

		

</body>

<script type="text/javascript">
function list() {
	//var returnValue;
	$.ajax({
		type : "POST",
		url : "/admin/manage_menu/list.json",
		cache : false,
		async : true,
		dataType : "JSON",
		success : function(response) {
			console.log(response);
			$('#adminTable').bootstrapTable('load', response.table);
			//
			parents=[];
			for(var i=0;i<response.parents.length;i++){
				parents.push(response.parents[i].parentMenuId);			
			}
			console.log(parents);
			//returnValue=response;
			//console.lo g(returnValue);	
		},
		error : function(request, status, errorThrown) {
			GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
		}
	});
	//return returnValue;
	
}
</script>
<!-- submit -->
<script type="text/javascript">
function submit(){
	var dataForm={
		menuType: document.getElementById("menuType").value,	
		menuId:	document.getElementById("menuId").value,
		parentMenuId: document.getElementById("parentMenuId").value,
		menuName: document.getElementById("menuName").value,
		sortseq : document.getElementById("sortseq").value,
		power: document.getElementById("power").value,
		useYesNo: document.getElementById("useYesNo").value,
		url: document.getElementById("url").value,
		crtUser:"${LOGIN_MEMBER.memberName}",
		updtUser:"${LOGIN_MEMBER.memberName}"
	};
	$.ajax({
		type : "POST",
		url : "/admin/manage_menu/submit.json",
		cache : false,
		async : true,
		data : dataForm,
		dataType : "JSON",
		success : function(response) {
			GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
			list();

		},
		error : function(request, status, errorThrown) {
			GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
		}
	});
}
</script>


<!-- show -->
<script type="text/javascript">
var newMenu;
var newMenuFooter;
var newMenuHeader;
function show(getMenuId){
	console.log(menuId);
	inputTextInit("#newMenu");
	menuTypeTag(document.getElementById('menuType').value);
	
	//전역변수에 html 태그 저장
	newMenuHeader = $("#newMenuHeader");
	newMenu = $("#newMenu");
	newMenuFooter = $("#newMenuFooter");
	
	
	//작성 되어있던 html 삭제
	$("#newMenuHeader").remove();
	$("#newMenu").remove();
	$("#newMenuFooter").remove();
	
	//전역변수의 html을 modal-body에 저장
	$(".modal-body").html(newMenu);
	
	$("#modal").modal('show');
	
	$("#modal").on('hidden.bs.modal',
		function() {
		inputTextInit("#newMenu");
		menuTypeTag(document.getElementById('menuType').value);
		$("#newMenu").remove();
		$("#newMenuFooter").remove();
		$(".container").append(newMenuHeader);
		$(".container").append(newMenu);
		$(".container").append(newMenuFooter);
		document.getElementById("menuId").readOnly = false;
	});
	var dataForm={
		menuId:	getMenuId
	};
	$.ajax({
		type : "POST",
		url : "/admin/manage_menu/show.json",
		cache : false,
		async : true,
		data : dataForm,
		dataType : "JSON",
		
		success : function(response) {
			document.getElementById("menuType").value=response.menuType;
			menuTypeTag(document.getElementById('menuType').value);
			document.getElementById("menuId").readOnly = true;
			document.getElementById("menuId").value=response.menuId;
			document.getElementById("sortseq").value = response.sortseq;
			document.getElementById("parentMenuId").value=response.parentMenuId;
			document.getElementById("menuName").value=response.menuName;
			document.getElementById("power").value=response.power;
			document.getElementById("useYesNo").value=response.useYesNo;
			document.getElementById("url").value=response.url;
		},
		error : function(request, status, errorThrown) {
			GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
		}
	});
	
}
</script>

<!-- modify -->
<script type="text/javascript">
function modify(){
	var dataForm={
		menuType: document.getElementById("menuType").value,	
		menuId:	document.getElementById("menuId").value,
		parentMenuId: document.getElementById("parentMenuId").value,
		menuName: document.getElementById("menuName").value,
		sortseq : document.getElementById("sortseq").value,
		power: document.getElementById("power").value,
		useYesNo: document.getElementById("useYesNo").value,
		url: document.getElementById("url").value,
		updtUser:"${LOGIN_MEMBER.memberName}"
	};
	$.ajax({
		type : "POST",
		url : "/admin/manage_menu/modify.json",
		cache : false,
		async : true,
		data : dataForm,
		dataType : "JSON",
		
		success : function(response) {
			GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
			list();
			$("#modal").modal('hide');
			
		},
		error : function(request, status, errorThrown) {
			GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
		}
	});
}
</script>

</script>
<!-- delete1 -->
<script type="text/javascript">
function delete1(){
	var dataForm={
		menuId:	document.getElementById("menuId").value,
		menuType: document.getElementById("menuType").value
	};
	$.ajax({
		type : "POST",
		url : "/admin/manage_menu/delete.json",
		cache : false,
		async : true,
		data : dataForm,
		dataType : "JSON",
		
		success : function(response) {
			GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
			list();
			$("#modal").modal('hide');	
			
		},
		error : function(request, status, errorThrown) {
			GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
		}
	});
}
</script>


<!-- UI를 그려줘! -->
<script type="text/javascript">
var parents=[];

function menuTypeTag(index){
	console.log(index);
	switch(index){
	case 'P':
		var beforeParentMenuId = document.getElementById('parentMenuId');
		
		var afterParentMenuId = document.createElement('select');
		afterParentMenuId.id='parentMenuId';
		afterParentMenuId.className='form-control';
		afterParentMenuId.readOnly = false;
		for(var i=0;i<parents.length;i++){
			var tempOption = document.createElement("option");	
			tempOption.text=parents[i];
			afterParentMenuId.add(tempOption);
		}
		if(document.getElementById('menuId').hasAttribute("onChange")){
			console.log("onChange빼버림!");
			document.getElementById('menuId').attributes.removeNamedItem("onChange");// onChange이벤트 삭제
		}

		
		beforeParentMenuId .innerHTML = afterParentMenuId.innerHTML;  //내용을 변경해준다.
		beforeParentMenuId.parentNode.insertBefore(afterParentMenuId, beforeParentMenuId); //바꿔준다.
		beforeParentMenuId.parentNode.removeChild(beforeParentMenuId); //삭제
		break;
		
	default:
		
		if(!document.getElementById('menuId').hasAttribute("onChange")){
			console.log("onChange넣음!");
			document.getElementById('menuId').setAttribute("onChange", "menuIdTag(this.value);");
		}
		var beforeParentMenuId = document.getElementById('parentMenuId');
		var afterParentMenuId = document.createElement('input');
		afterParentMenuId.id='parentMenuId';
		afterParentMenuId.className='form-control';
		afterParentMenuId.type='text';
		afterParentMenuId.readOnly = true;

		document.getElementById('menuId').onChange='menuIdTag(this.value);';
		beforeParentMenuId .innerHTML = afterParentMenuId.innerHTML;  //내용을 변경해준다.
		beforeParentMenuId.parentNode.insertBefore(afterParentMenuId, beforeParentMenuId); //바꿔준다.
		beforeParentMenuId.parentNode.removeChild(beforeParentMenuId); //삭제
		menuIdTag(document.getElementById('menuId').value);
		
		break;
	}
}
function menuIdTag(value){
	document.getElementById('parentMenuId').value=value;
}
</script>
</gachonTag:html>