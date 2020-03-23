/// @description Insert description here
// You can write your code in this editor
if (shakePwr > 0) {
	shakeOffsetX = irandom_range(-shakePwr, shakePwr);
	shakeOffsetY = irandom_range(-shakePwr, shakePwr);
	shakePwr--;
}