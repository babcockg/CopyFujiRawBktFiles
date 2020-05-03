# CopyFujiRawBktFiles

Responding to ...
"So as the noob that I am, I accidentally shot a timelapse with BKT setting on with x-t2. Anyone happen to know a way out of this mess without clicking manually thousands of files and moving every third file to other folder."

Solution: Copy only 1 of the BKT sequence files to another directory, import that directory, create your timelapse from those files.

If the BKT sequence is +1,0,1 then copy every 3rd file to the destination directory.

If the BKT sequence is -2,-1,0,1,2 then copy every 5th file, etc.

Be sure to set source and destination directories...

    `$srcRoot     = "G:\TestFolder\src"    # location of the BKT'd images`

    `$dstRoot     = "G:\TestFolder\dst"    # location to copy files to`
