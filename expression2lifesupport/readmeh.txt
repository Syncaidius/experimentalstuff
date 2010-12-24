===================================================================================================
Wiremod Expression Chip 2: Resource distribution and life support extension - Created by Syncaidius
===================================================================================================

Copy lua folder from zip file into your wiremod addon folder to install extension.



FUNCTIONS
=========
E:rdIsNode()   				- Returns 1 if the entity is a resource node
E:rdIsPump()				- Returns 1 if the entity is a resource pump
E:rdIsValve()				- Returns 1 if the entity is a resource valve
E:rdIsDevice()				- Returns 1 if the entity works with resource distribution 3

E:rdCapacity( "resource name" )		- Returns the capacity of an RD entity.
E:rdNetCapacity( "resource name" ) 	- Returns the capacity of the entire network the entity belongs to 

E:rdAmount( "resource name" )		- Returns the amount of a resource available

E:rdNetID()				- Returns the ID of the network the entity belongs to

E:rdResourceList()			- Returns an array containing all of the resources that are stored
					  or needed in a network. ONLY WORKS ON RESOURCE NODE ENTITIES!

E:rdNetEntities()			- Returns an array containing all of the entities connected to the
                                          current entity. ONLY WORKS ON RESOURCE NODE ENTITIES!

E:rdPumpSend("resource", amount)	- Sends an amount of resource to another pump, if connected to one.
					  E must be a pump entity for this to work.

E:rdPumpReceive("resource", amount) 	- Takes an amount of resource from another pump entity, if connected to
					  one. E must be a pump entity for this to work.

E:rdPumpConnect(ent)			- Connects a pump to another pump entity. Both entities must be pumps
					  otherwise the function will do nothing. :P

E:rdPumpDisconnect(ent)			- Disconnects a pump entity, if it was connected to another pump.

E:rdPumpConnected()			- Returns 1 if the pump is connected to another pump.

E:rdPumpConnectedTo()			- returns the entity ID of the other pump, if connected to one.

E:rdPumpName()				- Returns the name of a pump (e.g. pump_319)

rdInstalled()				- Returns 1 if resource distribution (and CAF obviously) is installed





-----------------------------

more soon!