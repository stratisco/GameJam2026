extends Node


signal game_over_signal


# should be reset on replay
var currentGUI = null
var hasWirecutters := false
var wirecuttersOrdered := false


# total attempts of the player. Incriments ++1 when the came starts 
var totalAttemps := 0

# a flag denoting whether the player has won or not. Used by the end game screen
# didTheyWin=true means they won the game 
var didTheyWin = false
