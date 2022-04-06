# Weeping-Angel-Pathfinding-AI

The goal of this AI is to act like a weeping angel, an entity that chases its target when its target is not looking at it and freezes when its target is looking at it.

The **Region3** script detects when someone enters a certain area. If the AI is not already targetting someone else, it will bind itself to that person and fire that individual's client script.

The **Client** script checks to see if the person can see the AI. It also uses ray casting to detect if the person is behind a wall and thus prevent the AI from freezing when the player can not see the AI but is behind a wall. It then fires the CanSee script or the CantSee script on the server based on the results.

The **CanSee** script freezes the AI in place and stops the walk animation and walk sound.

The **CantSee** script calculates the best path for the AI to take to the player whilst considering the AI's body proportionality and plays the walk animation and walk sound.

The **Main** script adds boolean and string values to the player's profile for the rest of the scripts to work. It also unbinds the AI from the person if the player dies, leaves the experience, or resets their character.

The **Jumpscare** script runs on the client and makes the AI's head shake, uses a 3rd party module to shake the person's camera, and plays sound effects.

Here is the experience link: 
https://www.roblox.com/games/8378991491
