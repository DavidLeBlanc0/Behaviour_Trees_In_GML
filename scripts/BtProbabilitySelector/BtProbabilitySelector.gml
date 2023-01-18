/**
	@func BtProbabilitySelector(initChildren)
	@description Composite selector node which executes a subtree with 
	probability weighted by its given value.
	
	@param initChildren The array of children and their probabilities. Each
	child should be a tuple of form [<child>, <probability>].
*/
function BtProbabilitySelector(initChildren = undefined) 
	: BtCompositeNode() constructor
{	
	probabilityArray = [0]
	
	static add_child = function(child)
	{
		
		if is_struct(child)
		{
			array_push(children, child[0]);
			var lastProb = probabilityArray[array_length(probabilityArray) - 1];
			array_push(probabilityArray, lastProb + child[1])
		}
		else if is_array(child)
		{
			for (var i = 0; i < array_length(child); i += 1)
			{
				{
					array_push(children, child[i,0])
					var lastProb = probabilityArray[array_length(probabilityArray) - 1];
					array_push(probabilityArray, lastProb + child[i, 1])
				}
			}
		}
		//show_debug_message("added children to btProbabilitySelector");
		//show_debug_message(probabilityArray);
	}
	
	add_child(initChildren);
	
	static tick_func = function()
	{
		// TODO: add support for running.
		
		var highestProb = probabilityArray[array_length(probabilityArray) - 1]
		var probabilityRoll = random(highestProb)
		
		
		/* TODO: make so in the case of failure, a re-roll is done with
		 removal.*/
		 if runIndex != 0
		 {
			 retVal = children[runIndex - 1].tick_func();
			 
			 if retVal != BT_STATUS.RUNNING
				runIndex = 0;
				
			return retVal;
		 }
		 
		for (var i = 1; i < array_length(probabilityArray); i += 1)
		{
			if probabilityRoll < probabilityArray[i]
			{
				retVal = children[i - 1].tick_func()
				
				if retVal == BT_STATUS.RUNNING
					runIndex = i;
				else
					runIndex = 0;
				
				return retVal;
			}
		}
		
	}
}