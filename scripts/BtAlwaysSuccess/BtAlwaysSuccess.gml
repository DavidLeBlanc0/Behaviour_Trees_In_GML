/// @desc BtAlwaysSuccess Forces its given node to always return
/// BT_STATUS.SUCCESS
/// @param {Struct.BtNode} initChild Node to apply this to
function BtAlwaysSuccess(initChild = undefined) : BtDecorator(initChild) constructor
{
	static tick_func = function()
	{
		children[0].tick_func()
		
		return BT_STATUS.SUCCESS;
	}
}