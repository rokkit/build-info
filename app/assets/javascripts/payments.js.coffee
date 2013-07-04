jQuery ->
    $("#count_rating").change ->
        result = $(this).val()*$("#price_for_one_rating").val()
        $("#total_price").html result
        if $("#total").val() < result
            $("#total_price").html result+" Недостаточно средств"