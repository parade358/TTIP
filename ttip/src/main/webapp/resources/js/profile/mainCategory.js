/**
 * 
 */
 	function selectDetailCategory2(){
			$("#main-category-list-2").css("display",'none'); 
			$("#detail-category-list-2").css("display",'block');
			$("#selectDetailCateBtnn").css("display",'none');
			$("#selectDetailCateBtnn2").css("display",'block');
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
								      +" <input type='radio' name='mainCheckedCategory' value='"+list[i].detailName+"'>"              
								      +"<span class='checkmark'></span>"              
						      		  +"</label>"          
						      	+"</div>"      
					}
					$("#detailCategoryBoxId2").html(str);
					
				}
			});
		}
    	document.getElementById("selectDetailCateBtnn2").addEventListener("click", function(){
    		
    		$.ajax({
    			url : "updateMainCategory.pr",
    			data : {
    				checkedCategory:  $("input[name='mainCheckedCategory']:checked").val(),
    				userNo: $("#userNo").val()
    			},
    			success : function(data){
    				
						 $.ajax({
			   		    	url : "selectAllProfileInfo.pr",
			   		    	data : {userNo: $("#userNo").val()},
			   		    	success : function(result){
	    			    		var selectedCategory = result.mainService;
	    			    		var str = "<div class='category-box'>"+selectedCategory+"</div>"
	    			    		$("#mainCategoryContainerBox .category-box:not(#serviceAdd2)").remove();
	    			    		$("#mainCategoryContainerBox").append(str);
	    			    		
	    			    		 slide3++;
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
    			}
  			  });
    		});
    	document.getElementById("mainPageBackPage2").addEventListener("click", function(){
    		$("#main-category-list-2").css("display",'block'); 
    		$("#detail-category-list-2").css("display",'none');
    		$("#selectDetailCateBtnn").css("display",'block');
    		$("#selectDetailCateBtnn2").css("display",'none');
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
					$("#mainCategoryBoxId2").html(str); 
					$("#detail-category-list-2").css("display",'none');
    			}
    		});
    	});