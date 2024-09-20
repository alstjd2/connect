<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>게시판 추가</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="modal fade" id="addGubunModal" tabindex="-1" role="dialog" aria-labelledby="addGubunModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                    <h5 class="modal-title" id="addGubunModalLabel">게시판 추가</h5>
                <div class="modal-body">
                    <form id="addGubunForm" action="${pageContext.request.contextPath}/gw/board/insertGubunmark.do" method="post">
                        <div class="form-group">
                            <label for="gubunTitle" class="col-form-label">게시판명 <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="gubunTitle" name="grbGubunTitle" maxlength="60" placeholder="게시판명을 입력해 주세요." required>
                            <small class="form-text text-muted">0/60</small>
                        </div>
                        <div class="form-group">
                            <label for="gubunDesc" class="col-form-label">게시판 설명</label>
                            <textarea class="form-control" id="gubunDesc" name="grbGubunDesc" rows="4" maxlength="300" placeholder="설명을 입력해 주세요."></textarea>
                            <small class="form-text text-muted">0/300</small>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary" form="addGubunForm">추가</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS, jQuery (필요한 경우) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>
