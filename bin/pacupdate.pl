#!/usr/bin/perl
use strict;
use warnings;
my $n = `pacman -Qu | wc -l`;
my $k = `pacman -Qu | grep linux-ck-sandybridge | grep -v headers | wc -l`;
my $cool = "839494";
my $medi = "859900";
my $hot = "dc322f";

chomp($n);
chomp($k);
if ($n eq "0"){ 
	print '${color '."$cool".'}OK${color}' 
}elsif ($k eq "0"){ 
	print '${color '."$medi".'}'."$n new".'${color}' 
}else { 
	print '${color '."$hot".'}'."$n new w/ kernel update".'${color}' 
}
