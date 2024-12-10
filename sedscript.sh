#!/usr/bin/env bash



#--------------------------------------------------------------------------------------------------------
case $(uname -m) in
  x86_64)
    sed -e '/m64=/s/lib64/lib/' -i t-linux64
 ;;
esac
# change GCC's default dynamic linker to use the one installed in /ulinux.
sed -i 's,/lib/ld-linux.so.2,/ulinux/lib32/ld-linux.so.2,g' linux64.h
sed -i 's,/lib64/ld-linux-x86-64.so.2,/ulinux/lib/ld-linux-x86-64.so.2,g' linux64.h
sed -i 's,/libx32/ld-linux-x32.so.2,/ulinux/libx32/ld-linux-x32.so.2,g' linux64.h

echo -en '\n#undef STANDARD_STARTFILE_PREFIX_1\n#define STANDARD_STARTFILE_PREFIX_1 "/ulinux/lib/"\n' >> linux64.h
#--------------------------------------------------------------------------------------------------------
