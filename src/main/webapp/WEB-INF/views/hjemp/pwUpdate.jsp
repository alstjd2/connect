<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#changePasswordForm").submit(function(event) {
                let newPassword = $("#newPassword").val();
                let confirmPassword = $("#confirmPassword").val();

                if (newPassword !== confirmPassword) {
                    event.preventDefault();
                    alert("New passwords do not match");
                }
            });
        });
    </script>
</head>
<body>
    <h2>Change Password</h2>

    <c:if test="${not empty error}">
        <div style="color: red;">${error}</div>
    </c:if>
    
    <c:if test="${not empty message}">
        <div style="color: green;">${message}</div>
    </c:if>

    <form id="changePasswordForm" method="post" action="/changePassword">
        <div>
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>
        </div>
        <div>
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div>
            <label for="confirmPassword">Confirm New Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div>
            <button type="submit">Change Password</button>
        </div>
    </form>
    
    
</body>
</html>
