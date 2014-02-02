$(document).ready(function() {

    $.getJSON('static/js/sounds.json', function(sounds) {
        for (var key in sounds) {
            obj = sounds[key];
            var link = $('<a/>').attr({
                'href': '#',
                'class': 'play',
                'data-mp3': key,
            });
            link.html(" " + obj.label).addClass(obj.class);
            if (obj.data) {
                link.attr('data-'+obj.class, obj.data);
            }
            $('#soundlinks').append(link).append('<br/>');
            $('body').append('<div id="'+key+'" class="player"></div>')
        };

        $('.player').jPlayer({
            ready: function() {
                var key = $(this).attr('id');
                var sound = sounds[key];
                $(this).jPlayer("setMedia", {mp3: "./sounds/"+key+'.mp3'});
                if (sound.volume) {
                    $(this).jPlayer("volume", sound.volume / 100.0);
                }
            },
            play: function () {
                // right, this one is needed, or you can't play two sounds at the same time
                console.log('playing '+$(this).attr('id'));
            },
            loop: true,
            preload: false,
            volume: .6
        });

        $('.play').on("click", function() {
            var player = $(this).data('mp3');
            if ($(this).hasClass('playing')) {
                $("#"+player).jPlayer("pause");
            } else {
                $('#'+player).jPlayer("play");
            }
            $(this).toggleClass('playing');
        });

    });


});
