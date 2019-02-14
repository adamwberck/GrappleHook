// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = -10; // oPlayer
global.__objectDepths[1] = -100; // oGame
global.__objectDepths[2] = 0; // oPlayerStats
global.__objectDepths[3] = 0; // oParEntity
global.__objectDepths[4] = 0; // oParJumpThru
global.__objectDepths[5] = 0; // oParSolid
global.__objectDepths[6] = 0; // oParRail
global.__objectDepths[7] = 0; // oParEnemy
global.__objectDepths[8] = 0; // oParCorpse
global.__objectDepths[9] = 0; // oSlope45
global.__objectDepths[10] = 0; // oSlope23
global.__objectDepths[11] = 0; // oScablands
global.__objectDepths[12] = 0; // oBlockCave
global.__objectDepths[13] = 0; // oLine
global.__objectDepths[14] = 0; // oBlock16
global.__objectDepths[15] = 0; // oMousePlat
global.__objectDepths[16] = 0; // oBrick
global.__objectDepths[17] = 1; // oPathMover
global.__objectDepths[18] = 0; // oBlock
global.__objectDepths[19] = 0; // oCircleMover
global.__objectDepths[20] = 0; // oSwitchMoverV
global.__objectDepths[21] = 0; // oSwitchMoverH
global.__objectDepths[22] = 0; // oBounceMover
global.__objectDepths[23] = 0; // oRailMoverV
global.__objectDepths[24] = 0; // oRailMoverH
global.__objectDepths[25] = 0; // oRailPusherH
global.__objectDepths[26] = 0; // oJumpThru
global.__objectDepths[27] = 2; // oRail
global.__objectDepths[28] = 2; // oRail2
global.__objectDepths[29] = 2; // oRailTop
global.__objectDepths[30] = 2; // oRailRight
global.__objectDepths[31] = 2; // oRailBottom
global.__objectDepths[32] = 2; // oRailLeft
global.__objectDepths[33] = -1; // oFxDust
global.__objectDepths[34] = -1; // oFXBreak
global.__objectDepths[35] = -4; // oEnemyG
global.__objectDepths[36] = -4; // oEnemyKR
global.__objectDepths[37] = -4; // oEnemyKG
global.__objectDepths[38] = -4; // oShellR
global.__objectDepths[39] = -4; // oShell
global.__objectDepths[40] = -3; // oMushroom
global.__objectDepths[41] = -20; // oLeaf
global.__objectDepths[42] = 0; // oCoin
global.__objectDepths[43] = 0; // oCoinEffect
global.__objectDepths[44] = 0; // oPlayerCorpse
global.__objectDepths[45] = 0; // oCorpse
global.__objectDepths[46] = 0; // oFlat
global.__objectDepths[47] = 0; // crPit
global.__objectDepths[48] = 0; // crHorzontal


global.__objectNames[0] = "oPlayer";
global.__objectNames[1] = "oGame";
global.__objectNames[2] = "oPlayerStats";
global.__objectNames[3] = "oParEntity";
global.__objectNames[4] = "oParJumpThru";
global.__objectNames[5] = "oParSolid";
global.__objectNames[6] = "oParRail";
global.__objectNames[7] = "oParEnemy";
global.__objectNames[8] = "oParCorpse";
global.__objectNames[9] = "oSlope45";
global.__objectNames[10] = "oSlope23";
global.__objectNames[11] = "oScablands";
global.__objectNames[12] = "oBlockCave";
global.__objectNames[13] = "oLine";
global.__objectNames[14] = "oBlock16";
global.__objectNames[15] = "oMousePlat";
global.__objectNames[16] = "oBrick";
global.__objectNames[17] = "oPathMover";
global.__objectNames[18] = "oBlock";
global.__objectNames[19] = "oCircleMover";
global.__objectNames[20] = "oSwitchMoverV";
global.__objectNames[21] = "oSwitchMoverH";
global.__objectNames[22] = "oBounceMover";
global.__objectNames[23] = "oRailMoverV";
global.__objectNames[24] = "oRailMoverH";
global.__objectNames[25] = "oRailPusherH";
global.__objectNames[26] = "oJumpThru";
global.__objectNames[27] = "oRail";
global.__objectNames[28] = "oRail2";
global.__objectNames[29] = "oRailTop";
global.__objectNames[30] = "oRailRight";
global.__objectNames[31] = "oRailBottom";
global.__objectNames[32] = "oRailLeft";
global.__objectNames[33] = "oFxDust";
global.__objectNames[34] = "oFXBreak";
global.__objectNames[35] = "oEnemyG";
global.__objectNames[36] = "oEnemyKR";
global.__objectNames[37] = "oEnemyKG";
global.__objectNames[38] = "oShellR";
global.__objectNames[39] = "oShell";
global.__objectNames[40] = "oMushroom";
global.__objectNames[41] = "oLeaf";
global.__objectNames[42] = "oCoin";
global.__objectNames[43] = "oCoinEffect";
global.__objectNames[44] = "oPlayerCorpse";
global.__objectNames[45] = "oCorpse";
global.__objectNames[46] = "oFlat";
global.__objectNames[47] = "crPit";
global.__objectNames[48] = "crHorzontal";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for