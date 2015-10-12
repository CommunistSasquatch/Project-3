## Assignment: Project 2
## Author: Joe Barbercheck (mothman147@gmail.com)
## Version: 9.28.15.6
## Purpose: Demonstrate Recusion and "if" statments 

use 5.14.1;
use warnings;

my ($zipCode, $age, $numOfItems, $numOfItemsSameZip, $numOfItemsNotSameZip);
my ($name, $continueInt);
use constant "YES" => 1;
use constant "MAX_ZIP" => 99950;
use constant "MIN_ZIP" => 00501;
use constant "MAX_AGE" => 110;
use constant "MIN_AGE" => 10;
use constant "MIN_ITEMS" => 1;
use constant "MAX_ITEMS" => 12;


sub main {
	print "\t\t\t\n\nWelcome to Cafe Noir Coffee Shope\n\n";
	setContinueInt();
	while ($continueInt = YES){
		askName();
		askZip();
		askAge();
		askNumOfItems();
		printResults();
	}
	printGoodbye();


}
main();

sub setContinueInt {
	$continueInt = 0;
	print ("\n\nWould you like to continue?(Yes = 1 and No = 0) ");
	chomp ($continueInt = <STDIN>);
	if ($continueInt != YES) {
		printGoodbye();
	}
	
}

sub askName {
	print ("\n\nWhat is the customers name? ");
	chomp ($name = <STDIN>);
}

sub askZip {
	print ("\n\nWhat is the customer's zip code? ");
	chomp ($zipCode = <STDIN>);
	if ($zipCode > MAX_ZIP ||  $zipCode < MIN_ZIP) {
		system ("cls");
		print ("\n\nThat is an invalid zipcode! Are you sure you entered it correctly");
		sleep 1;
		askZip();
	}
}

sub askAge {
	$age = 0;
	print ("\n\nWhat is the customers age? ");
	chomp ($age = <STDIN>);
	if ($age < MIN_AGE || $age > MAX_AGE) {
		system ("cls");
		print "Age entered is not valid!";
		sleep 1;
		askAge();
	}
}

sub askNumOfItems {
	use constant MAX_ATTEMPTS => 2;
	$numOfItems = 0;
		for (my $i = 0; $i <= MAX_ATTEMPTS && ($numOfItems < MIN_ITEMS || $numOfItems > MAX_ITEMS); $i++) {
			print ("\n\nHow many items will the customer be ordering? ");
			chomp ($numOfItems = <STDIN>);
			if ($i == MAX_ATTEMPTS && $numOfItems < MIN_ITEMS) {
				printError();
			} 
		}
}

sub printResults {
	print ("\nName: $name");
	print ("\nAge: $age");
	print ("\nZipcode: $zipCode");
	print ("\nNumber of items in order: $numOfItems");
}

sub printGoodbye {
	system ("cls");
	print ("\n\n\t\t\t\tGoodbye!\n\n");
	sleep 2;
	die;
}

sub printError {
	system ("cls");
	print ("\n\nOrder is not counted");
	main();
}