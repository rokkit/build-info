# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#house_address_attributes_region').parent().hide()
  states = $('#house_address_attributes_region').html()
  console.log "init"
  console.log(states)
  $('#house_address_attributes_country').change ->
    country = $('#house_address_attributes_country :selected').text()
    options = $(states).filter("optgroup[label=#{country}]").html()
    console.log(options)
    if options
      $('#house_address_attributes_region').html(options)
      $('#house_address_attributes_region').parent().show()      
    else
      $('#house_address_attributes_region').empty()
      $('#house_address_attributes_region').parent().hide()