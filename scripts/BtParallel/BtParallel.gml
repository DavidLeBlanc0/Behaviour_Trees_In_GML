/**
	@description BtParallel creates a parallel node. Its tick function runs all
	children without exception. Only returns Success if all children return success.
	Otherwise, priority of return goes failure > running. Run indices are not stored.
	
	@param initChildren child node or array of children to add
*/
function BtParallel(initChildren = undefined) : BtCompositeNode(initChildren) constructor
{
	static tick_func = function()
	{
		retVal = BT_STATUS.SUCCESS;
		
		var len = array_length(children)
		for (var i = 0; i < len; i += 1)
		{	
			var _retVal = children[i].tick_func();
			
			if retVal == BT_STATUS.RUNNING
			|| retVal == BT_STATUS.SUCCESS
				retVal = _retVal;
			
			//if retVal == BT_STATUS.FAILURE
			//	return BT_STATUS.FAILURE;
		}
		
		return retVal;
	}
}