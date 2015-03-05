// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require multi-select
//= require turbolinks
//= require bootstrap
//= require cocoon
//= require_tree .

$(document).ready(function() {
  
  $('.multiselect').multiSelect({cssClass:"ms-custom"});
  
  $('#selectable_modules').multiSelect({
    afterSelect: function(values){      
      $.each(values,  function( index, value ) {
          $('#mandatory_modules').find('option[value='+value+']').prop('disabled', true);  
      });
      $('#mandatory_modules').multiSelect('refresh');
    },
    afterDeselect: function(values){ 
      $.each(values,  function( index, value ) {
          $('#mandatory_modules').find('option[value='+value+']').removeProp('disabled');  
      });
      $('#mandatory_modules').multiSelect('refresh');
    },
    cssClass:"ms-custom"
  });
  
  $('#mandatory_modules').multiSelect({
    afterSelect: function(values){ 
      $.each(values,  function( index, value ) {
          $('#selectable_modules').find('option[value='+value+']').prop('disabled', true);  
      });
      
      $('#selectable_modules').multiSelect('refresh');         
    },
    afterDeselect: function(values){ 
      $.each(values,  function( index, value ) {
          $('#selectable_modules').find('option[value='+value+']').removeProp('disabled');  
      });
      $('#selectable_modules').multiSelect('refresh');
    },
    cssClass:"ms-custom"
  });
  
});
