/// @description Movimento

#region CONTROLS
key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_jump = keyboard_check(vk_up)
#endregion


#region MOVEMENT
var move = key_right - key_left
hspd = move * spd;
vspd += grv;

if (hspd!= 0) image_xscale = sign(hspd);

//HORIZONTAL
if place_meeting(x + hspd, y, ofloor)
{
 while(!place_meeting(x + sign(hspd), y, ofloor))
 {
  x += sign(hspd);
 }
hspd = 0;
}

//DESBUG
if place_meeting(x + hspd, y, oset1)
{
 while(!place_meeting(x + sign(hspd), y, oset1))
 {
  x += sign(hspd);
 }
hspd = 0;
}


#region ANIMATION

sprite_index = sPlayerRun;
image_speed = 1;

if(not key_right and not key_left)
{
 sprite_index = sPlayerStop;
 image_speed = 1;
}
#endregion

x += hspd;

if (hspd!= 0) image_xscale = sign(hspd);

//VERTICAL
if place_meeting(x, y+ vspd, ofloor)
{
 while(!place_meeting(x, y+ sign(vspd), ofloor))
 {
  y += sign(vspd);
 }
vspd = 0;
}
y+= vspd;


// JUMP
if place_meeting(x,y+1,ofloor) and key_jump
{
 vspd -=10;
}
#endregion
