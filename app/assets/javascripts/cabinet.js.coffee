if $.cookie("modal") == null
    jQuery ->
        $('#rating-info').foundation('reveal', 'open')
        $.cookie("modal", 1)