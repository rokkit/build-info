# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#build_object_address_attributes_region').parent().hide()
  states = $('#build_object_address_attributes_region').html()
  $('#build_object_address_attributes_country').change ->
    country = $('#build_object_address_attributes_country :selected').text()
    options = $(states).filter("optgroup[label=#{country}]").html()
    console.log(options)
    if options
      $('#build_object_address_attributes_region').html(options)
      $('#build_object_address_attributes_region').parent().show()      
    else
      $('#build_object_address_attributes_region').empty()
      $('#build_object_address_attributes_region').parent().hide()