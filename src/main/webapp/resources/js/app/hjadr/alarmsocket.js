/**
 * 
 */

// WebSocket 이벤트 핸들러
function connectWebSocket() {
    const contextPath = document.body.dataset.contextPath; 
    const domainName = location.href.split("/")[2]; 
    let ws = new WebSocket(`ws://${domainName}${contextPath}/ws/notifications`);

    ws.onopen = function() {
        console.log("Connected to WebSocket");
    };

    ws.onclose = function() {
        console.log("WebSocket closed.");
    };

    ws.onmessage = function(event) {
        console.log("Message : " + event.data);
    };
}

connectWebSocket();