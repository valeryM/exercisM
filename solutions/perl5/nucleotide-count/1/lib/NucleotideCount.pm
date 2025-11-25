package NucleotideCount;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<count_nucleotides>;

sub count_nucleotides ($strand) {
    # 'A' for adenine, 'C' for cytosine, 'G' for guanine, and 'T' for thymine.
    # string en entrée
    # hash en sortie avec le comptage des éléments
    my %result = ("A" => 0, "C" => 0, "G" => 0, "T" => 0);
    # Valider la chaine : ne doit contenir que des A C G T
    # sortie de type die("Invalid nucleotide in strand")
    if ($strand ne "") {
        my $cntrl = ($strand =~ /^[ACGT]+$/) or die("Invalid nucleotide in strand");
                
        # Comptage du nombre d'éléments
        my $cptA = ($strand =~ tr/A/ /);
        my $cptC = ($strand =~ tr/C/ /);
        my $cptG = ($strand =~ tr/G/ /);
        my $cptT = ($strand =~ tr/T/ /);
        %result = ("A" => $cptA, "C" => $cptC, "G" => $cptG, "T" => $cptT);
    } 
    return \%result;
}

1;
