#!/usr/bin/awk -f
BEGIN {
    FS = " "
    c["configured"] = "\033[0;33m"
    c["created"] = "\033[0;32m"
    c["pruned"] = "\033[0;31m"
    c["unchanged"] = "\033[0;30m"
    nc = "\033[0;0m"
}
{
    printf("%s%s%s\n", c[$2], $0, nc)
}
