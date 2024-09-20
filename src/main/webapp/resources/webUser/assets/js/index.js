

function scrollColor(){
    const coreFeatures = document.getElementById("core-features");

    // 요소의 전체 높이와 오프셋 계산
    const coreFeaturesTop = coreFeatures.offsetTop;
    const coreFeaturesHeight = coreFeatures.clientHeight;

    // 시작 색상 (파란색)과 끝 색상 (흰색) 설정
    const startColor = { r: 22, g: 64, b: 223 };
    const endColor = { r: 255, g: 255, b: 255 };
    
       // 현재 스크롤 위치 계산
    const scrollY = window.scrollY;

    // 요소가 화면에 보이는 정도 계산 (0 ~ 1)
    let scrollPercent = 0;
    if (scrollY > coreFeaturesTop) {
        // 요소가 지나갔을 때
        scrollPercent = 100;
    } else if (scrollY > coreFeaturesTop) {
        // 요소가 화면에 나타나기 시작했을 때
        scrollPercent = (scrollY - coreFeaturesTop) / coreFeaturesHeight * 100;
    }

    // 시작 색상과 끝 색상 사이의 RGB 값을 보간
    const r = Math.round(startColor.r + (endColor.r - startColor.r) * (scrollPercent / 100));
    const g = Math.round(startColor.g + (endColor.g - startColor.g) * (scrollPercent / 100));
    const b = Math.round(startColor.b + (endColor.b - startColor.b) * (scrollPercent / 100));

    // 보간된 색상을 적용하여 배경색 변경
    coreFeatures.style.backgroundColor = `rgba(${r}, ${g}, ${b}, 1)`;
}
(function () {

    window.onscroll = function () {
        scrollColor();
    };
})();