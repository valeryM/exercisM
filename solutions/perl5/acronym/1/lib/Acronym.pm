package Acronym;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
    $phrase =~ s/-/ /g;
    $phrase =~ s/_//g;
    my @mots = split(" ", $phrase);
    my $acronym;
    foreach my $mot (@mots) {
        $acronym .= uc(substr($mot, 0, 1));
    }
    return $acronym;
}

1;
