/**
 * 
 */
  function selectDetailCategory(){
			$("#main-category-list").css("display",'none'); 
			$("#detail-category-list").css("display",'block');
			$("#selectDetailCateBtn").css("display",'none');
			$("#selectDetailCateBtn2").css("display",'block');
			var checkedCategoryArray = [];
			$("input[name='checkedCategory']:checked").each(function(){
				 checkedCategoryArray.push(parseInt($(this).val(), 10));
			})
			 $.ajax({
				url: "selectDetailCategoryModal.an",
				data: {"checkedCategory": checkedCategoryArray},
				success: function(list){
					var str = "";
					for(var i in list){
						str +=  "<div class='main-category'>"      
								      +"<label class='container'>"+list[i].detailName+""          
								      +" <input type='checkbox' name='detailCheckedCategory' value='"+list[i].detailName+"'>"              
								      +"<span class='checkmark'></span>"              
						      		  +"</label>"          
						      	+"</div>"      
					}
					$("#detailCategoryBoxId").html(str);
					
				}
			});
		}
    	document.getElementById("selectDetailCateBtn2").addEventListener("click", function(){
    		console.log("확인11");
    		var checkedCategory = [];
    	    $("input[name='detailCheckedCategory']:checked").each(function(){
    	    	checkedCategory.push($(this).val());
    	    });
    		$.ajax({
    			url : "updateSubCategory.pr",
    			data : {
    				checkedCategory: checkedCategory,
    				userNo: $("#userNo").val()
    			},
    			success : function(data){
    				console.log('카테고리 리스트',data);
    				
						 $.ajax({
	    			    	url : "selectAllProfileInfo.pr",
	    			    	data : {userNo: $("#userNo").val()},
	    			    	success : function(result){
	    			    		console.log('result확인해보자',result);
	    			    		var selectedCategory = [];
	    			    		selectedCategory = result.subService.split(',');
	    			    		var str = "";
	    			    		for(var i in selectedCategory){
	    			    			str += "<div class='category-box'>"+selectedCategory[i]+"</div>"
	    			    		}
	    			    		$("#categoryContainerBox .category-box:not(#serviceAdd)").remove();
	    			    		$("#categoryContainerBox").append(str);
	    			    		 slide4++;
					               slide5++;
					               slide6++;
					               slide7++;
					               slide8++;
					               slide9++;
					               slide10++;
					               slide11++;
				               
				               removeSlideFunction();
			             	location.reload();
	    			    	}
	    			    	
	    					});
						 $('#exampleModal').modal('hide');
						 
    			}
  			  });
    		});
    	document.getElementById("mainPageBackPage").addEventListener("click", function(){
    		$("#main-category-list").css("display",'block'); 
    		$("#detail-category-list").css("display",'none');
    		$("#selectDetailCateBtn").css("display",'block');
    		$("#selectDetailCateBtn2").css("display",'none');
    		$.ajax({
    			url: "selectMainCategoryModal.an",
    			data: {currentPage:1},
    			success: function(map) {
    				console.log('mainCAtegory:',map.list);
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
    			}
    		});
    	});