#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Text::OSIS' ) || print "Bail out!
";
}

diag( "Testing Text::OSIS $Text::OSIS::VERSION, Perl $], $^X" );
