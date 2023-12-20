let queuedImagesArray = [],
savedForm = document.querySelector("#saved-form"),
queuedForm = document.querySelector("#queued-form"),
savedDiv = document.querySelector(".saved-div"),
queuedDiv = document.querySelector(".queued-div"), // 변수명 수정
inputDiv = document.querySelector(".input-div"),
input = document.querySelector(".input-div input"),
serverMessage = document.querySelector(".server-message"),
deleteImages = [];

// SAVED IN SERVER IMAGES

// QUEUED IN FRONTEND IMAGES
input.addEventListener("change", () => {
    const files = input.files;
    for (let i = 0; i < files.length; i++) {
        queuedImagesArray.push(files[i]);
    }
    queuedForm.reset();
    displayQueuedImages();
});

inputDiv.addEventListener("drop", (e) => { //드래그 / 드랍 으로 파일 추가
    e.preventDefault(); //페이지 이동을 하거나 파일이 새로운 창에서 열리지 않게 도와줌
    const files = e.dataTransfer.files; // dataTransfer은 드롭드랍 관련한 속성이다
    for (let i = 0; i < files.length; i++) {
        if (!files[i].type.match("image")) continue; //파일이 이미지 형식이 아니라면 continue

        if (queuedImagesArray.every(image => image.name !== files[i].name)) //파일이 중복되는게 아니라면 파일 추가
            queuedImagesArray.push(files[i]);
    }
    displayQueuedImages();
});

function displayQueuedImages() {
    let images = "";
    queuedImagesArray.forEach((image, index) => { // 변수명 수정
        images += `<div class="image">
                        <img src="${URL.createObjectURL(image)}" alt="image">
                        <span onclick="deleteQueuedImage(${index})">&times;</span>
                    </div>`;
    });
    //URL.createObjectURL 은 주어진 객체의 url을 DOMString(문자열 데이터)으로 변환해준다. 
    //&times 엔터티 코드중 하나로 x 기호를 나타낸다.
    queuedDiv.innerHTML = images;
}

function deleteQueuedImage(index) {
    queuedImagesArray.splice(index, 1);
    displayQueuedImages();
}

queuedForm.addEventListener("submit", (e) => {
    e.preventDefault();
    sendQueuedImagesToServer();
});

function sendQueuedImagesToServer() {
	
	var files = input.files;
	

    const formData = new FormData(queuedForm);
    console.log(formData);
    queuedImagesArray.forEach((image,index) => {
    	console.log(index);
       	formData.append('files',image)
        //formData.append('0',image)
    });
		 console.log(formData.get(0));
    $.ajax({
        url: "uploadImages.pr",
        method: "POST",
        data: formData,
        contentType : false,
        processData : false,      
        success: function(result){
        	console.log(result);
        }
    });
    
    
}