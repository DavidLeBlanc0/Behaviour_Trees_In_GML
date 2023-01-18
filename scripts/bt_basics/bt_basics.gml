// --------------- STATUS -------------------
enum BT_STATUS
{
	SUCCESS,
	FAILURE,
	RUNNING
}

// --------------- BASE CLASS -------------------
function BtNode() constructor
{
	self.id = other.id;
}


// --------------- AUX -------------------
function bt_empty_func()
{
	//show_error("ERROR: Unimplemented BT Leaf", true);
	return BT_STATUS.FAILURE;
}