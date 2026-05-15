package core

var UtilityRegistrar func(u *Utility)

var NewBaseFeatureFunc func() Feature

var NewTestFeatureFunc func() Feature

var NewDetectEntityFunc func(client *CheckticaSDK, entopts map[string]any) CheckticaEntity

