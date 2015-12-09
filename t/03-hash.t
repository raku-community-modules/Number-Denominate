#!perl6

use v6;
use Test;
use lib 'lib';
use Number::Denominate;

my %data = denominate 12661, :hash, :units(
    <second seconds> => 60,
    <minute minutes> => 60,
    <hour hours>
);

is-deeply %data, { hour => 3, minute => 31, second => 1 },
    'testing 12661 seconds';

is-deeply
    denominate( 12661, :hash, :units(<second> => 60, <minute> => 60, <hour>) ),
    %data,
    'testing unit shortcut';

is-deeply denominal( 12661, :hash, :set<time> ), %data,
    'testing unit set shortcut';

is-deeply denominal( 12661, :hash,
        :units( <foo bars>  => 60, <ber beers> => 60, <mar meow> ),
    ), { mar => 3, ber => 31, foo => 1 },
    'testing "s"-less units';

is-deeply denominal( 12660, :hash, :set<time> ), { hour => 3, minute => 31 },
    'testing "missing" units, when their number is 0 [test 1]';

is-deeply denominal( 3*3600, :hash, :set<time> ), { hour => 3 },
    'testing "missing" units, when their number is 0 [test 2]';

is-deeply denominal( 0, :hash, :set<time> ), { },
    'testing "missing" units, when their number is 0 [test 3]';

is-deeply denominal( 3, :hash, :set<time> ), { second => 3 },
    'testing "missing" units, when their number is 0 [test 4]';

is-deeply denominal( 3601, :hash, :set<time> ), { hour => 1, second => 1 },
    'testing "missing" units, when their number is 0 [test 5]';

done-testing;
