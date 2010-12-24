/******************************************************************************\
  RD support v1.00 - By Syncaidius
\******************************************************************************/

E2Lib.RegisterExtension("RD3support", true)

RD = nil
if CAF then
	RD = CAF.GetAddon("Resource Distribution")
end

/******************************************************************************/
--import needed e2 functions
local validEntity  = E2Lib.validEntity

/*************************************************************/


--=======================================
--GENERAL RESOURCE FUNCTIONS
--=======================================
--returns 1 if the entity is an RD3 resource node
__e2setcost(1)
e2function number entity:rdIsNode()
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				return 1
			end
		end
	end
	
	return 0
end

--returns 1 if the entity is an RD3 resource valve
__e2setcost(1)
e2function number entity:rdIsValve()
	if validEntity(this) then
		if CAF then
			if this.IsValve then
				return 1
			end
		end
	end
	
	return 0
end

--returns 1 if the entity is an RD3 resource pump
__e2setcost(1)
e2function number entity:rdIsPump()
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				return 1
			end
		end
	end
	
	return 0
end

--returns 1 if the entity is an RD3 resource device of any kind
__e2setcost(1)
e2function number entity:rdIsDevice()
	if validEntity(this) then
		if CAF then
			if this.Base == "base_rd3_entity" || this.IsNode || this.IsPump || this.IsValve then
				return 1
			end
		end
	end
	
	return 0
end	

--returns 1 if the entity is an RD3 resource device of any kind
__e2setcost(1)
e2function number rdInstalled()
	if CAF then
		if CAF.GetAddon("Resource Distribution") then
			return 1
		end
	end
end	

__e2setcost(2)
e2function number entity:rdCapacity(string res)
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				local nettable = RD.GetNetTable(this.netid)
				if nettable.resources[res] then
					return nettable.resources[res].maxvalue
				end
			elseif this.Base == "base_rd3_entity" then
				local enttable = RD.GetEntityTable(this)
				if enttable.resources[res] then
					return enttable.resources[res].maxvalue
				end
			end
		end
	end
	
	return 0
end

__e2setcost(2)
e2function number entity:rdNetCapacity(string res)
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				local nettable = RD.GetNetTable(this.netid)
				if nettable.resources[res] then
					return nettable.resources[res].maxvalue
				end
			elseif this.Base == "base_rd3_entity" then
				return RD.GetNetworkCapacity(this,res)
			end
		end
	end
	
	return 0
end

__e2setcost(2)
e2function number entity:rdAmount(string res)
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				local nettable = RD.GetNetTable(this.netid)
				if nettable.resources[res] then
					return nettable.resources[res].value
				end
			elseif this.Base == "base_rd3_entity" then
				local enttable = RD.GetEntityTable(this)
				if enttable.resources[res] then
					return enttable.resources[res].value
				end
			end
		end
	end
	
	return 0
end

__e2setcost(1)
e2function number entity:rdNetID()
	if validEntity(this) then
		if CAF then
			if this.netid then
				return this.netid
			end
		end
	end
	
	return 0
end

--Lists all of the resources active on the current entity (if any)
__e2setcost(5)
e2function array entity:rdResourceList()
	local temp = {}
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				local nettable = RD.GetNetTable(this.netid)
				local key = 1
				if nettable.resources then
					for k,v in pairs(nettable.resources) do
						temp[key] = k
						
						key = key + 1
					end
				end
			elseif this.Base == "base_rd3_entity" then
				local enttable = RD.GetEntityTable(this)
				local key = 1
				if enttable.resources then
					for k,v in pairs(enttable.resources) do
						temp[key] = k
						
						key = key + 1
					end
				end
			end
		end
	end
	
	return temp
end

--Returns all of the entities which are part of the current res net.
--Only works on resource node entities!
__e2setcost(10)
e2function array entity:rdNetEntities()
	local temp = {}
	if validEntity(this) then
		if CAF then
			if this.IsNode then
				local nettable = RD.GetNetTable(this.netid)
				if nettable.entities then
					for k,v in pairs(nettable.entities) do
						temp[k] = v
					end
				end
			end
		end
	end
	
	return temp
end

--=======================================
--RESOURCE PUMP FUNCTIONS
--=======================================
__e2setcost(5)
e2function void entity:rdPumpSend(string res, amount)
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				if this.otherpump then
					amount = math.Clamp(amount,0,50)
					this:Send(res,amount)
				end
			end
		end
	end
end

__e2setcost(5)
e2function void entity:rdPumpReceive(string res, amount)
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				if this.otherpump then
					amount = math.Clamp(amount,0,50)
					this.otherpump:Send(res,amount)
				end
			end
		end
	end
end

__e2setcost(5)
e2function void entity:rdPumpConnect(entity ent)
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				if this.otherpump == nil then
					this:Connect(ent)
				end
			end
		end
	end
end

__e2setcost(5)
e2function void entity:rdPumpDisconnect()
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				this:Disconnect()
			end
		end
	end
end

__e2setcost(1)
e2function number entity:rdPumpConnected()
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				if this.otherpump then
					return 1
				end
			end
		end
	end
	
	return 0
end

__e2setcost(1)
e2function string entity:rdPumpName()
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				return this:GetPumpName()
			end
		end
	end
	
	return 0
end

__e2setcost(1)
e2function entity entity:rdPumpConnectedTo()
	if validEntity(this) then
		if CAF then
			if this.IsPump then
				if this.otherpump then
					return this.otherpump
				end
			end
		end
	end
	
	return 0
end

/******************************************************************************/

registerCallback("construct", function(self)
	--self.data['currentsound'] = {}
end)

registerCallback("destruct", function(self)
	--for _,v in pairs(self.data['currentsound']) do
	--	v:Stop()
	--end
end)
