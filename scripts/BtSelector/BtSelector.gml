/**
	@description BtSelector creates a sequence node. Its tick function runs
	until non-failure. Returns to the last-run node if did not finish last
	tick.
	@param initChildren child node or array of children to add
*/
function BtSelector(initChildren = undefined) : BtCompositeNode(initChildren) constructor
{	
	static tick_func = function()
	{
		var len = array_length(children)
		
		for (var i = runIndex; i < len; i += 1)
		{
			retVal = children[i].tick_func()
			
			if retVal == BT_STATUS.RUNNING
			{
				runIndex = i;
				return BT_STATUS.RUNNING;
			}
			
			if retVal == BT_STATUS.SUCCESS
			{
				runIndex = 0;
				return BT_STATUS.SUCCESS;
			}
		}
		
		runIndex = 0;
		reset();
		return BT_STATUS.FAILURE;
	}
}