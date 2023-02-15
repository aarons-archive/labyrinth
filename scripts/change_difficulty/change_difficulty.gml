function change_difficulty(_difficulty) {
	switch (_difficulty) {
		case "EASY":
			global.DIFFICULTY = difficulty.EASY
			break
		case "MEDIUM":
			global.DIFFICULTY = difficulty.MEDIUM
			break
		case "HARD":
			global.DIFFICULTY = difficulty.HARD
			break
	}
}