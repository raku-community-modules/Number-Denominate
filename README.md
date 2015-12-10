[![Build Status](https://travis-ci.org/zoffixznet/perl6-Number-Denominate.svg)](https://travis-ci.org/zoffixznet/perl6-Number-Denominate)

# NAME

Number::Denominate - break up numbers into arbitrary denominations

# TABLE OF CONTENTS
- [SYNOPSIS](#SYNOPSIS)
- [DESCRIPTION](#DESCRIPTION)
- [EXPORTED SUBROUTINES](#EXPORTED-SUBROUTINES)
    - [`denominate`](#denominate)
        - [Plain Button](#plain-button)
        - [Danger Button](#danger-button)
        - [Go Back Button](#go-back-button)
        - [Notice Me Button](#notice-me-button)
- [REPOSITORY](#REPOSITORY)
- [BUGS](#BUGS)
- [AUTHOR](#AUTHOR)
- [LICENSE](#LICENSE)

# SYNOPSIS

```perl6
    use Number::Denominate;

    # 2 weeks, 6 hours, 56 minutes, and 7 seconds
    say denominate 1234567;

    # 1 day
    say denominate 23*3600 + 54*60 + 50, :1precision;

    # 21 tonnes, 212 kilograms, and 121 grams
    say denominate 21212121, :set<weight>;

    # This script's size is 284 bytes
    say "This script's size is " ~ denominate $*PROGRAM-NAME.IO.s, :set<info>;

    # 4 foos, 2 boors, and 1 ber
    say denominate 449, :units( foo => 3, <bar boors> => 32, 'ber' );

    # {:hours(6), :minutes(56), :seconds(7), :weeks(2)}
    say (denominate 1234567, :hash).perl;

    # [
    #   {:denomination(7),  :plural("weeks"),   :singular("week"),   :value(2) },
    #   {:denomination(24), :plural("days"),    :singular("day"),    :value(0) },
    #   {:denomination(60), :plural("hours"),   :singular("hour"),   :value(6) },
    #   {:denomination(60), :plural("minutes"), :singular("minute"), :value(56)},
    #   {:denomination(1),  :plural("seconds"), :singular("second"), :value(7) }
    #]
    say (denominate 1234567, :array).perl;
```

# DESCRIPTION

Define arbitrary set of units and split up a number into those units. The
module includes preset sets of units for some measures.

# EXPORTED SUBROUTINES

## `denominate`

# REPOSITORY

Fork this module on GitHub:
https://github.com/zoffixznet/perl6-Number-Denominate

# BUGS

To report bugs or request features, please use
https://github.com/zoffixznet/perl6-Number-Denominate/issues

# AUTHOR

Zoffix Znet (http://zoffix.com/)

# LICENSE

You can use and distribute this module under the terms of the
The Artistic License 2.0. See the `LICENSE` file included in this
distribution for complete details.
