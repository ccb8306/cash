 $(window).ready(function () {
	let imgHeight;	
	
	let mainHeight = $('#main-content').height();
	console.log(mainHeight);
	
	if(mainHeight < 1200){
		imgHeight = 400; // 1400
	}else if(mainHeight < 1400){
		imgHeight = 700; // 1700
	}else if(mainHeight < 1600){
		imgHeight = 900; // 1900
	}else if(mainHeight < 1800){
		imgHeight = 1200; // 2100
	}else if(mainHeight < 2000){
		imgHeight = 1500;
	}else if(mainHeight < 2200){
		imgHeight = 1700;
	}else if(mainHeight < 2400){
		imgHeight = 1900;
	}else if(mainHeight < 2600){
		imgHeight = 2100;
	}else if(mainHeight < 2800){
		imgHeight = 2300;
	}else if(mainHeight < 3000){
		imgHeight = 2500;
	}else if(mainHeight < 3400){
		imgHeight = 2900;
	}else if(mainHeight < 3800){
		imgHeight = 3300;
	}else if(mainHeight < 4200){
		imgHeight = 3600;
	}else if(mainHeight < 4600){
		imgHeight = 4000;
	}
	
	$('#bg-img2').css('height', imgHeight);
	let mainBgHeight = $('#main-bg').height();
	mainHeight = $('#main-content').height();
	console.log(mainBgHeight);

})
$(window).scroll(function(event){
	let imgHeight;	
		
	let mainHeight = $('#main-content').height();
	console.log(mainHeight);
	
	if(mainHeight < 1200){
		imgHeight = 400; // 1400
	}else if(mainHeight < 1400){
		imgHeight = 700; // 1700
	}else if(mainHeight < 1600){
		imgHeight = 900; // 1900
	}else if(mainHeight < 1800){
		imgHeight = 1200; // 2100
	}else if(mainHeight < 2000){
		imgHeight = 1500;
	}else if(mainHeight < 2200){
		imgHeight = 1700;
	}else if(mainHeight < 2400){
		imgHeight = 1900;
	}else if(mainHeight < 2600){
		imgHeight = 2100;
	}else if(mainHeight < 2800){
		imgHeight = 2300;
	}else if(mainHeight < 3000){
		imgHeight = 2500;
	}else if(mainHeight < 3400){
		imgHeight = 2900;
	}else if(mainHeight < 3800){
		imgHeight = 3300;
	}else if(mainHeight < 4200){
		imgHeight = 3600;
	}else if(mainHeight < 4600){
		imgHeight = 4000;
	}
	
	$('#bg-img2').css('height', imgHeight);
	let mainBgHeight = $('#main-bg').height();
	mainHeight = $('#main-content').height();
	console.log(mainBgHeight);
});
