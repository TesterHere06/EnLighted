vsp = vsp + grv;

//Horizontal Collision
if (place_meeting(x+hsp, y, oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
}

x = x + hsp;


//Vertical Collision
if (place_meeting(x, y+vsp, oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0
}

y = y + vsp;

//Animation
if (!place_meeting(x, y+1, oWall)) //Jumping and landing
{
	image_speed = 2;
	if (sign(vsp) > 0) sprite_index = slime_jump_fall; else sprite_index = slime_jump_up;
}
else
{
	if (hsp == 0) //Idle state
	{
		image_speed = 0.5;
		sprite_index = slime_walk;
	}
	else
	{
		image_speed = 1;
		sprite_index = slime_walk;	
	}
}