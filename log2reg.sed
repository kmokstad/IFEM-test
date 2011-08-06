# $Id$
# Converts a log-file such that it can be used as reference in regression tests.
# Remember to manually insert the command-line arguments as the first line.

/^ *$/d
/^ *iter=/d
/^====/,$ d
/VTF/d
/umber of visualization points/d
/^Writing/d
s/\*/\\\*/g
