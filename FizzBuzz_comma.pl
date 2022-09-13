use strict;
use warnings;

my $msg = "";

for my $i (1..100) {
    $msg = $msg.($i > 1 ? "," : "").
		($i % 15 == 0 ? "FizzBuzz"
		  : $i %  3 == 0 ? "Fizz"
		  : $i %  5 == 0 ? "Buzz"
		  : $i);
}

print $msg;