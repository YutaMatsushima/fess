<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%><!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><la:message key="labels.admin_brand_title" /> | <la:message
		key="labels.related_query_configuration" /></title>
<jsp:include page="/WEB-INF/view/common/admin/head.jsp"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<jsp:include page="/WEB-INF/view/common/admin/header.jsp"></jsp:include>
		<jsp:include page="/WEB-INF/view/common/admin/sidebar.jsp">
			<jsp:param name="menuCategoryType" value="crawl" />
			<jsp:param name="menuType" value="relatedQuery" />
		</jsp:include>
		<div class="content-wrapper">
			<section class="content-header">
				<h1>
					<la:message key="labels.related_query_configuration" />
				</h1>
				<jsp:include page="/WEB-INF/view/common/admin/crud/breadcrumb.jsp"></jsp:include>
			</section>
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-primary">
							<div class="box-header with-border">
								<jsp:include page="/WEB-INF/view/common/admin/crud/header.jsp"></jsp:include>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<%-- Message --%>
								<div>
									<la:info id="msg" message="true">
										<div class="alert alert-info">${msg}</div>
									</la:info>
									<la:errors />
								</div>
								<%-- List --%>
								<c:if test="${relatedQueryPager.allRecordCount == 0}">
									<div class="row top10">
										<div class="col-sm-12">
											<em class="fa fa-info-circle text-light-blue"></em>
											<la:message key="labels.list_could_not_find_crud_table" />
										</div>
									</div>
								</c:if>
								<c:if test="${relatedQueryPager.allRecordCount > 0}">
									<div class="row">
										<div class="col-sm-12">
											<table class="table table-bordered table-striped">
												<thead>
													<tr>
														<th><la:message
																key="labels.related_query_list_term" /></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="data" varStatus="s"
														items="${relatedQueryItems}">
														<tr
															data-href="${contextPath}/admin/relatedquery/details/4/${f:u(data.id)}">
															<td>${f:h(data.term)}</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<c:set var="pager" value="${relatedQueryPager}"
										scope="request" />
									<c:import url="/WEB-INF/view/common/admin/crud/pagination.jsp" />
									<c:if test="${pager.currentPageNumber > pager.allPageCount}">
										<script>location.href = "${contextPath}/admin/relatedquery/list/${pager.allPageCount}";</script>
									</c:if>
								</c:if>
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
					</div>
				</div>
			</section>
		</div>
		<jsp:include page="/WEB-INF/view/common/admin/footer.jsp"></jsp:include>
	</div>
	<jsp:include page="/WEB-INF/view/common/admin/foot.jsp"></jsp:include>
</body>
</html>
