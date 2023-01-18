/**
	@func BtRunUntilFail
	@desc Forces its child to return BT_STATUS.RUNNING until it fails.
	Use this to repeat actions until a condition is broken.
	@param {Struct} initChild
*/
function BtRunUntilFail(initChild) : BtDecorator(initChild) constructor
{
	static tick_func = function()
	{
		var retval = children[0].tick_func()
		
		if retval == BT_STATUS.FAILURE
			return BT_STATUS.FAILURE;
		else
			return BT_STATUS.RUNNING;
	}
}