/// @description Make sure not in solid
// You can write your code in this editor
if(place_meeting(x,y,oParSolid)){
	for(var h=0;h<32;h++){
		if(!place_meeting(x+h,y,oParSolid)){
			x=x+h;
			break;
		}
		if(!place_meeting(x-h,y,oParSolid)){
			x=x-h;
			break;
		}
		if(!place_meeting(x,y+h,oParSolid)){
			y=y+h;
			break;
		}
		if(!place_meeting(x,y+h,oParSolid)){
			y=y-h;
			break;
		}
	}
}