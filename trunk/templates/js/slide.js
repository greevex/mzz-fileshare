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
		var stat = true;
	}
	//alert(mystat);

	$('content').addEvent('mouseout', function(e){
		if(stat==true) {
			e.stop();
			myVerticalSlide.slideIn();
		}
	});

	$('closetip').addEvent('click', function(e){
		e.stop();
		myVerticalSlide.slideOut();
		stat=false;
	});
});