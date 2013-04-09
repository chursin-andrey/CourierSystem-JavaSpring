$(function() {
    $(".form_datetime").datetimepicker({
        format: 'yyyy-mm-dd hh:ii'
    });
    $("#orderOption").fadeOut();
    
    ymaps.ready(init);
    var myMap, route;

    function init(){     
        myMap = new ymaps.Map ("map", {
            center: [51.66, 39.30],
            zoom: 12
        });
        myMap.behaviors.disable(['drag']);
            
            
        $('.route').focusout(function () {     
            if ($("#start").val() != '' && $("#end").val() != '') {
                var start = 'Воронеж' + $("#start").val();
                var end = 'Воронеж' + $("#end").val();
                ymaps.route([
                    [start], [end]], { avoidTrafficJams: true
                    }).then(function (router) {
                    route && myMap.geoObjects.remove(route);
                    route = router;
                    
                    var start_date = $("#date_start").val().split('-');
                    var year = start_date[0];
                    var month = start_date[1];
                    var day = start_date[2].split(' ');
                    var hours = day[1].split(':');
                    day = day[0];
                    var minutes = hours[1];
                    hours = hours[0];

                    var date = new Date(year, month, day, hours, minutes);
                    var new_date = new Date(date.getTime() + (route.getTime() * 1000));
                    
                    $("#date_stop").val(new_date.format('yyyy-mm-dd HH:MM'));
                    $(".getLength").html(route.getHumanLength());
                    $(".getTime").html(route.getHumanJamsTime());
                    
                    $("#inputLength").val(route.getLength());
                    
                    $("#orderOption").fadeIn();
                    
                    myMap.geoObjects.add(route);
                }, function (error) {
                    alert("Возникла ошибка: " + error.message);
                });
                return false;
            }
            else
            {
                $("#orderOption").fadeOut();
                $("#date_stop").val('');
                $("#inputLength").val('');
                route && myMap.geoObjects.remove(route);
            }
        });
        
        
    }
});
