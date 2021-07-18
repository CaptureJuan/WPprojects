

use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

--Copyright 2021 Shootmachine.co

--Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
--The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
--THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 

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
