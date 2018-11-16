function web_login() {
    $("#web_register").css('display', 'none');
    $("#web_login").slideDown(300);
};
function web_login2() {
    $("#web_register").css('display', 'none');
    $("#web_login").css('display', 'block');
};
function web_register() {
    $("#web_login").css('display', 'none');
    $("#web_register").slideDown(500);
};
function web_register2() {
    $("#web_login").css('display', 'none');
    $("#web_register").css('display', 'block');
};       
function  change_type(e) {
	var typeid = $(e).attr("id");
	var typetext=$(e).html();
	$(".News-type li").click(function(){
	  $(".News-type-text").text(typetext);
	  $(".News-type li").css("background","");
	  $(".News-type li").css("color","");
	  $(this).css("background","#ea4748");
	  $(this).css("color","white");
	  $(".News-list-c").hide();
	  $("#News-list-"+typeid).css("display","block");
	});
}; 
function  get_userinfo_text() {
	var name = $(".userinfo-title1").html();
	var email=$(".email-text").html();
	$("#name1").val(name);
	$("#email1").val(email);
};