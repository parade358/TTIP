//질문 답변 박스 보여주기 함수
function showAnswerBox(){
    document.querySelector("#questionSaveBtn").style.display = 'block';
    document.querySelector("#questionEnrollBtn").style.display = 'none';
    var answerBox = document.getElementsByName("answerBox");
    console.log(answerBox);
    for(var i=0 ; i<answerBox.length;i++){
        answerBox[i].style.display = 'block';
    }
}
//고수 상세 설명 함수
function showDetailServiceBox(){
    document.querySelector("#detailServiceSaveBtn").style.display = 'block';
    document.querySelector("#detailServiceEditBtn").style.display = 'none';
    document.getElementById("detailDescription").style.display = 'block';
}

//수정하기, 저장하기 버튼 display 활성화 비활성화 함수
var saveBtns = document.querySelectorAll(".saveBtn");
saveBtns.forEach(function(saveBtn){
    saveBtn.addEventListener('click',function(){
        saveBtn.style.display = 'none';
        var editBtn = saveBtn.previousElementSibling;
        editBtn.style.display = 'block';
    });
});