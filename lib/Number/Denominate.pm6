unit package Number::Denominate:ver<1.001001>;

# weight  => [
#     gram => 1000 => kilogram => 1000 => 'tonne',
# ],
# weight_imperial => [
#    ounce => 16 => pound => 14 => stone => 160 => 'ton',
# ],
# length  => [
#    meter => 1000 => kilometer => 9_460_730_472.5808 => 'light year',
# ],
# length_mm  => [
#    millimeter => 10 => centimeter => 100 => meter => 1000
#         => kilometer => 9_460_730_472.5808 => 'light year',
# ],
# length_imperial => [
#     [qw/inch  inches/] => 12 =>
#         [qw/foot  feet/] => 3 => yard => 1760
#             => [qw/mile  miles/],
# ],
# volume => [
#    milliliter => 1000 => 'Liter',
# ],
# volume_imperial => [
#    'fluid ounce' => 20 => pint => 2 => quart => 4 => 'gallon',
# ],
# info => [
#     bit => 8 => byte => 1000 => kilobyte => 1000 => megabyte => 1000
#         => gigabyte => 1000 => terabyte => 1000 => petabyte => 1000
#             => exabyte => 1000 => zettabyte => 1000 => 'yottabyte',
# ],
# info_1024  => [
#     bit => 8 => byte => 1024 => kibibyte => 1024 => mebibyte => 1024
#         => gibibyte => 1024 => tebibyte => 1024 => pebibyte => 1024
#             => exbibyte => 1024 => zebibyte => 1024 => 'yobibyte',
# ],
;

subset ValidUnitSet of Str where any <>;

my %Units = time => (
        <second> => 60, <minute> => 60, <hour> => 24, <day> => 7, <week>
);

sub denominate is export (
    ValidUnitSet :$set = 'time',
    Bool :$hash   = False,
    Bool :$list   = False,
    Bool :$string = True,
         :@units  = %Units{ $set },
)
