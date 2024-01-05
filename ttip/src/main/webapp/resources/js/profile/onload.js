/**
 * 
 */
var slide1 = 0;
var slide2 = 0;
var slide3 = 0;
var slide4 = 0;
var slide5 = 0;
var slide6 = 0;
var slide7 = 0;
var slide8 = 0;
var slide9 = 0;
var slide10 = 0;
var slide11 = 0;

$(function(){
    //hidden-Box 다 숨기기
     $("[class$='-hidden-workBox']").hide();
     
     
    //프로필 정보 조회
      $.ajax({
          url : "selectAllProfileInfo.pr",
          data : {userNo: $("#userNo").val()},
          success : function(result){
              console.log('모든 프로필 정보',result);
              
              //대표 서비스
              if(result.mainService!=null){
                  console.log('대표서비스 null이 아니지?');
                  var selectedCategory = result.mainService;
               var str = "<div class='category-box'>"+selectedCategory+"</div>"
               $("#mainCategoryContainerBox .category-box:not(#serviceAdd2)").remove();
               $("#mainCategoryContainerBox").append(str);
               
               $('#mainCategoryComplete').val('true');
               slide3++;
               slide4++;
               slide5++;
               slide6++;
               slide7++;
               slide8++;
               slide9++;
               slide10++;
               slide11++;
           }else{
               $('#mainCategoryComplete').val('false');
           }
           //제공 서비스
           if(result.subService!=null){
                  var selectedCategory = [];
               selectedCategory = result.subService.split(',');
               var str = "";
               for(var i in selectedCategory){
                   str += "<div class='category-box'>"+selectedCategory[i]+"</div>"
               }
               $("#categoryContainerBox .category-box:not(#serviceAdd)").remove();
               $("#categoryContainerBox").append(str);
               $('#subCategoryComplete').val('true');
               slide4++;
               slide5++;
               slide6++;
               slide7++;
               slide8++;
               slide9++;
               slide10++;
               slide11++;
           }else{
               $('#subCategoryComplete').val('false');
           }
              
           //한줄소개
           if(result.oneLineIntro!=null){
                   var introduceStr = result.oneLineIntro;
                   $("#introduce-result").text(introduceStr);
                   $('#oneLineComplete').val('true');
	               slide7++;
	               slide8++;
	               slide9++;
	               slide10++;
	               slide11++;
           }else{
               $('#oneLineComplete').val('false');
           }
              
           
           //연락 가능 시간
           if(result.phoneAvailable!=null){
                   var timeStr = result.phoneAvailable
                   $("#time-selected-result").html(timeStr);
                   $('#phoneAvailableComplete').val('true');
	               slide8++;
	               slide9++;
	               slide10++;
	               slide11++;
           }else{
               $('#phoneAvailableComplete').val('false');
           }
           
           //서비스 상세설명
           if(result.serviceDetailContent!=null){
                   var detailDescripStr = result.serviceDetailContent;
                   $("#detail-description-result").html(detailDescripStr);
                   $('#detailDescriptionComplete').val('true');
	               slide5++;
	               slide6++;
	               slide7++;
	               slide8++;
	               slide9++;
	               slide10++;
	               slide11++;
           }else{
               $('#detailDescriptionComplete').val('false');
           }
           //프로필 번호
           var profileNo = result.profileNo;
           $("#profileNo").val(profileNo);
           
           //changeName 설정
           var changeName = result.changeName;
           $("#changeName").val(changeName);
           
           //프로필 이미지 불러오기
           var profile = result.changeName;
           if(profile!=null){
               $('#finalProfilePictureId').prop('src', $("#contextPath").val()+"/"+ profile);
               $('#profilePictureComplete').val('true');
               slide2++;
               slide3++;
               slide4++;
               slide5++;
               slide6++;
               slide7++;
               slide8++;
               slide9++;
               slide10++;
               slide11++;
           }else{
               $('#profilePictureComplete').val('false');
           }
           
           //주소 조회
           if(result.address!=null){
               $('#areaComplete').val('true');
               $("#sample6_address").text(result.address);
               slide6++;
               slide7++;
               slide8++;
               slide9++;
               slide10++;
               slide11++;
           }else{
               $('#areaComplete').val('false');
           }
           
          //자격증 조회
          if(result.license!=null){
	          	console.log('license가 있다');
	      		slide9++;
	           slide10++;
	           slide11++;
          }else{
          }
          //포트폴리오 조회
          if(result.portfolio!=null){
	          	console.log('portfolio가 있다');
	      		slide10++;
	           slide11++;
          }else{
          }
           checkProgress();
           ajaxRequest2();
         }
          
      });
      
      function ajaxRequest2(){
      //질문 답변 조회
      $.ajax({
       url: "selectQuestionComment.pr",
       data: {userNo: $("#userNo").val()},
       success: function(qaCommentList){
           console.log('제발와줘:',qaCommentList);
           document.querySelector("#questionSaveBtn").style.display = 'none';
              document.querySelector("#questionEnrollBtn").style.display = 'block';
              $(".question-hidden-workBox").hide();
              $(".answered-box-result").show();
              
           for(var i in qaCommentList){
               console.log('questionNum:',qaCommentList[i].questionNum);
               switch(qaCommentList[i].questionNum){
                   case 1:
                       $("#startServiceId").text(qaCommentList[i].qaAnswer);
                       break;
                   case 2:
                       $("#specialListId").text(qaCommentList[i].qaAnswer);
                       break;
                   case 3:
                       $("#methodId").text(qaCommentList[i].qaAnswer);
                       break;
                   case 4:
                       $("#whatisMainCategoryId").text(qaCommentList[i].qaAnswer);
                       break;
                   case 5:
                       $("#whatisreturnId").text(qaCommentList[i].qaAnswer);
                       break;
               }
               
           }
           var answeredItemArr = $('#answered-box-ul .answered-item');
               var count = 0;
               answeredItemArr.each(function(){
                   if($(this).text()==""){
                       count += 1
                       $(this).parent().hide();
                   }
               });
               
               if(count>=5){
                   answeredItemArr.each(function(){
                       $(this).parent().show();
                   });
               }
               if(count==5){
                   console.log('count확인: false');
                   $('#questionComplete').val('false');
               }else{
                   console.log('-------t1 질문잡변---------');
                   $('#questionComplete').val('true');
               }
               checkProgress();
               ajaxRequest3();
       },
       error: function(result){
           console.log('질문답변을 가져오기 실패');
       }
   });
   }
   
   function ajaxRequest3(){
   //상세 이미지 조회
   $.ajax({
       url: "selectDetailImage.pr",
       data: {userNo: $("#userNo").val()},
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
           
           console.log('imageList length: ',imageList.length);
           if(imageList.length>0){
               $('#imageVideoComplete').val('true');
               console.log('slide10요소 체크',$('#slide10'));
               slide11++;
           }else{
               $('#imageVideoComplete').val('false');
           }
           checkProgress();
           ajaxRequest4();
       }
   });
   }
   function ajaxRequest4(){
   
      //멤버 정보 조회
      $.ajax({
       url : "memberSessionReinsert.me",
       data : {"email": $("#email").val()},
       success : function(member){
       
           $("#nickname-result").text(member.userNickName);
           ajaxRequest5();
       }
  	 });
    }
     function ajaxRequest5(){
      //메인카테고리 조회
   $.ajax({
       url: "selectMainCategoryModal.an",
       data: {currentPage:1},
       success: function(map) {
           console.log(map.list);
           var list = map.list
           var str = "";
           
           for(var i in list){
               str +=  "<div class='main-category'>"      
                             +"<label class='container'>"+list[i].categoryName+""          
                             +" <input type='checkbox' name='checkedCategory' value="+list[i].categoryNo+">"              
                             +"<span class='checkmark'></span>"              
                               +"</label>"          
                         +"</div>"      
           }
           $("#mainCategoryBoxId").html(str); 
           $("#detail-category-list").css("display",'none');
           $("#mainCategoryBoxId2").html(str); 
           $("#detail-category-list-2").css("display",'none');
           
           ajaxRequest6();
       }
   });
   }
   function ajaxRequest6(){
   		console.log('slide1 수:',slide1);
   		console.log('slide2 수:',slide2);
   		console.log('slide3 수:',slide3);
   		console.log('slide4 수:',slide4);
   		console.log('slide5 수:',slide5);
   		console.log('slide6 수:',slide6);
   		console.log('slide7 수:',slide7);
   		console.log('slide8 수:',slide8);
   		console.log('slide9 수:',slide9);
   		console.log('slide10 수:',slide10);
   		console.log('slide11 수:',slide11);
   		if($('#profilePictureComplete').val()=='true'){
   			swiper.removeSlide(0-slide1);
   		}
   		if($('#mainCategoryComplete').val()=='true'){
   			swiper.removeSlide(1-slide2);
   		}
   		if($('#subCategoryComplete').val()=='true'){
   			swiper.removeSlide(2-slide3);
   		}
   		if($('#detailDescriptionComplete').val()=='true'){
   			swiper.removeSlide(3-slide4);
   		}
   		if($('#areaComplete').val()=='true'){
   			swiper.removeSlide(4-slide5);
   		}
   		if($('#oneLineComplete').val()=='true'){
   			swiper.removeSlide(5-slide6);
   		}
   		if($('#phoneAvailableComplete').val()=='true'){
   			swiper.removeSlide(6-slide7);
   		}
   		if($('#licenseComplete').val()=='true'){
   			swiper.removeSlide(7-slide8);
   		}else{
   			console.log('slide8 삭제 실패');
   		} 
   		if($('#porfolioComplete').val()=='true'){
   			swiper.removeSlide(8-slide9);
   		}else{
   			console.log('slide9 삭제 실패');
   		} 
   		if($('#imageVideoComplete').val()=='true'){
   			swiper.removeSlide(9-slide10);
   		}
   		if($('#questionComplete').val()=='true'){
   			swiper.removeSlide(10-slide11);
   		}
   		
   }
});

function checkProgress(){
   console.log('바에 들어왔나?');
   console.log('프로필 히든값 :',$('#profilePictureComplete').val());
   console.log('대표서비스 히든값 :',$('#mainCategoryComplete').val());
   var elem = document.getElementById("bar");
   var currBarPercentage = 0;
   
   
   if ($('#profilePictureComplete').val() == 'true') {
       console.log('t1 프로필');
       var width = currBarPercentage;
       var itemPercentage = 15;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#mainCategoryComplete').val() == 'true') {
   console.log('t1 대표서비스');
       console.log('대표서비스 완성했을까?');
       var width = currBarPercentage;
       var itemPercentage = 15;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#subCategoryComplete').val() == 'true') {
   console.log('t1 제공서비스');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#detailDescriptionComplete').val() == 'true') {
   console.log('t1 상세설명');
       var width = currBarPercentage;
       var itemPercentage = 15;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#areaComplete').val() == 'true') {
   console.log('t1 활동지역');
       var width = currBarPercentage;
       var itemPercentage = 15;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#oneLineComplete').val() == 'true') {
       console.log('t1 한줄소개');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#phoneAvailableComplete').val() == 'true') {
   console.log('t1 연락가능시간');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#licenseComplete').val() == 'true') {
   console.log('t1 자격증');
       var width = currBarPercentage;
       var itemPercentage = 10;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#porfolioComplete').val() == 'true') {
   console.log('t1 포트폴리오');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#imageVideoComplete').val() == 'true') {
       console.log('----t1 사진 동영상----');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
       
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   if ($('#questionComplete').val() == 'true') {
   console.log('t1 질문답변');
       var width = currBarPercentage;
       var itemPercentage = 5;
       currBarPercentage = itemPercentage + currBarPercentage;
       var id = setInterval(frame, 10);
       function frame() {
           if (width >= currBarPercentage) {
               clearInterval(id);
           } else {
               width++;
               elem.style.width = width + "%";
               $('#barPercentageText').html(currBarPercentage+'%');
           }
       }
   }
   
   
   
}
