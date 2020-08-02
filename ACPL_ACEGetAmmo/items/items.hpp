class ItemCore;
class InventoryItem_Base_F;

class ACPL_ACEgetAmmo_Item: ItemCore {
	SCOPE_PRIVATE;
	NAME("Base Item Class","Parent of all items");
	WEIGHT(10);
	MODEL("","");
	AMMO(0);
	simulation = "ItemMineDetector";
};

#include "ammocrate.hpp"