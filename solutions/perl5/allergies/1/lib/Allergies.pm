package Allergies;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

my %alergies = (
    1 => "eggs",
    2 => "peanuts",
    4 => "shellfish",
    8 => "strawberries",
    16 => "tomatoes",
    32 => "chocolate",
    64 => "pollen",
    128 => "cats"
);
my $somme_ponderation = 255;

sub allergic_to($item, $score) {    
    while($score>$somme_ponderation) {
        $score -= ($somme_ponderation+1);
    }
    my @liste;
    my @inverted_keys = reverse sort{$a<=>$b}(keys %alergies);
    foreach my $valeur (@inverted_keys) {
        if ($score >= $valeur) {
            $score = $score - $valeur;
            if ($score >=0) {
                if ($item eq $alergies{$valeur}) {
                    return true;
                }
            }
        }
    }
    return false;
}

sub list_allergies ($score) {
    while($score>$somme_ponderation) {
        $score -= ($somme_ponderation+1);
    }
    my @allergies;
    my @ponderation_allergene_keys = reverse sort{$a<=>$b}(keys %alergies);
    foreach my $ponderation (@ponderation_allergene_keys) {
        if ($score >= $ponderation) {
            $score -= $ponderation;

            if ($score >= 0) {
                push @allergies, $alergies{$ponderation};
            }
        }
    }
    return \@allergies;
}

1;
