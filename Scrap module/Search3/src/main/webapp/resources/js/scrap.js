

// 스크랩 체크
function ScrapModuleChk(contentsID,scrapbt){
	
	alert("scrap Chk:"+contentsID);

	$.ajax({
		type : 'post',
		url : '/scrapCheck/'+contentsID,
		async: false,
		success : function(check){
			alert("스크랩 체크 변경"+check);
			scrapbt.attr('check',check);
		}
	});
	
}

// 스크랩 버튼 클릭시
$(".bookbtn").on('click',function(){
	
	alert("click");
	var scrapbt = $(this);
	var contentsID = scrapbt.val();
	ScrapModuleChk(contentsID,scrapbt);
	
	if(scrapbt.attr('check') == 1){
		
		alert("스크랩 추가"+scrapbt.attr('check'));
		scrapbt.attr('check',0);
		$.post("/scrap/"+contentsID,function(data){
			alert(data);
		})
		
	}else{
		
		alert("scrap 제거"+scrapbt.attr('check'));
		scrapbt.attr('check',1);
		$.post("/scrapDelete/"+contentsID,function(data){
			alert(data);
		})
		
	}
});
	
