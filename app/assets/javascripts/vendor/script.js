$(function () {
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

        x = e.pageX - p.offset().left;
        var index = Math.ceil(x / f.width());
        var f2 = f.parent().parent();
        var left = parseInt(f2.css("left"));
        var z=0;
        if (index > 5) {

            z = (1-index)* f.width() +left;
           if($(".pp").length>10)
           {
             var allwidth = ($(".pp").length -10)* f.width();
              if(Math.abs(z)>allwidth)
              {
                  z = -allwidth;
              }
           }else if($(".pp").length<10)
           {
              z=0;
           }

        }
         if (index <= 5) {
            z = (10-index) * f.width() + left;
            if (z > 0) {
                z = 0;
            }
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
            var f2 = pp.parent();
            var left = parseInt(f2.css("left"));
            if(left<0)
            {
                var index = left + p.width();
                f2.css('left',index);
            }
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
            var f2 = p.parent();
            var left = parseInt(f2.css("left"));
           // var  x = pageX -pn.offset().left;
           // var index = Math.ceil(x / p.width());

            var index = left - p.width();
            var allwidth =$(".pp").length * p.width();
            if(Math.abs(index)<allwidth)
            {
                f2.css('left',index);
            }

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