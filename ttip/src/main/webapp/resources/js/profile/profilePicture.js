/**
 * 
 */
 
 // 버튼 클릭 이벤트 핸들러
    $('#insertProfileImage').click(function () {
        $('#insertProfileImageInput').click();
    });
    
 // 이벤트 핸들러 등록
    $('#insertProfileImageInput').change(function () {
        var file = this.files[0]; // this를 사용하여 현재 input 요소의 files에 접근
        console.log(file);

        if (file != null) {
            var formData = new FormData(); 
            formData.append('file', file);
            formData.append('profileNo', $('#profileNo').val());
            formData.append('oldChangeName', $('#changeName').val());
			
            console.log('oldchangeName:',$("#changeName").val());
            $.ajax({
                url: "uploadProfilePicture.pr",
                method: "POST",
                data: formData,
                contentType: false,
                processData: false,
                success: function (result) {
                    $.ajax({
                        url: "selectAllProfileInfo.pr",
                        data: { userNo: $("#userNo").val() },
                        success: function (result) {
                            var profile = result.changeName;
				    		if(profile!=null){
					    		$('#finalProfilePictureId').prop('src', $("#contextPath").val()+"/"+ profile);
				    			$('#profilePictureComplete').val('true');
				    		}else{
				    			$('#profilePictureComplete').val('false');
				    		}
                        }
                    });
                },
                error: function (result) {
                    console.log('프로필 업로드 실패');
                }
            }); 
        }
    });

    