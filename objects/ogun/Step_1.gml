/// @description Calculates shooting + controller aiming
x = oCapeMan.x+20;
y = oCapeMan.y+10;

// If controller is NOT detected, aim with mouse, if it is detected, aim with controller
if (oCapeMan.controller == 0)
{
	image_angle = point_direction(x,y, mouse_x, mouse_y);
}
else
{
	// Controller aiming with right thumbstick
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (abs(controllerh) > 0.2) || (abs(controllerv) > 0.2)
	{
		controllerAngle = point_direction(0, 0, controllerh, controllerv);
	}
	image_angle = controllerAngle;
}

firingdelay = firingdelay - 1;
recoil = max(0, recoil-1);
if ((mouse_check_button(mb_left)) || gamepad_button_check(0, gp_shoulderrb)) && (firingdelay < 0)
{
	recoil = 4;
	firingdelay = 5;
	// Creates bullet objects on Bullet layer 
	with (instance_create_layer(x,y, "Bullets", oBullet))
	{
		x = oCapeMan.x+35;
		y = oCapeMan.y+5;
		speed = 25;
		// Calculates direction of bullets + gives a bit of spread
		direction = other.image_angle + random_range(-3, 3);
		image_angle = direction;
	}
}


// Calculates recoil of the gun
x = x - lengthdir_x(recoil, image_angle);
y = y - lengthdir_y(recoil, image_angle);

if (image_angle > 90) && (image_angle < 270)
{
		image_yscale = -3;
}
else
{
	image_yscale = 3;	
}