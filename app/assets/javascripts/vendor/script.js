$(function () {
    $(".showphoto").on("click", function () {
        var id = $(this).attr("data-photobookid");
        var show = $('.showphotos');
        $.ajax({
            url: "/photos/photolist",
            type: "post",
            data: {photobook_id: id},
            success: function (data) {
                var mbody = show.find(".modal-body");
                mbody.html(data);
                var img =  $(".p").children('img').attr("data-photoid");
                var imgs = $(".ppp img[data-photoid='"+img+"']");
                imgs.prev().addClass("active");
                bind();
            },
            dataType: 'html'
        });
        show.modal();

    });
    $('.showphotos').on("hide.bs.modal", function (e) {
        $('.photo').unbind();
        $(this).find(".modal-body").html("");

    });
    $(".uploadphotoModal").on("show.bs.modal", function () {
        createUploader();
    });
});

function bind() {
    $(".pp").on('click', function (e) {
        var offset, x, f, p;
        f = $(this);
        p = f.parent().parent().parent();
        $(".pp").removeClass("active");
        f.addClass("active");
        offset = f.offset();
        x = e.pageX - p.offset().left;
        var s = Math.ceil(x / f.width());
        var f2 = f.parent().parent();
        var left = parseInt(f2.css("left"));
        var z=0;
        if (s > 6) {

            z = (1-s)* f.width() +left;
            console.log("left"+left);
            console.log("上面z:"+z);
            var pp;
            if ($(".pp").length > 10) {
                 pp = ($(".pp").length - 10) * f.width();
            } else {
                pp = 0;
            }

           console.log(left+pp);
        }
         if (s <= 4 && left < 0) {
            z = (s + 1) * f.width() + left;
            if (z > 0) {
                z = 0;
            }
            console.log("z:"+z)
        }
        f2.animate({left: z}, 500);
        showPhoto(f.next().attr("data-photoid"));
        e.stopPropagation();
    });

    function showPhoto(id) {
        $.ajax({
            url: "/photos/showphoto",
            type: "post",
            data: {photo_id: id},
            success: function (data) {
                var p = $(".showphotos .photo").find(".p");
                p.html(data);
                setactive(id);
                $.ajax({url:"comments/photocomments",
                    type:'post',
                    data:{photo_id:id},
                    success:function(data){
                        var c = $(".showphotos .comments").html(data);
                    },
                    dataType:'html'
                });
            },
            dataType: 'html'
        });
    }

    $('.photo').mousemove(function (event) {
        var offset, p, x;
        offset = $(this).offset();
        x = event.pageX - offset.left;
        p = $(this).children('.p');
        if (x < 400) {
            p.addClass('left');
            p.removeClass('right');
        } else if (x > 400) {
            p.addClass('right');
            p.removeClass('left');
        }
    });

    var prev, next;
    prev = function () {
        var p = $(".active").parent();
        var pp = p.prev();
        if(pp.length==0)
        {
            return;
        }
        else
        {
            var photoid =pp.find('img').attr("data-photoid");
            showPhoto(photoid);

        }
    };
    next = function () {

        var p = $(".active").parent();
        var pn = p.next();
        if(pn.length==0)
        {
            return;
        }
        else
        {
            var photoid =pn.find('img').attr("data-photoid");
            showPhoto(photoid);

        }
    };
    $('.photo').click(function (event) {
        var offset, x;
        offset = $(this).offset();
        x = event.pageX - offset.left;
        if (x < 400) {
            prev();
        } else if (x > 400) {
            next();
        }
    });
}
function setactive(pid){
    $(".pp").removeClass("active");
    $(".ppp img[data-photoid='"+pid+"']").prev().addClass("active");
}