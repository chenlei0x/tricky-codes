:cex [] | bufdo vimgrepadd /foo/g % | cw
cex []: create a blank quickfix list
bufdo: execute a command in all buffers
vimgrepadd /foo/g %: search the current buffer (%) for foo and add it to the quickfix list
cw: open the quickfix window if it's not empty
