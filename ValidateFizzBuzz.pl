use strict;
use warnings;

my $timestamp = "";
my $dilimiter = "";
my $sub_be_tested = "";
my $log_file = "";
my $answer = "";
my @answers = ();
my $i = 0;
my $inner_count = 0;
my $count = 0;
my $err_count = 0;
my $msg = "";

$msg = "\nProgram Name: ValidateFizzBuzz.pl\n"
	."\nAuther: Robert Xie\n"
	."\nDate: 2022-09-11\n"
	."\nPurpose: validate the output of a FizzBuzz function.\n"
	."\nusage: perl ValidateFizzBuzz.pl [-d]/[-h] file_to_be_tested.pl [log_file.csv]\n"
	."\t -d: optional, specify dilimiter, default is new line.\n\t    e.g.: -d\",\" specifies comma as the dilimiter.\n"
	."\t -h: optional, show help message.\n"
	."\t Note: When [log_file.csv] is missing, the result is exported to the screen.\n\n"
	."********** Example 1 **********\n"
	."To display the check result of FizzBuzz.pl to the screen:\n"
	."perl ValidateFizzBuzz.pl FizzBuzz.pl\n\n"
	."********** Example 2 **********\n"
	."To use ',' as the dilimiter to split the result from FizzBuzz_comma.pl,\nand display the check result to the screen:\n"
	."perl ValidateFizzBuzz.pl -d\",\" FizzBuzz_comma.pl\n\n"
	."********** Example 3 **********\n"
	."To export the check result of FizzBuzz.pl to the text file: FizzBuzz_log.csv:\n"
	."perl ValidateFizzBuzz.pl FizzBuzz.pl FizzBuzz_log.csv\n\n"
	."*****************************\n";

if (!$ARGV[0] || $ARGV[0] eq "-h") {
  print $msg;
  exit 0;
} elsif	(substr($ARGV[0], 0, 2) eq "-d") {
	$dilimiter = substr($ARGV[0], 2);
	print $dilimiter;
	$i = 1;
}

	$sub_be_tested = $ARGV[$i];
	open(InResults, "perl $sub_be_tested |");
	
if ($ARGV[$i + 1]) {
	$log_file = $ARGV[$i + 1];
	open (FH, ">", $log_file) or die ("Cannot open $log_file for output.");
}

$timestamp = localtime();
$msg = "*** Testing: $sub_be_tested ***\n";
$msg = $msg."*** ".$timestamp." ***\n";
print $msg;
if ($log_file) {print FH $msg;}

$msg = "Line #, Test value, Check value, Result\n";
$log_file ? print FH $msg : print $msg;

while (<InResults>) {
	chomp;
	$answer = $_;
	
	if (length($dilimiter) > 0) {
		@answers = split($dilimiter, $answer);
		$inner_count = scalar(@answers);
		for $i (0 .. $inner_count - 1) {
			$count += 1;
			$err_count += testFizzBuzz($count, $answers[$i], $msg) == 0 ? 1 : 0;
			$log_file ? print FH $msg : print $msg;
		}
	} else {
		$count += 1;
		$err_count += testFizzBuzz($count, $answer, $msg) == 0 ? 1 : 0;
		$log_file ? print FH $msg : print $msg;
	}
}

$msg = "$count line".($count > 1 ? "s have been" : " has been")." tested.\n"
	."Error".($err_count > 1 ? "s" : "")." found: $err_count.\n"
	."$sub_be_tested has ".($err_count == 0 ? "Passed" : "Failed")." the test.\n";

print $msg;
if ($log_file) {
	print FH $msg;
	print "Log File: $log_file.\n";
}

close(FH);

sub testFizzBuzz {
	my $count = shift(@_);
	my $test_value = shift(@_);
	my $fizz_buzz = "";
	my $result = 1;
	
	$fizz_buzz = "Fizz" x! ($count % 3) . "Buzz" x! ($count % 5) || $count;
	$result = ($test_value eq $fizz_buzz) ? 1 : 0;
	$_[0]= "#$count,$test_value,$fizz_buzz,".($result == 1 ? "Passed" : "Failed").".\n";
	return $result;
}
