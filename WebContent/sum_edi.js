$(document).ready(function() {
	  $('#summernote').summernote();
	});

	function showContent() {
	    $('.output').html($('#summernote').summernote('code'));
	}