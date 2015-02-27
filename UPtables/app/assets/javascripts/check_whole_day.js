$(document).ready(function() {
  $('.check_whole_day').click( function(){
     $('[value^=' + this.id + ']').prop('checked', this.checked);
 });
});
