# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 5;

BEGIN {
	use CGI;
	use_ok( 'CGI::NoPoison' ); 
}

my $m = CGI->new();
isa_ok ($m, 'CGI');

$m->param(
    -name=>'amplifier',
    -value=>['nine', 'ten', 'up to eleven'],
);
my %h = $m->Vars();
ok( ref($h{amplifier}) eq 'ARRAY', "Vars() returns anon array for hash values");

ok($h{amplifier}->[2] eq 'up to eleven', "Dereferencing works properly");

my @ary = $m->param('amplifier');
ok( scalar @ary == 3, "correct num. of array elements");
