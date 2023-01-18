/**
	@func BtDecorator
	@desc decorators attach to a single node and alter their behaviour.
	inheriting structs must provide an implementation for tick_func
	
	@param {struct} initChild the Bt node to add as a child.
*/
function BtDecorator(initChild) : BtCompositeNode(initChild) constructor
{
	if typeof(initChild) ==  "array"
		show_error("ERROR: cannot add more than one child to a decorator", true);
	
	static add_child = function()
	{
		show_error("ERROR: cannot add additional children to a decorator", true);
	}
}