Class Ext_PerkFirebug extends Ext_PerkBase;

var bool bUseInferno,bUsePyromaniac,bUseGroundFire,bUseHeatWave;

replication
{
	// Things the server should send to the client.
	if (true)
		bUseInferno,bUsePyromaniac,bUseGroundFire,bUseHeatWave;
}

simulated final private function bool IsInfernoActive()
{
	return bUseInferno && WorldInfo.TimeDilation < 1.f;
}

simulated function bool GetIsUberAmmoActive(KFWeapon KFW)
{
	return bUsePyromaniac && IsWeaponOnPerk(KFW) && WorldInfo.TimeDilation < 1.f;
}

simulated function float GetZedTimeModifier(KFWeapon W)
{
	local name StateName;

	if (bUsePyromaniac && IsWeaponOnPerk(W))
	{
		StateName = W.GetStateName();
		if (BasePerk.Default.ZedTimeModifyingStates.Find(StateName) != INDEX_NONE || StateName == 'Reloading')
			return 1.f;
	}

	return 0.f;
}

simulated final private function bool IsGroundFireActive()
{
	return bUseGroundFire;
}

simulated final private function bool IsHeatWaveActive()
{
	return bUseHeatWave;
}

defaultproperties
{
	PerkIcon=Texture2D'UI_PerkIcons_TEX.UI_PerkIcon_Firebug'
	DefTraitList.Add(class'Ext_TraitWPFire')
	DefTraitList.Add(class'Ext_TraitNapalm')
	DefTraitList.Add(class'Ext_TraitFireExplode')
	DefTraitList.Add(class'Ext_TraitFireRange')
	DefTraitList.Add(class'Ext_TraitInferno')
	DefTraitList.Add(class'Ext_TraitPyromaniac')
	DefTraitList.Add(class'Ext_TraitGroundFire')
	DefTraitList.Add(class'Ext_TraitHeatWave')
	BasePerk=class'KFPerk_Firebug'

	PrimaryMelee=class'KFWeap_Knife_Firebug'
	PrimaryWeapon=class'KFWeap_Flame_CaulkBurn'
	PerkGrenade=class'KFProj_MolotovGrenade'
	SuperGrenade=class'ExtProj_SUPERMolotov'

	PrimaryWeaponDef=class'KFWeapDef_CaulkBurn'
	KnifeWeaponDef=class'KFWeapDef_Knife_Firebug'
	GrenadeWeaponDef=class'KFWeapDef_Grenade_Firebug'

	AutoBuyLoadOutPath=(class'KFWeapDef_CaulkBurn', class'KFWeapDef_DragonsBreath', class'KFWeapDef_FlameThrower', class'KFWeapDef_MicrowaveGun')

	DefPerkStats(13)=(Progress=3,bHiddenConfig=false) // Self damage.
	DefPerkStats(17)=(bHiddenConfig=false) // Fire resistance
}