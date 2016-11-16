	$(document).ready(function(){
		var topBar = $("#bar").offset();
		$(window).scroll(function(){
			var docScrollY = $(document).scrollTop()
			var barThis = $("#bar")
			var fixNext = $("#content")
			if( docScrollY > topBar.top ) {
				barThis.addClass("fix");
				fixNext.addClass("topMar");
			} else {
				barThis.removeClass("fix");
				fixNext.removeClass("topMar");
			}
		});
	})