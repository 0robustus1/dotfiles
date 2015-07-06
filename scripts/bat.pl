#! /usr/bin/env perl


use strict;
use warnings;

sub bat_state {
  open(BAT, "ioreg -l | grep --color=never \"Capacity\" |") || die(
    "Couldn't use ioreg, maybe not on OSX\n");
  my $max_capacity;
  my $current_capacity;
  while ( <BAT> )
  {
    $max_capacity = $1 if ($_ =~ m/"MaxCapacity" = (\d+)/);
    $current_capacity = $1 if ($_ =~ m/"CurrentCapacity" = (\d+)/);
  }
  return ($current_capacity/$max_capacity);
}

sub percent_capacity {
  my $percent = bat_state() * 100;
  return sprintf("%.2f",$percent);
}

print(percent_capacity . "%\n");

exit 0;
