<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
    <div class="layout-menu-toggle navbar-nav align-items-xl-center me-4 me-xl-0 d-xl-none">
        <a class="nav-item nav-link px-0 me-xl-6" href="javascript:void(0)">
            <i class="bx bx-menu bx-md"></i>
        </a>
    </div>
    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
        <div class="navbar-nav align-items-center">
            <div class="nav-item dropdown-style-switcher dropdown me-2 me-xl-0">
                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <i class="bx bx-md"></i>
                </a>
                <ul class="dropdown-menu dropdown-menu-start dropdown-styles">
                    <li>
                        <a class="dropdown-item" href="javascript:void(0);" data-theme="light">
                            <span><i class="bx bx-sun bx-md me-3"></i>Light</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="javascript:void(0);" data-theme="dark">
                            <span><i class="bx bx-moon bx-md me-3"></i>Dark</span>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-item" href="javascript:void(0);" data-theme="system">
                            <span><i class="bx bx-desktop bx-md me-3"></i>System</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <ul class="navbar-nav flex-row align-items-center ms-auto">
            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                <a class="nav-link dropdown-toggle hide-arrow p-0" href="javascript:void(0);"
                    data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                        <img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
                    </div>
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                        <a class="dropdown-item" href="#">
                            <div class="d-flex">
                                <div class="flex-shrink-0 me-3">
                                    <div class="avatar avatar-online">
                                        <img src="${cPath}/resources/groupwareMember/assets/img/avatars/1.png" alt="" class="w-px-40 h-px-40 rounded-circle" />
                                    </div>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-0">John Doe</h6>
                                    <small class="text-muted">Admin</small>
                                </div>
                            </div>
                        </a>
                    </li>
                    <li>
                        <div class="dropdown-divider my-1"></div>
                    </li>
<!--                     <li> -->
<!--                         <a class="dropdown-item" href="#"> -->
<!--                             <i class="bx bx-user bx-md me-3"></i><span>My Profile</span> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a class="dropdown-item" href="#"> <i -->
<!--                                 class="bx bx-cog bx-md me-3"></i><span>Settings</span> </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <a class="dropdown-item" href="#"> -->
<!--                             <span class="d-flex align-items-center align-middle"> -->
<!--                                 <i class="flex-shrink-0 bx bx-credit-card bx-md me-3"></i><span -->
<!--                                     class="flex-grow-1 align-middle ms-1">Billing Plan</span> -->
<!--                                 <span class="flex-shrink-0 badge rounded-pill bg-danger">4</span> -->
<!--                             </span> -->
<!--                         </a> -->
<!--                     </li> -->
<!--                     <li> -->
<!--                         <div class="dropdown-divider my-1"></div> -->
<!--                     </li> -->
                    <li>
                        <a class="dropdown-item" href="${cPath }/gw/login/logout.do">
                            <i class="bx bx-power-off bx-md me-3"></i><span>Log Out</span>
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>

