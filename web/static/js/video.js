

$(document).ready(function(){
    $(".comments-box").on("click",".comment-reply-link",function(){
        var str=prompt("请输入你要回复的内容^-^","");
        if(str!=null&&str!="")
        {
            var ul = $("#ul-1");
            //alert(ul.attr('id'));
            var num = ul.children("li").length;
           // alert(num);
            //jq innerhtml无效要使用 html才可以
            var li =$("<li><div><div class=\"comment-avatar\"><img src=\"static/img/avatar.png\" alt=\"MyPassion\"></div><div class=\"commment-text-wrap\" style=\"width: 433px;\"> <div class=\"comment-data\"><p style=\" width: 400px;/* width: 100%; */\"><a href=\"javascript:void(0);\" class=\"url\" id=\"name1\">MyPassion</a>&nbsp;TO&nbsp;<a href=\"javascript:void(0);\" class=\"url\" id=\"name2\">Decisiveman</a> <br> <span>January 12, 2013 - <a href=\"javascript:void(0);\" class=\"comment-reply-link\"  >reply</a></span></p></div><div class=\"comment-text\">"+str+"</div> </div> </div></li>");
                //document.createElement("li");
           // li.innerHTML="<div>" +"<div class=\"comment-avatar\"><img src=\"img/avatar.png\" alt=\"MyPassion\"></div>\n" + " <div class=\"commment-text-wrap\" style=\"width: 433px;\">\n" +"<div class=\"comment-data\">\n" + " <p style=\" width: 400px;/* width: 100%; */\"><a href=\"#\" class=\"url\">MyPassion</a>&nbsp;TO&nbsp;<a href=\"#\" class=\"url\">Decisiveman</a> <br> <span>January 12, 2013 - <a href=\"javascript:void(0);\" class=\"comment-reply-link\"  onclick=\"inputBox()\">reply</a></span></p>\n" + "</div>\n" + "<div class=\"comment-text\">"+str+"</div>\n" + "</div>\n" + "</div>";
            ul.append(li);
            //ul.bind(li);


            //add(num,str);
            //alert("^-^添加成功,您刚输入的是："+ str)
        }
    });
    $(".comments-box").on("click",".comment-reply-link-1",function(){
         var str=prompt("请输入你要回复的内容^-^","");
        if(str!=null&&str!="")
        {
            var ul = $("#comments_1").find("ul");
            //alert(ul.attr('id'));
            var num = ul.children("li").length;
            // alert(num);
            //jq innerhtml无效要使用 html才可以
            var li =$("<li><div><div class=\"comment-avatar\"><img src=\"static/img/avatar.png\" alt=\"MyPassion\"></div><div class=\"commment-text-wrap\" style=\"width: 433px;\"> <div class=\"comment-data\"><p style=\" width: 400px;/* width: 100%; */\"><a href=\"javascript:void(0);\" class=\"url\" id=\"name1\">MyPassion</a>&nbsp;TO&nbsp;<a href=\"javascript:void(0);\" class=\"url\" id=\"name2\">Decisiveman</a> <br> <span>January 12, 2013 - <a href=\"javascript:void(0);\" class=\"comment-reply-link\"  >reply</a></span></p></div><div class=\"comment-text\">"+str+"</div> </div> </div></li>");
            //document.createElement("li");
            // li.innerHTML="<div>" +"<div class=\"comment-avatar\"><img src=\"img/avatar.png\" alt=\"MyPassion\"></div>\n" + " <div class=\"commment-text-wrap\" style=\"width: 433px;\">\n" +"<div class=\"comment-data\">\n" + " <p style=\" width: 400px;/* width: 100%; */\"><a href=\"#\" class=\"url\">MyPassion</a>&nbsp;TO&nbsp;<a href=\"#\" class=\"url\">Decisiveman</a> <br> <span>January 12, 2013 - <a href=\"javascript:void(0);\" class=\"comment-reply-link\"  onclick=\"inputBox()\">reply</a></span></p>\n" + "</div>\n" + "<div class=\"comment-text\">"+str+"</div>\n" + "</div>\n" + "</div>";
            ul.append(li);
            //ul.bind(li);


            //add(num,str);
            //alert("^-^添加成功,您刚输入的是："+ str)
        }
    });
});


    // function inputBox()
    // {
    //     var str=prompt("请输入你要回复的内容^-^","");
    //     if(str!=null&&str!="")
    //     {
    //         var ul = document.getElementById("ul-1");
    //         var num = ul.childNodes.length;
    //        add(num,str);
    //         alert("^-^添加成功,您刚输入的是："+ str)
    //     }
    // }

function add(n,str){

    var ul = document.getElementById('ul-1');
    var li = document.createElement("li");
    var num = ul.childNodes.length;
    // var name1=ul.querySelector("#name1").innerHTML;
    // var name2=ul.querySelector("#name2").innerHTML;
    //alert(name1);
    li.innerHTML="<div>" +"<div class=\"comment-avatar\"><img src=\"img/avatar.png\" alt=\"MyPassion\"></div>\n" + " <div class=\"commment-text-wrap\" style=\"width: 433px;\">\n" +"<div class=\"comment-data\">\n" + " <p style=\" width: 400px;/* width: 100%; */\"><a href=\"#\" class=\"url\">MyPassion</a>&nbsp;TO&nbsp;<a href=\"#\" class=\"url\">Decisiveman</a> <br> <span>January 12, 2013 - <a href=\"javascript:void(0);\" class=\"comment-reply-link\"  onclick=\"inputBox()\">reply</a></span></p>\n" + "</div>\n" + "<div class=\"comment-text\">"+str+"</div>\n" + "</div>\n" + "</div>";
    for(var i=0;i<num;i++){
        if(n==-1){
            ul.appendChild(li);
        }else if(i==n-1){
            ul.insertBefore(li,ul.childNodes[i]);
        }
    }

}
