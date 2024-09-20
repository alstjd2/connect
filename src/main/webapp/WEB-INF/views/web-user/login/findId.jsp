<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <section class="find m-auto" id="sectionPath" data-cpath="${cPath }">
    <form method="post">
        <h1 class="h3 pc fw-bold wow fadeInDown mb-4"><span>아이디 찾기</span></h1>
        <h1 class="h3 mo fw-bold wow fadeInDown mb-4">아이디 찾기</h1>

        <div class="form-floating wow fadeInUp" data-wow-delay=".2s">
            <input type="text" class="form-control" id="memNm" name="memNm" placeholder="이름을 입력하세요">
            <label for="floatingName">이름</label>
        </div>
        <div class="form-floating form-group has-feedback wow fadeInUp" data-wow-delay=".2s">
            <input type="email" class="form-control" id="memEmail" name="memEmail" placeholder="이메일을 입력하세요.">
            <label for="floatingEmail">이메일</label>
        </div>
        <ul class="d-flex align-items-center justify-content-between wow fadeInUp my-3" data-wow-delay=".4s">
            <li>
                <a href="${cPath }/w/member/pwFind.do">비밀번호 찾기</a>
            </li>
        </ul>
        <div class="button wow fadeInUp" data-wow-delay=".6s">
            <button class="btn w-100 py-2" id="idFindBtn" type="submit" data-bs-toggle="modal" data-bs-target="#idFindModal" >완료</button>
        </div>
    </form>
</section>

<!-- Modal -->
<div class="modal fade" id="idFindModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">회원 아이디 찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="${cPath }/resources/js/app/jhjTa/web/memberFindId.js"></script>