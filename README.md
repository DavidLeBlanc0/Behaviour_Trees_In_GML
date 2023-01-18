# Behaviour_Trees_In_GML
 This project includes a collection of scripts that allow the creation and use of behaviour trees in GML for GameMaker. It also includes a sample script and object that demonstrate how they may be used. The sample object may be controlled with the WASD keys when running the project. Below the code for the sample script and the initialisation for the sample object are given.

# Behaviour Tree Sample Initialisation (Create Event)
```gml

bt = new BtParallel(
	new BtSimpleMovement()
 
 // Other subtrees to execute in parallel would be added here
);

```

# Sample Script
```gml
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

```
