" Set path.
if has('win32') || has('win64')
    set path+=C:/gcc/i386-pc-mingw32/include
else
    set path+=/usr/local/include;/usr/include
endif
