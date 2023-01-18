/// @desc A simple movement behaviour tree node that demonstrates the basics
/// of creating a custom node.
function BtSimpleMovement() : BtLeaf() constructor
{
	// Node-local variables may be declared outside a tick_func
	spd = 3;
	
	// tick_func must be defined for new leaf nodes
	tick_func = function()
	{
		// Note that the calling instance may be accessed with the keyword: id
		if keyboard_check(ord("W"))
			id.y -= spd;
		
		if keyboard_check(ord("S"))
			id.y += spd;
			
		if keyboard_check(ord("A"))
			id.x -= spd;
			
		if keyboard_check(ord("D"))
			id.x += spd;
		
		// A BtLeaf must return a BT_STATUS.
		return BT_STATUS.SUCCESS
	}
}