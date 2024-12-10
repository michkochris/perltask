#!/usr/bin/perl
use warnings;
use strict;
use feature qw{ say };
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
    s{ (/lib) (/ld-linux\.so\.2)           }{/ulinux${1}32$2}gx;
    s{ (/lib) 64 (/ld-linux-x86-64\.so\.2) }{/ulinux$1$2}gx;
    s{ (/libx32/ld-linux-x32\.so\.2)       }{/ulinux$1}gx;
    print;
    if (eof) {
        print "\n";
        say '#undef STANDARD_STARTFILE_PREFIX_1';
        say '#define STANDARD_STARTFILE_PREFIX_1 "/ulinux/lib/"';
    }
}
