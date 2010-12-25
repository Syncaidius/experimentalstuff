===================================================================================================
Wiremod Expression Chip 2: Resource distribution and life support extension - Created by Syncaidius
===================================================================================================

Copy lua folder from zip file into your wiremod addon folder to install extension.



RD FUNCTIONS
============
E:rdIsNode()   				- Returns 1 if the entity is a resource node
E:rdIsPump()				- Returns 1 if the entity is a resource pump
E:rdIsValve()				- Returns 1 if the entity is a resource valve
E:rdIsDevice()				- Returns 1 if the entity works with resource distribution 3

E:rdCapacity( "resource name" )		- Returns the capacity of an RD entity.
E:rdNetCapacity( "resource name" ) 	- Returns the capacity of the entire network the entity belongs to 

E:rdAmount( "resource name" )		- Returns the amount of a resource available

E:rdNetID()				- Returns the ID of the network the entity belongs to

E:rdResourceList(capitalize)		- Returns an array containing all of the resources that are stored
					  Passing a value greater than 0 into the function will capitalize the first
					  letter of all resources returned (e.g. energy will return as Energy)
					  or needed in a network. ONLY FULLY WORKS ON RESOURCE NODE ENTITIES!

E:rdNetEntities()			- Returns an array containing all of the entities connected to the
                                          current entity. ONLY WORKS ON RESOURCE NODE ENTITIES!

E:rdPumpSend("resource", amount)	- Sends an amount of resource to another pump, if connected to one (max is 
					  50 per E2 tick/interval). E must be a pump entity for this to work.

E:rdPumpReceive("resource", amount) 	- Takes an amount of resource from another pump entity, if connected to
					  one (max is 50 per E2 tick/interval). E must be a pump entity for 
					  this to work.

E:rdPumpConnect(ent)			- Connects a pump to another pump entity. Both entities must be pumps
					  otherwise the function will do nothing. :P

E:rdPumpDisconnect(ent)			- Disconnects a pump entity, if it was connected to another pump.
E:rdPumpConnected()			- Returns 1 if the pump is connected to another pump.
E:rdPumpConnectedTo()			- returns the entity ID of the other pump, if connected to one.
E:rdPumpName()				- Returns the name of a pump (e.g. pump_319)
rdInstalled()				- Returns 1 if resource distribution (and CAF obviously) is installed


SB FUNCTIONS
============
sbStars()				- Returns an array containing the positions of every SB star on the map
sbPlanets()				- Returns an array containing the positions of every SB planet on the map.
					  Does not return an array of entities for obvious reasons (moving planets, etc)

E:sbEnvName()				- Returns the name of the environment the RD/LS/SB entity is inside
E:sbEmptyAir()				- Returns the percentage of empty air in the environment
E:sbGravity()				- Returns the gravity level of the environment
E:sbPressure()				- Returns the pressure level of the environment
E:sbHydrogen()				- Returns the percentage of hydrogen in the environment
E:sbNitrogen()				- Returns the percentage of nitrogen in the environment
E:sbCO2()				- Returns the percentage of carbon dioxide in the environment
E:sbOxygen()				- Returns the percentage of oxygen in the environment
E:sbTemperature()			- Returns the temperature of the environment

SB SUIT FUNCTIONS
=================			
E:sbSuitO2()				- Returns the oxygen level of a player's suit, if a player entity is used
E:sbSuitEnergy()			- Returns the energy level of a player's suit
E:sbSuitCoolant()			- Returns the coolant level of a player's suit

-----------------------------

more soon!