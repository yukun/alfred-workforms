#!/bin/bash

# http://www.alfredforum.com/topic/2702-xmlscriptfilter-with-bash/
# http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/
# http://stackoverflow.com/questions/10969953/how-to-output-a-multiline-string-in-bash
# http://superuser.com/questions/620570/how-do-i-return-only-file-names-from-the-find-command


dir="/Users/yukun/Documents/RDC Connections/"

outputitem(){
	filename=$(basename "${1}")
	extension="${filename##*.}"
	filename="${filename%.*}"
	
	echo "    <item arg=\"${1}\" uid=\"rd-$filename\" valid=\"yes\">"
	echo "       <title>$filename</title>"
	echo "       <subtitle>${1}</subtitle>"
	echo "    </item>"
}

cat << EOF
<?xml version="1.0"?>
<items>
EOF

find "/Users/yukun/Documents/RDC Connections" -name "*${1}*.rdp" | while read line ; do outputitem "$line" ; done

cat << EOF
</items>
EOF