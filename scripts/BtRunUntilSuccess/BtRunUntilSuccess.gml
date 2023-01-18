/**
	@func BtRunUntilSuccess
	@desc Forces its child to return BT_STATUS.RUNNING until it succeeds.
	Use this to repeat actions until a condition is met.
	@param {Struct} initChild
*/
function BtRunUntilSuccess(initChild) : BtDecorator(initChild) constructor
{
	static tick_func = function()
	{
		var retval = children[0].tick_func()
		
		if retval == BT_STATUS.SUCCESS
			return retval;
		else
			return BT_STATUS.RUNNING;
	}
}