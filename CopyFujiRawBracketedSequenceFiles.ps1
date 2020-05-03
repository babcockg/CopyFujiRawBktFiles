$srcRoot     = "G:\TestFolder\src"    # location of the BKT'd images
$dstRoot     = "G:\TestFolder\dst"    # location to copy files to
$globs       = 'DSCF*.RAF'            # Fuji RAW file pattern, the '*' represents the sequence num
$nextSeq     = -1                     # numeric sequence of next file to copy
$seqInterval = 3                      # number of files in BKT sequence, 3 for BKT of -1,0,1, 5 for -2,-1,0,1,2, etc.


Get-ChildItem -Path $srcRoot | ForEach-Object {    
  $srcRaw = $_
  foreach ($glob in $globs) {    
    if ($_.Name -like $glob) {
      
      $prefix, $extension = $glob -split '\*'
      $numSeq = $_.Name.Substring($prefix.Length, $_.Name.Length - $prefix.Length - $extension.Length)

      # first time through the items
      if ( $nextSeq -lt 0 ) {
        $nextSeq = $numSeq
      }

      # if first time through, this will alway be true
      if ( $numSeq -eq $nextSeq ) {
        write-host 'Copying ' $srcRaw.FullName ' to ' $dstRoot

        # copy source file to destination directory
        Copy-Item $srcRaw.FullName -Destination $dstRoot

        # set the pattern for the next file to  copy
        $nextSeq = [int]$nextSeq + [int]$seqInterval
      }
    }  
  }
}