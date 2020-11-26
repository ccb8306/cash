let mainHeight = $('#main-content').height();
console.log(mainHeight);

let imgHeight;

if(mainHeight < 1200){
	imgHeight = 400;
}else if(mainHeight < 1400){
	imgHeight = 700;
}else if(mainHeight < 1600){
	imgHeight = 900;
}else if(mainHeight < 1800){
	imgHeight = 1100;
}else if(mainHeight < 2000){
	imgHeight = 1400;
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
}

console.log(imgHeight);
$('#bg-img2').css('height', imgHeight);