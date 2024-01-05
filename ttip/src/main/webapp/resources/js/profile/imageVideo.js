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
        images += `<div class='image'>
	                    <img src='${URL.createObjectURL(image)}' alt='image'>
	                    <span onclick='deleteQueuedImage(${index})'>&times;</span>
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
	var oldFileNoArr = [];
	var oldChangeNameArr = [];
	
	var oldFileNoElements = $("input[name='oldFileNo']")
	var oldChangeNameElements = $("input[name='oldChangeName']")
	oldFileNoElements.each(function(){
		oldFileNoArr.push($(this).val());
	});
	oldChangeNameElements.each(function(){
		oldChangeNameArr.push($(this).val());
	});
	console.log('oldFileNoArr:',oldFileNoArr);
	console.log('oldChangeNameArr:',oldChangeNameArr);
	
    const formData = new FormData(queuedForm);
    console.log(formData);
    queuedImagesArray.forEach((image,index) => {
       	formData.append('files',image)
    });
   	formData.append('userNo', $('#userNo').val());
   	formData.append('oldFileNoArr',JSON.stringify(oldFileNoArr));
   	formData.append('oldChangeNameArr',JSON.stringify(oldChangeNameArr));
   	
    $.ajax({
        url: "uploadImages.pr",
        method: "POST",
        data: formData,
        traditional: true,
        contentType : false,
        processData : false,      
        success: function(result){
        	$.ajax({
        		url: "selectDetailImage.pr",
        		data: {"userNo": $("#userNo").val()},
        		success: function(imageList){
        			console.log('이미지 조회:',imageList);
        			var imageStr = "";
        			for(var i in imageList){
        				console.log('image changeName:',imageList[i].changeName);
        				imageStr += "<div class='finalDetailImageBoxClass'>"
		        						+"<img src='"+$("#contextPath").val()+'/'+imageList[i].changeName+"' alt='image'>"
		        						+"<span onclick='deleteSavedImage("+i+");'>&times;</span>"
		        						+"<input type='hidden' name='oldFileNo' value='"+imageList[i].atNo+"'></input>"
		        						+"<input type='hidden' name='oldChangeName' value='"+imageList[i].changeName+"'></input>"
        							+"</div>"
        			}
        			$("#imageVideoContainer").html(imageStr);
        		}
        	});
        }
    });
}

function deleteSavedImage(index){
	console.log('index:',index);
	 // i 변수가 현재 몇 번째 이미지인지를 나타내고 있다고 가정
	var fileNo = $("span[onclick='deleteSavedImage("+index+");']").next().val();

    	console.log('fileNo 확인합니다: ', fileNo);
	 $("span[onclick='deleteSavedImage(" + index + ")']").parent().remove();
	
	
	$.ajax({
		url: "deleteOneDetailImage.pr",
		data: {atNo: fileNo},
		success: function(result){
        	$.ajax({
        		url: "selectDetailImage.pr",
        		data: {"userNo": $("#userNo").val()},
        		success: function(imageList){
        			console.log('이미지 조회:',imageList);
        			var imageStr = "";
        			for(var i in imageList){
        				console.log('image changeName:',imageList[i].changeName);
        				imageStr += "<div class='finalDetailImageBoxClass'>"
		        						+"<img src='"+$("#contextPath").val()+'/'+imageList[i].changeName+"' alt='image'>"
		        						+"<span onclick='deleteSavedImage("+i+")'>&times;</span>"
		        						+"<input type='hidden' name='oldFileNo' value='"+imageList[i].atNo+"'></input>"
		        						+"<input type='hidden' name='oldChangeName' value='"+imageList[i].changeName+"'></input>"
        							+"</div>"
        			}
        			$("#imageVideoContainer").html(imageStr);
        			if(imageList.length>0){
		               $('#imageVideoComplete').val('true');
		               console.log('slide10요소 체크',$('#slide10'));
		               slide11++;
		           }else{
		               $('#imageVideoComplete').val('false');
		           }
		           removeSlideFunction();
			       location.reload();
        		}
        	});
        }
	});
}