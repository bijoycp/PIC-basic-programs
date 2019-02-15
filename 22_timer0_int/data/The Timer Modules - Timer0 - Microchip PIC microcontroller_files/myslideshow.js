var slide_ArrayCounter=0;
var slideImages=new Array();
var slideCurrentImage=new Array();
var slideImagesCount=new Array();
var slideSpeed=new Array();
var slideTimerID=new Array();

function SlideShowNextImage(ImageIndex){
	document.getElementById("img_"+ImageIndex).src=slideImages[ImageIndex][slideCurrentImage[ImageIndex]].src;
	slideCurrentImage[ImageIndex]++;
	if (slideCurrentImage[ImageIndex]==slideImagesCount[ImageIndex])slideCurrentImage[ImageIndex]=0;
	if (slideSpeed[ImageIndex]>0)slideTimerID[ImageIndex]=setTimeout ('SlideShowNextImage('+ImageIndex+')', slideSpeed[ImageIndex]);
}
function SlideShowPrevImage(ImageIndex){
	if (slideCurrentImage[ImageIndex]==0)slideCurrentImage[ImageIndex]=slideImagesCount[ImageIndex];
	slideCurrentImage[ImageIndex]--;
	if (slideCurrentImage[ImageIndex]==0)slideCurrentImage[ImageIndex]=slideImagesCount[ImageIndex];
	slideCurrentImage[ImageIndex]--;
	document.getElementById("img_"+ImageIndex).src=slideImages[ImageIndex][slideCurrentImage[ImageIndex]].src;
	slideCurrentImage[ImageIndex]++;
	if (slideCurrentImage[ImageIndex]==slideImagesCount[ImageIndex])slideCurrentImage[ImageIndex]=0;
}
function SlideSetManualChange(ImageIndex){
	clearTimeout(slideTimerID[ImageIndex]);
	slideSpeed[ImageIndex]=0;
	setTimeout ('SlideShowNextImage('+ImageIndex+')', slideSpeed[ImageIndex]);
	var cell_obj=document.getElementById('sld_cell_manual_'+ImageIndex);
	cell_obj.style.backgroundColor='#33CCFF';
	cell_obj.innerHTML='<input type="button" value="Reset" onClick="slideCurrentImage['+ImageIndex+']=0;SlideShowNextImage('+ImageIndex+')"><input type="button" value="<<<" onClick="SlideShowPrevImage('+ImageIndex+')"><input type="button" value=">>>" onClick="SlideShowNextImage('+ImageIndex+')">';
}
function SlideSetAutomaticChange(ImageIndex,Speed){
	clearTimeout(slideTimerID[ImageIndex]);
	slideSpeed[ImageIndex]=Speed;
	setTimeout ('SlideShowNextImage('+ImageIndex+')', slideSpeed[ImageIndex]);
	var cell_obj=document.getElementById('sld_cell_manual_'+ImageIndex);
	cell_obj.style.backgroundColor='#FF6666';
	cell_obj.innerHTML='<input type="radio" name="img_rad_'+ImageIndex+'" onClick="SlideSetManualChange('+ImageIndex+')">Manual';

}
