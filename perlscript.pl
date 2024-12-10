#!/usr/bin/perl
use warnings;
use strict;
use Config;

local $^I = "";  # In-place edit.

if ($Config{archname} =~ /^x86_64/) {
    local @ARGV = 't-linux64';
    while (<>) {
        s/lib\K64// if /m64=/;
        print
    }
}

@ARGV = 'linux64.h';
while (<>) {
    s{/lib/ld-linux.so.2}{/ulinux/lib32/ld-linux.so.2}g;
    s{/lib64/ld-linux-x86-64.so.2}{/ulinux/lib/ld-linux-x86-64.so.2}g;
    s{/libx32/ld-linux-x32.so.2}{/ulinux/libx32/ld-linux-x32.so.2}g;
    print;
    if (eof) {
        print "\n";
        print "#undef STANDARD_STARTFILE_PREFIX_1\n";
        print qq(#define STANDARD_STARTFILE_PREFIX_1 "/ulinux/lib/"\n);
    }
}
