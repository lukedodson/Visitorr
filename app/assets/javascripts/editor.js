
$(document).ready(function() {
   if ($('textarea').length > 0) {       
     var data = $('textarea');
     $.each(data, function(i) {
       CKEDITOR.replace(data[i].id,{skin:'kama',uiColor:'#e6edf3',toolbar:"Maybe"});
     });     
   }  
});
