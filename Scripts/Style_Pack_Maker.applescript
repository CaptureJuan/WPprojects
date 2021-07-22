

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

--Copyright 2021 Shootmachine.co

on makeCOStylePackFromFolder(aFolder)
	tell application "Finder"
		set parentFolder to (container of aFolder) as alias
		set quotedPosixParent to (quoted form of (POSIX path of parentFolder))
		set packName to name of aFolder
		set packFilename to packName & ".costylepack"
	end tell
	do shell script "cd " & quotedPosixParent & " ; zip -rX " & quoted form of packFilename & " " & quoted form of packName & " -x \"*.DS_Store\""
end makeCOStylePackFromFolder

on open Dropped_Items -- could be folders or files
	repeat with inputFolder in Dropped_Items
		my makeCOStylePackFromFolder(inputFolder)
	end repeat
end open

on run
	set inputFolder to choose folder with prompt "Select a folder (of Styles) to turn into a Style pack"
	my makeCOStylePackFromFolder(inputFolder)
end run
