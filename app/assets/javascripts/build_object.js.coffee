# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#Dynamic select
jQuery.fn.extend dynsel: (child) ->
  $(child).parent().hide()
  if $(this).val() == ""
      $(child).parent().hide()
      $(child).nextAll().empty()
  data = $(child).html()
  $(this).change ->
    filter_value = $("option:selected", this).text()
    options = $(data).filter("optgroup[label='#{filter_value }']").html()
    if options
      $(child).html(options)
      $(child).prepend("<option value=''>Выберите значение</option>").val('');
      $(child).parent().show()      
    else
      $(child).empty()
      $(child).parent().hide()
      $(this).parent().nextAll().hide()
  child
  
jQuery ->
    $('#build_object_address_attributes_country_id')
    .dynsel($('#build_object_address_attributes_region_id'))
    .dynsel($('#build_object_address_attributes_city_id'))
    .dynsel($('#build_object_address_attributes_distinct_id'))
    .dynsel($('#build_object_address_attributes_street_id'))
    
    
jQuery ->
    $('#filter_country_id')
    .dynsel($('#filter_region_id'))
    .dynsel($('#filter_city_id'))
    .dynsel($('#filter_distinct_id'))
    .dynsel($('#filter_street_id'))
    
    
jQuery ->
    #$('#appartement-fields').hide()
    $("#filter_type_of_build_object").change ->
        if $("#filter_type_of_build_object :selected").text() == "Квартира (Вторичный рынок)"
            $('#appartement-fields').show()
        else
            $('#appartement-fields').hide()
jQuery ->
    #$('#appartement-fields').show()
    $("#build_object_type_of_build_object_id").change ->
        if $("#build_object_type_of_build_object_id :selected").text() == "Квартира (Вторичный рынок)"
            $('#appartement-fields').show()
        else
            $('#appartement-fields').hide()
jQuery ->
        $('#buildobjects-tbl').dataTable
            bJQueryUI: true
            bFilter: false
            bInfo: false
            bPaginate: false
            oLanguage:
                sProcessing: "Подождите..."
                sLengthMenu: "Показать _MENU_ записей"
                sZeroRecords: "Записи отсутствуют."
                sInfo: "Записи с _START_ до _END_ из _TOTAL_ записей"
                sInfoEmpty: "Записи с 0 до 0 из 0 записей"
                sInfoFiltered: "(отфильтровано из _MAX_ записей)"
                sInfoPostFix: ""
                sSearch: "Поиск:"
                sUrl: ""
                oPaginate:
                  sFirst: "Первая"
                  sPrevious: "Предыдущая"
                  sNext: "Следующая"
                  sLast: "Последняя"
                oAria:
                  sSortAscending: ": активировать для сортировки столбца по возрастанию"
                  sSortDescending: ": активировать для сортировки столбцов по убыванию"
