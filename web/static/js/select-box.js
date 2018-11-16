//非封装，待修改
// $(function(){
// 	var box_1=$('#select-box-1');
// 	var box_2=$('#select-box-2');
// 	$(box_1).find('ul li').click(function(evt){
// 		//evt.preventDefault();
// 		clearSelectItemClass(box_1);
// 		momdifyNavTree($(this).text(),0);
// 		$(this).addClass("selected-item");
//
// 		//ajax处理代码；
// 	});
//
// 	$(box_2).find('ul li').click(function(evt){
// 		//evt.preventDefault();
// 		clearSelectItemClass(box_2);
// 		momdifyNavTree($(this).text(),1);
// 		$(this).addClass("selected-item");
// 	});
// });
//
// function clearSelectItemClass(box){
// 	$(box).find('ul li.selected-item').removeClass("selected-item");
// }

// function momdifyNavTree(directionName,index){
// 	var interText='';
// 	if (index==1) {
// 		interText='\\\\';
// 	}else{
// 		$('#nav-tree-c span').eq(1).html('');
// 	}
// 	$('#nav-tree-c span').eq(index).html(interText+'<a>'+directionName+'</a>');
// }