document.addEventListener("DOMContentLoaded", function() {
    var currentPage = document.getElementById("hiddenCurrentPage").value;
    var elem = document.getElementById("category-bar");
    console.log('js 파일 안 currentPage: ' + currentPage);
    if (currentPage == 1) {
        var width = 1;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 50) {
                clearInterval(id);
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    } else if (currentPage == 2) {
        var width = 50;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 80) {
                clearInterval(id);
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    } else {
        var width = 80;
        var id = setInterval(frame, 10);
        function frame() {
            if (width >= 100) {
                clearInterval(id);
            } else {
                width++;
                elem.style.width = width + "%";
            }
        }
    }
});
