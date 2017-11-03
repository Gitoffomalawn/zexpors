#!/usr/bin/perl

# Usage:
# echo WORD | ./WordPermutationsFull.pl  (permutate a single word)
# ./WordPermutationsFull.pl /path/to/wordlist  (permutate a wordlist)
# Use output redirection (>, >>, |) as usual

use strict;
use warnings;

my %permution = (
 "a" => [ "a", "4", "@" ],
 "b" => "b",
 "c" => "c",
 "d" => "d",
 "e" => "3e",
 "f" => "f",
 "g" => "g",
 "h" => "h",
 "i" => "i!1",
 "j" => "j",
 "k" => "k",
 "l" => "l1",
 "m" => "m",
 "n" => "n",
 "o" => "o0",
 "p" => "p",
 "q" => "q",
 "r" => "r",
 "s" => "s5\$",
 "t" => "t7",
 "u" => "u",
 "v" => "v",
 "w" => ["w"],
 "x" => "x",
 "y" => "y",
 "z" => "z2",
);

# End config

while(my $word = <>) {
 chomp $word;
 my @string = split //, lc($word);
 &permute(0, @string);
}

sub permute {
 my $num = shift;
 my @str = @_;
 my $len = @str;

 if($num >= $len) {
  foreach my $char (@str) {
   print $char;
  }
  print "\n";
  return;
 }

 my $per = $permution{$str[$num]};

 if($per) {
  my @letters = ();
  if(ref($per) eq 'ARRAY') {
   @letters = @$per;
  } else {
   @letters = split //, $per;
  }
  $per = "";

  foreach $per (@letters) {
   my $s = "";
   for(my $i = 0; $i < $len; $i++) {
    if($i eq 0) {
     if($i eq $num) {
      $s = $per;
     } else {
      $s = $str[0];
     }
    } else {
     if($i eq $num) {
      $s .= $per;
     } else {
      $s .= $str[$i];
     }
    }
   }
   my @st = split //, $s;
   &permute(($num + 1), @st);
  }
 } else {
  &permute(($num + 1), @str);
 }
}
