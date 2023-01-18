/**
	@function BtCondition
	@param {Function} _condition A function that evaluates as true or false
	
	@description A type of leaf node.
	Accepts a function that evaluates to true / false and converts
	that into BT_STATUS.SUCCESS / BT_STATUS.FAILURE in a BT.
*/
function BtCondition(_condition) : BtLeaf() constructor
{
	condition = _condition
	tick_func = function()
	{
		retVal = condition();
		
		if retVal
			return BT_STATUS.SUCCESS;
		else
			return BT_STATUS.FAILURE;
	}
}