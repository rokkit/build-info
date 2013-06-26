# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $("#inform-modal" ).dialog
          hide: "fade"
          show: "fade"
          resizable: false
          closeOnEscape: true
          draggable: false
          modal: true
        