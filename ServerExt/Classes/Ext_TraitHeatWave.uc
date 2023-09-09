Class Ext_TraitHeatWave extends Ext_TraitBase;

static function TraitActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUseHeatWave = true;
}

static function TraitDeActivate(Ext_PerkBase Perk, byte Level, optional Ext_TraitDataStore Data)
{
	Ext_PerkFirebug(Perk).bUseHeatWave = false;
}

defaultproperties
{
	DefLevelCosts(0)=50
}