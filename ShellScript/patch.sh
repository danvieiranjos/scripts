rmdir '/opt/exagear/lic'
rm '/opt/exagear/bin/actool'
printf '\x00\xf0\x20\xe3\x01\x00\xa0\xe3' | dd of='/opt/exagear/bin/ubt_x32a32_al_mem2g' bs=1 seek=866740 count=8 conv=notrunc 2> /dev/null
printf '\x00\xf0\x20\xe3\x01\x00\xa0\xe3' | dd of='/opt/exagear/bin/ubt_x32a32_al_mem3g' bs=1 seek=996256 count=8 conv=notrunc 2> /dev/null
