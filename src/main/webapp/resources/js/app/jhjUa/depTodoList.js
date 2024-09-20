/**
 *
 */

function checkAvailableRooms() {
  const startDate = document.getElementById("startTime").value;
  const endDate = document.getElementById("endTime").value;


  const data = { todoStart: startDate, todoEnd: endDate, roomNo: roomNo };

  fetch("/your/api/endpoint", {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify(data),
  })
    .then((response) => response.json())
    .then((data) => {
      console.log(data);
    })
    .catch((error) => {
      console.error(error);
    });
}

document.getElementById("btn-primary").addEventListener("click", checkAvailableRooms);