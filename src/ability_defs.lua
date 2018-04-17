ABILITY_DEFS = {
	["heal"] = {
		cost = 1,
		targetType = UNIT_TARGET,
		cast = function(self)
			local neighbors = board:getNeighbors(self.actor.tilePos)
	    	
	    	TargetState.tiles = neighbors
	    	TargetState.ability = self
	    	gameState.push(TargetState)
	    	--handle click event for targeting while in casting state
	    	--figure out a targeting state to  deal 
		end,
		execute = function(self, target) 
			print("heal")
			self.actor.ap = self.actor.ap - self.cost
		end,
		undo = function()
		end
	},
	["smite"] = {
		cost = 1,
		targetType = UNIT_TARGET,
		execute = function()
			print("smite")
		end,
		undo = function()
		end
	},	
	["strike"] = {
		cost = 1,
		damage = 2,
		targetType = UNIT_TARGET,
		cast = function(self)
			local neighbors = board:getNeighbors(self.actor.tilePos)
	    	for i,n in ipairs(neighbors) do
	    		n.color = {255,64,96}
	    	end	
 
	    	--how are we figuring out what the target is
	    	self:execute(target)
		end,
		execute = function(self, target)
			print("strike")
			screen:shake(100)
			--find out target
			-- target:damage(damage)
		end,
		undo = function()
		end
	},
	["block"] = {
		cost = 1,
		cd = 2,
		targetType = NONE,
		execute = function()
			print("block")
		end,
		undo = function()
		end
	}
}