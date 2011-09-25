# $Id$
# Converts a log-file such that it can be used as reference in regression tests.
# Basically, it deletes lines which are pointless in comparison with references.
# Remember to manually insert the command-line arguments as the first line.

/^ *$/d
/^ *iter=/d
/^====/,$ d
/VTF/d
/umber of visualization points/d
/^Writing/d
/^\.*$/d

# Since we use grep, some special characters that might occur must be escaped.
s/\*/\\\*/g
s/\[/\\\[/g
s/^ *--*//
