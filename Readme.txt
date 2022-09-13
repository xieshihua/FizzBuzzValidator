ValidateFizzBuzz.pl is a Perl script for validating the output of another Perl FizzBuzz generating script. Perl can be downloaded at https://www.perl.org/get.html.

Usage:

perl ValidateFizzBuzz.pl [-d]/[-h] file_to_be_tested.pl [log_file.csv]

By default, it uses new line as delimiter since it is the default exporting format of a standard FizzBuzz script found on https://rosettacode.org/wiki/FizzBuzz. However, you may use the optional -d option to specify a different delimiter, such as comma. For example:

perl ValidateFizzBuzz.pl -d"," FizzBuzz_comma.pl

You may see other examples by using the optional -h option, or simply run:

perl ValidateFizzBuzz.pl

If the optional [log_file.csv] is omitted, it will display the test result on the screen.

List of files:
•	Readme.txt
•	ValidateFizzBuzz.pl – script to validate FizzBuzz output
•	FizzBuzz.pl – original FizzBuzz generator from https://rosettacode.org/wiki/FizzBuzz
•	fizzbuzz_log.csv – validation result of FizzBuzz.pl
•	FizzBuzz_comma.pl – a modified FizzBuzz generate that uses comma as delimiter
•	FizzBuzz_comma_log.csv – validation result of FizzBuzz_comma.pl
•	FizzBuzz_bad.pl – a modified FizzBuzz generate that generates some bad results
•	FizzBuzz_bad_log.csv – validation result of FizzBuzz_bad.pl
