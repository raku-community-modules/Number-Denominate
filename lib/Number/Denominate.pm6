unit package Number::Denominate:ver<1.001001>;
use Lingua::Conjunction;

my %Units =
    time => (
        week => 7,
            day => 24,
                hour => 60,
                    minute => 60,
                        'second'
    ),
    weight => (
        tonne => 1000,
            kilogram => 1000,
                'gram'
    ),
    weight-imperial => (
        ton => 160,
            stone => 14,
                pound => 16,
                    'ounce'
    ),
    length => (
        'light year' => 9_460_730_472.5808,
            kilometer => 1000,
                'meter'
    ),
    length-mm => (
        'light year' => 9_460_730_472.5808,
            kilometer => 1000,
                meter => 100,
                    centimeter => 10,
                        'millimeter'
    ),
    length-imperial => (
        mile => 1760,
            yard => 3,
                <foot feet> => 12,
                    <inch inches>
    ),
    volume => (
        Liter => 1000,
            'milliliter'
    ),
    volume-imperial => (
        gallon => 4,
            quart => 2,
                pint => 20,
                    'fluid ounce'
    ),
    info => (
        yottabyte => 1000, zettabyte => 1000, exabyte => 1000, petabyte => 1000,
        terabyte  => 1000, gigabyte => 1000, megabyte => 1000, kilobyte => 1000,
        'byte'
    ),
    'info-1024' => (
        yobibyte => 1024, zebibyte => 1024, exbibyte => 1024, pebibyte => 1024,
        tebibyte => 1024, gibibyte => 1024, mebibyte => 1024, kibibyte => 1024,
        'byte'
    ),
;

subset ValidUnitSet of Str where any <time weight weight-imperial length
    length-mm length-imperial volume volume-imperial info info-1024>;

sub denominate (
    $num is copy,
    ValidUnitSet :$set = 'time',
    Bool :$hash        = False,
    Bool :$string      = True,
    :@units is copy    = %Units{ $set },
    Int  :$precision   = @units.elems,
) is export {
    my %break-down;
    my @break-down;

    if ( $num == 0 ) {
        return {} if $hash;
        my $u = @units.tail;
        return "0 " ~ ($u ~~ List ?? $u[1] !! $u ~ 's');
    }

    my $mult = 1;
    for @units { next unless $_ ~~ Pair; $mult *= .value }

    for @units -> $u {
        if ( $u ~~ Pair ) {
            my ( $k, $v ) = $u.key, $u.value;
            $k = ("$k", "{$k}s") unless $k ~~ List;

            my $n = $num.Int div $mult.Int;
            $num -= $mult*$n;
            my $name = $n == 1 ?? $k[0] !! $k[1];
            $hash   and $n and %break-down{ $name } = $n;
            $string and $n and @break-down.append: "$n $name";

            $mult /= $v;
        }
        elsif ( $u ~~ Str | List ) {
            my $name = $u ~~ Str
                ?? $num == 1 ?? $u    !! $u ~ 's'
                !! $num == 1 ?? $u[0] !! $u[1];
            $num .= Int;
            $hash   and $num and %break-down{ $name } = $num;
            $string and $num and @break-down.append: "$num $name";
        }
    }

    return %break-down if $hash;
    return conjunction @break-down;
}
