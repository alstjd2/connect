<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 <h5 class="mt-4">Customized Accordion</h5>
              <div class="row g-6">
                <div class="col-md">
                  <small class="text-light fw-medium">Accordion Customized Button</small>
                  <div class="accordion accordion-custom-button mt-3" id="accordionCustom">
                    <div class="accordion-item active">
                      <h2 class="accordion-header" id="headingCustomOne">
                        <button
                          type="button"
                          class="accordion-button"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionCustomOne"
                          aria-expanded="true"
                          aria-controls="accordionCustomOne">
                          Accordion Item 1
                        </button>
                      </h2>

                      <div
                        id="accordionCustomOne"
                        class="accordion-collapse collapse show"
                        aria-labelledby="headingCustomOne"
                        data-bs-parent="#accordionCustom">
                        <div class="accordion-body">
                          Lemon drops chocolate cake gummies carrot cake chupa chups muffin topping. Sesame snaps icing
                          marzipan gummi bears macaroon dragée danish caramels powder. Bear claw dragée pastry topping
                          soufflé.
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h2 class="accordion-header" id="headingCustomTwo">
                        <button
                          type="button"
                          class="accordion-button collapsed"
                          data-bs-toggle="collapse"
                          data-bs-target="#accordionCustomTwo"
                          aria-expanded="false"
                          aria-controls="accordionCustomTwo">
                          Accordion Item 2
                        </button>
                      </h2>
                      <div
                        id="accordionCustomTwo"
                        class="accordion-collapse collapse"
                        aria-labelledby="headingCustomTwo"
                        data-bs-parent="#accordionCustom">
                        <div class="accordion-body">
                          Dessert ice cream donut oat cake jelly-o pie sugar plum cheesecake. Bear claw dragée oat cake
                          dragée ice cream halvah tootsie roll. Danish cake oat cake pie macaroon tart donut gummies.
                        </div>
                      </div>
                    </div>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/popper/popper.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/js/app-kanban2.js"></script>
<script defer src="${cPath}/resources/groupwareMember/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="${cPath}/resources/groupwareMember/assets/vendor/libs/hammer/hammer.js"></script>
<script src="${cPath}/resources/groupwareMember/assets/vendor/libs/typeahead-js/typeahead.js"></script>
<script src="${cPath}/resources/groupwareMember/assets/vendor/js/bootstrap.js"></script>
