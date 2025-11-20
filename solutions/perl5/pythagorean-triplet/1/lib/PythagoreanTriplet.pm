package PythagoreanTriplet;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<triplets_with_sum>;

sub triplets_with_sum ($sum) {
    my @triplets;
    for my $i (1 .. $sum / 3) { 
        my $j = ($sum * ($sum - 2 * $i)) / (2 * ($sum - $i));
        my $k = $sum - $i - $j;
        if ($j == int($j) && $k > $j > $i) {
            push @triplets, [ $i, $j, $k ];
        }
    }
    return \@triplets;
}

1;
