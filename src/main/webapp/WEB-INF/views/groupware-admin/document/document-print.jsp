<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${title}</title>
		<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/groupwareAdmin/assets/img/favicon/favicon.ico" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/groupwareAdmin/assets/vendor/css/rtl/core.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/groupwareAdmin/assets/css/connect.css" />
		<style type="text/css">
			.card {
	            box-shadow: 0px 0px 0px;
	        }
	        .dcmPage .table th {
	            background-color: rgb(219, 222, 224) !important;
	            text-align: center;
	            font-weight: 600;
	            font-size: 15px;
	            border-color: rgb(197, 201, 205);
	        }
	        .invoice-preview-header {
	            background-color: rgba(34, 48, 62, 0.06);
	        }
	        @media print {
	        	body{
	        		background: #fff;
	        	}
	            .card {
	                box-shadow: none; /* 프린트 시 그림자 없애기 */
	            }
	            .dcmPage .table th {
	                background-color: rgb(219, 222, 224) !important;
	                text-align: center;
	                font-weight: 600;
	                font-size: 15px;
	                border-color: rgb(197, 201, 205);
	            }
	            .invoice-preview-header {
	                background-color: rgba(34, 48, 62, 0.06);
	            }
	        }
		</style>
	</head>
	<body>
		<div class="dcmPage">
			${data}
		</div>
	</body>
	
</html>