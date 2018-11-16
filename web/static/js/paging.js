(function ($) {
    $.fn.paging = function (options) {
        var _0 = this, box = $(this);
        var defaults = {list: "", currentPage: 1, pageSize: 5, listTotal: box.find(options.list).length,};
        options = $.extend(defaults, options);
        if (box.parent().siblings(".pagenation").length <= 0) {
            box.parent().after("<div class='pagenation' onselectstart='return false'><div class='pagenum indexpage'>首页</div><div class='pagenum lastpage'><a>上一页</a></div><div class='pageswiperbox'><div class='pageswiper'><div class='pagenum curpage pn'><a>1</a></div></div></div><div class='pagenum nextpage active'><a>下一页</a></div><div class='pagenum totalpage'>共<span></span>页</div><div class='pagetext'>到第<input type='text' class='pageinput'/>页</div><div class='pagenum pagesubbtn'><a>确定</a></div></div>")
        }
        if (options.currentPage != 1) $(".pagenation .indexpage").removeClass("active").addClass("active");
        var pagenation = box.parents().siblings(".pagenation");
        var pnWidth = parseInt(pagenation.find(".pn").outerWidth()) + parseInt(pagenation.find(".pn").css("margin-left")) + parseInt(pagenation.find(".pn").css("margin-right"));
        if (options.listTotal <= 0) {
            pagenation.hide();
            if (!box.is("table")) {
                var html = "<div class='nodetailtips' style='width: 100%;height: 150px;text-align: center;background: #fff;font-size: 24px;color: #E9514E;'>暂无数据</div>"
            } else {
                var col = box.find("th").length;
                var html = "<tr class='nodetailtips'><td colspan=" + col + " style='width: 100%;height: 60px;text-align: center;background: #fff;line-height: 60px;font-size: 24px!important;color: #E9514E;'>暂无数据</td></tr>"
            }
            box.append(html)
        } else {
            pagenation.show();
            $(".nodetailtips").remove()
        }
        var totalPage = 0;
        if (options.listTotal / options.pageSize > parseInt(options.listTotal / options.pageSize)) {
            totalPage = parseInt(options.listTotal / options.pageSize) + 1
        } else {
            totalPage = parseInt(options.listTotal / options.pageSize)
        }
        pagenation.find(".totalpage span").text(totalPage);
        pagenation.find(".pageswiperbox .pageswiper").empty();
        for (var k = 1; k <= totalPage; k++) {
            pagenation.find(".pageswiperbox .pageswiper").append("<div class='pagenum pn'><a>" + k + "</a></div>")
        }
        if (!options.callback) pageHtmlCallback();
        pagenation.find(".pn").eq(options.currentPage - 1).addClass('curpage');
        pagenation.find(".pn").eq(options.currentPage - 1).siblings(".pagenation .pn").removeClass('curpage');
        if (pagenation.find(".pn").first().hasClass("curpage")) {
            pagenation.find(".lastpage").removeClass("active")
        } else {
            pagenation.find(".lastpage").addClass("active")
        }
        ;
        if (pagenation.find(".pn").last().hasClass("curpage")) {
            pagenation.find(".nextpage").removeClass("active")
        } else {
            pagenation.find(".nextpage").addClass("active")
        }
        ;pagenation.find(".pageinput").on("input propertychange", function () {
            if (pagenation.find(".pageinput").val() == '' || !pagenation.find(".pageinput").val()) {
                pagenation.find(".pagesubbtn").removeClass("active")
            } else {
                pagenation.find(".pagesubbtn").addClass("active")
            }
            if (pagenation.find(".pageinput").val() > parseInt(pagenation.find(".totalpage span").text())) {
                pagenation.find(".pageinput").val(parseInt(pagenation.find(".totalpage span").text()))
            }
        });
        pagenation.find(".pn").on("click", function () {
            $(this).addClass("curpage");
            $(this).siblings(".pagenation .pn").removeClass("curpage")
        });
        pagenation.find(".pagenum").unbind("click").on("click", function () {
            // $(".pageinput").unbind("click");
            if ($(this).hasClass("pn")) {
                var k = $(this).text();
                pagenation.find(".pn").eq(k - 1).addClass("curpage");
                pagenation.find(".pn").eq(k - 1).siblings(".pagenation .pn").removeClass("curpage");
                options.currentPage = k;
                if (options.callback) {
                    options.callback(options.currentPage)
                } else {
                    pageHtmlCallback()
                }
                pageanimation(k - 1)
            } else if ($(this).hasClass("pagesubbtn") && $(this).hasClass("active")) {
                var k = parseInt($(this).siblings().find(".pageinput").val());
                pagenation.find(".pn").eq(k - 1).addClass("curpage");
                pagenation.find(".pn").eq(k - 1).siblings(".pagenation .pn").removeClass("curpage");
                options.currentPage = k;
                if (options.callback) {
                    options.callback(options.currentPage)
                } else {
                    pageHtmlCallback()
                }
                pageanimation(k - 1);
                if (k >= totalPage - 2) {
                    pagenation.find(".pageswiper").animate({'margin-left': '-' + pnWidth * (k - 3) + 'px'})
                }
            } else if ($(this).hasClass("lastpage") && $(this).hasClass("active")) {
                pagenation.find(".pn").eq(options.currentPage - 2).addClass("curpage");
                pagenation.find(".pn").eq(options.currentPage - 2).siblings(".pagenation .pn").removeClass("curpage");
                options.currentPage--;
                if (options.callback) {
                    options.callback(options.currentPage)
                } else {
                    pageHtmlCallback()
                }
                pageanimation(options.currentPage - 1)
            } else if ($(this).hasClass("nextpage") && $(this).hasClass("active")) {
                pagenation.find(".pn").eq(options.currentPage).addClass("curpage");
                pagenation.find(".pn").eq(options.currentPage).siblings(".pagenation .pn").removeClass("curpage");
                options.currentPage++;
                if (options.callback) {
                    options.callback(options.currentPage)
                } else {
                    pageHtmlCallback()
                }
                pageanimation(options.currentPage - 1)
            } else if ($(this).hasClass("indexpage")) {
                pagenation.find(".pn").eq(0).addClass("curpage");
                pagenation.find(".pn").eq(0).siblings(".pagenation .pn").removeClass("curpage");
                options.currentPage = 1;
                if (options.callback) {
                    options.callback(options.currentPage)
                } else {
                    pageHtmlCallback()
                }
                pageanimation(0)
            }
            if (pagenation.find(".pn").first().hasClass("curpage")) {
                pagenation.find(".lastpage").removeClass("active")
            } else {
                pagenation.find(".lastpage").addClass("active")
            }
            ;
            if (pagenation.find(".pn").last().hasClass("curpage")) {
                pagenation.find(".nextpage").removeClass("active")
            } else {
                pagenation.find(".nextpage").addClass("active")
            }
            ;$(".pagenation .indexpage").removeClass("active");
            if (options.currentPage != 1) $(".pagenation .indexpage").addClass("active");

            // console.log($("#pageBox").next());
            $("input[name=pageNum]").val(options.currentPage);
            $("#pageBox").next().submit();

        });

        function pageanimation(i) {
            if (totalPage > 5 && i >= 4) {
                pagenation.find(".pageswiperbox").css("min-width", pnWidth * 5 + "px");
                if (pagenation.find(".pn").eq(i).hasClass("curpage") && i <= totalPage - 2) {
                    pagenation.find(".pageswiper").animate({'margin-left': '-' + pnWidth * (i) + 'px'})
                } else if (pagenation.find(".pn").eq(i - 2).hasClass("curpage") && i <= totalPage) {
                    pagenation.find(".pageswiper").animate({'margin-left': '-' + pnWidth * (i - 4) + 'px'})
                }
            }
            if (totalPage > 5 && i <= 3 && i >= 0) {
                pagenation.find(".pageswiper").animate({'margin-left': 0 + 'px'})
            }
        }

        function pageHtmlCallback() {
            var startlist = (options.currentPage - 1) * options.pageSize + 1;
            var endlist = options.currentPage * options.pageSize;
            endlist = (endlist > options.listTotal) ? options.listTotal : endlist;
            for (var i = 1; i < (options.listTotal + 1); i++) {
                var ilist = box.find(options.list).eq(i - 1);
                if (i >= startlist && i <= endlist) {
                    ilist.show()
                } else {
                    ilist.hide()
                }
            }
        }
    }
})(jQuery);