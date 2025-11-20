package Accumulate;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate ( $list, $func ) {
    my @result;
    foreach my $value (@$list) {
        push( @result, &$func($value));
    }
    return \@result;
}

1;
