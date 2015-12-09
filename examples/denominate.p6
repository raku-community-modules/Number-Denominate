
my %Units = time => <second minute hour day week>, weight => <kg g>;

subset ValidUnitSet of Str where any %Units.keys;

sub denominate ( ValidUnitSet :$set ) {
    say "Set is $set";
}
denominate :set<time>;   # works
denominate :set<weight>; # works
denominate :set<bar>;    # fails type check
