/**
	@function BtLeaf
	@param {Function} t_f Function for the BtLeaf to execute. Should return one of
	{BT_STATUS.SUCCESS, BT_STATUS.FAILURE, or BT_STATUS.RUNNING}
	
	@description Creates a leaf node for a behaviour tree.
	When no return type is specified, it is assumed to return FAILURE.
	When defining behaviour, you must override tick_func (e.x. 
	tick_func = function(){<do stuff>})
*/
function BtLeaf(t_f = bt_empty_func()) : BtNode() constructor
{
	tick_func = t_f;
	
	static reset = function(){} // Do nothing.
}