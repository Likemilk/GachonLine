<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/resources/include/include.jsp"%>
<gachonTag:html>
<gachonTag:script bootstrapTable="YES">

	<style>
table {
	text-align: center;
	table-layout: auto;
}
#toggle {
	cursor: pointer;
}

hr {
	border: 1px solid gray;
	margin: 0 0 2% 0;
}
.th-inner {
	text-align:center;
}
</style>

	<script data-for="상점 등록하기">
		$(function() {
			$("#divvv").hide();
		})
	</script>


	<script data-for="등록된 상점리스트 가져오기">
		function storeAllSelect() {
			$.ajax({
				type : "POST",
				url : "/admin/manage_store/adminStoreList.json",
				cache : false,
				async : true,
				dataType : "JSON",
				success : function(response) {
					response[0].crtUser = '${LOGIN_MEMBER.memberName}';

					$('#adminStoreTable').bootstrapTable('load', response).on('click-row.bs.table', function(e, row) {
						
						
						$("#adminStoreModal").modal('show');
						$("#modalTitle").html(row.shopName);
						/* 상점정보_모달 */
						$("#modal_shopTitlePicPath").val("/resources/image/upload/store/"+row.shopTitlePicPath);
						$("#modal_storeHp").val(row.shopHp);
						$("#modal_shopDetailDesc").val(row.shopDetailDesc);

					});
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}
		storeAllSelect();
	</script>

	<script data-for="상점 수정하기">
		function update() {
			var dataFrom = {
				shopNum : $('#shopNum').val(),
				shopName : $('#shopName').val(),
				shopAddr : $('#shopAddr').val(),
				shopTel : $('#shopTel').val(),
				shopAddrApi1 : $('#shopAddrApi1').val(),
				shopAddrApi2 : $('#shopAddrApi2').val(),
				shopHp : $('#shopHp').val(),
				shopDetailDesc : $('#shopDetailDesc').val(),
				shopTitlePicPath : $('#shopTitlePicPath').val()
			}

			$.ajax({
				type : "POST",
				url : "/admin/manage_store/adminStoreUpdate",
				cache : false,
				async : true,
				data : dataFrom,
				dataType : "JSON",
				success : function(response) {

					location.reload();
					GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);

					if (response.RESULT_CODE >= 0) {
						getList();
					}
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}
	</script>
	<script>
		function methodType(type) {
			
			if (type == "write") {
				$('#saveBtn').attr('href', 'javascript:insert();');
				$("#divvv").show();
				$("#admin_member").html("상점등록");

			} else if (type == "modify") {
				$("#divvv").show();
				$("#admin_member").html("상점수정");
				$("#saveBtn").html("수정");
				$(function() {
					$('#adminStoreTable').on('check.bs.table', function(e, row) {
						$('#shopNum').val(row.shopNum);
						$('#shopName').val(row.shopName);
						$('#shopAddr').val(row.shopAddr);
						$('#shopTel').val(row.shopTel);
						$('#shopAddrApi1').val(row.shopAddrApi1);
						$('#shopAddrApi2').val(row.shopAddrApi2);
						$('#shopHp').val(row.shopHp);
						$('#shopDetailDesc').val(row.shopDetailDesc);
						$("input[name=shopTitlePicPath]")[0].files[0];
						$('#shopNum').attr("readonly", true);
					})
					$('#saveBtn').attr('href', 'javascript:update();');
				})
			}
		}
	</script>

	<script data-for="상점 등록하기">
		function insert() {
			var formData = new FormData();
			formData.append("shopNum", $('#shopNum').val());
			formData.append("shopName", $('#shopName').val());
			formData.append("shopTel", $('#shopTel').val());
			formData.append("shopAddr", $('#shopAddr').val());
			formData.append("shopAddrApi1", $('#shopAddrApi1').val());
			formData.append("shopAddrApi2", $('#shopAddrApi2').val());
			formData.append("shopHp", $('#shopHp').val());
			formData.append("shopTitlePicPath", $("input[name=shopTitlePicPath]")[0].files[0]);
			formData.append("shopDetailDesc", $('#shopDetailDesc').val());
			console.log($('#shopNum').val());

			$.ajax({
				type : "POST",
				url : "/admin/manage_store/adminStoreInsert",
				cache : false,
				async : true,
				data : formData,
				dataType : "JSON",
				processData : false,
				contentType : false,
				success : function(response) {
					location.reload();
					GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);
					if (response.RESULT_CODE >= 0) {
						getList();
					}
				},
				error : function(request, status, errorThrown) {
					GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
				}
			});
		}
	</script>

	<script>
		$(function() {
			$("#deleteBtn").click(function() {
				var dataForm = {
					shopNum : $('#adminStoreTable').bootstrapTable('getSelections')[0].shopNum
				};

				$.ajax({
					type : "POST",
					url : "/admin/manage_store/adminStoreDelete",
					cache : false,
					async : true,
					data : dataForm,
					dataType : "JSON",
					success : function(response) {
						location.reload();
						//history.go(0);
						GachonNoty.showResultNoty(response.RESULT_CODE, response.RESULT_MSG);

						if (response.RESULT_CODE >= 0) {
							getList();
						}
					},
					error : function(request, status, errorThrown) {
						GachonNoty.showAjaxErrorNoty(request, status, errorThrown);
					}
				});
			})

		})
	</script>

	<script>
		$(function() {
			$("#reset").click(function() {
				location.reload();
			})
		})
	</script>

</gachonTag:script>

<body>
	<%@ taglib tagdir="/WEB-INF/tags/" prefix="GachonTag"%>
	<GachonTag:nav-bar name="${LOGIN_MEMBER.memberName}" type="${LOGIN_MEMBER.memberType}"/>

	<div class="container">
		<div class="page_title">상점 관리</div>
		<hr />
		<table id="adminStoreTable" data-toggle="table" data-show-columns="true" data-search="true" data-show-refresh="true" data-show-toggle="false"
			data-show-export="true" data-pagination="true" data-height="500">
			<thead>
				<tr style="text-align: center;">
					<th data-field="state" data-radio="true"></th>
					<th data-field="shopNum">상점번호</th>
					<th data-field="shopName">이름</th>
					<th data-field="shopTel">전화번호</th>
					<th data-field="shopAddr">주소</th>
					<th data-field="crtdt">작성일</th>
					<th data-field="crtUser">작성자</th>
				</tr>
			</thead>
		</table>

		<div>&nbsp;</div>
		<input type="button" class="btn btn-info" id="createBtn" onclick="methodType('write');" value="등록하기"></input>
		<input type="button" class="btn btn-info" id="modifyBtn" onclick="methodType('modify');" value="수정하기"></input>
		<input type="button" class="btn btn-info" id="deleteBtn" value="삭제하기"></input>
		
		<div id="divvv">
			<div class="row well" style="margin-top: 3em;">
				<div id="admin_member" class="page_title"></div>
				<hr />
				<form id="adminShopForm" method="post" enctype="multipart/form-data">

					<div class="row form-group">
						<div class="row form-group">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">상점번호</div>
									<div class="col-sm-6">
										<input id="shopNum" type="text" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">상점이름</div>
									<div class="col-sm-6">
										<input id="shopName" type="text" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">전화번호</div>
									<div class="col-sm-6">
										<input id="shopTel" type="text" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">주소</div>
									<div class="col-sm-6">
										<input id="shopAddr" type="text" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">맵API</div>
									<div class="col-sm-3">
										<input id="shopAddrApi1" type="text" class="form-control">
									</div>
									<div class="col-sm-3">
										<input id="shopAddrApi2" type="text" class="form-control">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-4 text-center attr_name">홈페이지</div>
									<div class="col-sm-6">
										<input id="shopHp" type="text" class="form-control">
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-2 text-center attr_name">메인사진</div>
									<div class="col-sm-9">
										<input id="shopTitlePicPath" type="file" name="shopTitlePicPath" class="btn btn-default" style="font-size: 13px; width: 100%;"></input>
									</div>
								</div>
							</div>
						</div>
						<div class="row form-group">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-2 text-center attr_name">상점소개</div>
									<div class="col-sm-9">
										<textarea id="shopDetailDesc" class="form-control" rows="10"></textarea>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row form-group">
						<div class="col-sm-5">&nbsp;</div>
						<div class="col-sm-2">
							<div class="row">
								<button id="reset" type="button" class="col-sm-5 btn btn-warning" style="margin-right:2%;">취소</button>
								<a href="#" id="saveBtn" class="col-sm-5 btn btn-success">등록</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 상점정보보기 모달 -->
	<div class="modal fade" id="adminStoreModal">
		<div class="modal-dialog">
			<div class="modal-content modal-lg">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="modalTitle"></h4>
				</div>
				<div class="modal-body" style="height: 100%;">
					<form id="modalForm">
						<div class="row form-group">
							<div class="row form-group">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-3 text-center attr_name">메인사진경로</div>
										<div class="col-sm-8">
											<input id="modal_shopTitlePicPath" class="form-control input-sm" type="text" readonly />
										</div>
									</div>
								</div>
							</div>
							
							<div class="row form-group">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-3 text-center attr_name">홈페이지</div>
										<div class="col-sm-8">
											<input id="modal_storeHp" class="form-control input-sm" type="text" readonly />
										</div>
									</div>
								</div>
							</div>
							
							<div class="row form-group">
								<div class="col-sm-12">
									<div class="row">
										<div class="col-sm-3 text-center attr_name">상점정보</div>
										<div class="col-sm-8">
											<textarea style="resize: none; wrap:hard;" id="modal_shopDetailDesc" class="form-control input-sm" rows="15" readonly></textarea> 
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>


				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

</body>
</gachonTag:html>