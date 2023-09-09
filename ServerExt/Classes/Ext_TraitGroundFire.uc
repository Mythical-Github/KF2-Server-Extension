Class Ext_TraitGroundFire extends Ext_TraitBase;

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUseGroundFire = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUseGroundFire = false;
}

defaultproperties
{
	DefLevelCosts(0)=50
}