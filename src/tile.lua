Tile = class{
	init = function(self, position, solid, color)
		self.tilePos = position
		self.center = (self.tilePos * TILE_SIZE) + Vector(TILE_SIZE/2, TILE_SIZE/2)
		self.isSolid = solid or false
		self.effects = {}
		self.entity = nil	--queue/stack?
		self.color = color or {128,128,128}
		self.onEnter = function() end
	end
}

function Tile:getEntity()
	if self.entity ~= nil then
		return self.entity
	end
end

function Tile:getEffect()
	return self.effects[#self.effects]
end

function Tile:toggleSolid()
	self.isSolid = not self.isSolid
	if self.isSolid then
		self.color = {64,64,64}
	else
		self.color = {128,128,128}
	end
end