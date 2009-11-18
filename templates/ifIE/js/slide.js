window.addEvent('domready', function() {
	var status = {
		'true': 'open',
		'false': 'close'
	};
	
	var mystat = 'open';
	
	//-vertical

	var myVerticalSlide = new Fx.Slide('vertical_slide');
	if(mystat=='open') {
		$('vertical_slide').style.display='block';
		myVerticalSlide.hide();
		mystat='close';
	}
	//alert(mystat);

	$('allcontent').addEvent('mouseout', function(e){
		e.stop();
		myVerticalSlide.slideIn();
	});

	$('closetip').addEvent('click', function(e){
		e.stop();
		myVerticalSlide.slideOut();
	});


});