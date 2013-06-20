# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
    $("#inform-modal" ).dialog
          dialogClass: "no-close"
          height: 140,
          modal: true
          hide: "fade"
          show: "fade"
          resizable: false
        