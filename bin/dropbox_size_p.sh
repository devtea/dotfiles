#/bin/bash
# execi bar needs a value from 0-100, not the bytes. 
# To calculate the divsor here, take ( ${folder size} * 1024 * 1024 ) / 100 )
du -s ~/Dropbox | awk '{print $1 / 193987}'
