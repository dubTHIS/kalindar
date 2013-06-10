// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.datepicker
//= require_tree .

// Wait until the DOM has loaded before querying the document
$(document).ready(function(){
	$('a#overlayAddEvent').click(function(e){
		$('#overlay').show();
		$('#modal').show();
		$('#modal').css({
			display:'block',
			left:( $(window).width() - $('#modal').width() )/2,
			top:( $(window).height() - $('#modal').height() )/2 -20,
		});
	});
	$('a#close').click(function(){
		$('#modal').hide();
		$('#overlay').hide();
	})
});