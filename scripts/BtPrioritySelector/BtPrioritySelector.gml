/**
	@function BtPrioritySelector
	@description Creates a priority selector node. Functions similar to a
	selector node, but it will always check from the leftmost node first
	(no runIndex). Every child to the right will be reset.
*/
function BtPrioritySelector(initChildren = undefined) 
	: BtCompositeNode(initChildren) constructor
{
	static tick_func = function()
	{
		var len = array_length(children)
		for (var i = runIndex; i < len; i += 1)
		{	
			retVal = children[i].tick_func()
			
			if retVal == BT_STATUS.RUNNING
			|| retVal == BT_STATUS.SUCCESS
			{
				for (var j = i + 1; j < len; j += 1)
					children[j].reset();
					
				return retVal;
			}
		}
	}
	
	return BT_STATUS.FAILURE
}