/**
	@function BtCompositeNode
	@description base struct for other composite nodes. Inheriting structs
	must provide an implementation for tick_func().
	@param initChildren child node or array of children to add
*/
function BtCompositeNode(initChildren = undefined): BtNode() constructor
{
	children = [];
	runIndex = 0
	//tick_func = undefined; // DOESN'T WORK, DON'T DO THIS
	
	/**
		@function add_child
		@param child child node or array of children to add
		@description Adds child (or children) to the node. Children are added
		to the right of any existing children.
	*/
	static add_child = function(child)
	{
		if is_struct(child)
			array_push(children, child);
		else if is_array(child)
		{
			for (var i = 0; i < array_length(child); i += 1)
				array_push(children, child[i])
		}
	}
	
	static reset = function()
	{
		runIndex = 0;
		for (var i = 0; i < array_length(children); i += 1)
				children[i].reset()
	}
	
	if initChildren != noone
		add_child(initChildren);
}