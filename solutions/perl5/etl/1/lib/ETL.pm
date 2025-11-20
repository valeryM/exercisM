package ETL;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<transform>;

sub transform ($data) {
    my %values;
    my %result = ();
    my %input = %$data;
    my %test = %{$data};
    my @keys = keys %test;
    #say("keys: ",@keys);
    foreach my $point (@keys) {
        #say("\tpoint: ", $point);
        my @letters = @{$data->{$point}};
        #say("\t\tletters: ", @letters);
        foreach my $letter (@letters) {
            $result{lc($letter)} = $point;            
        }
    }
    my %finalResult;
    foreach my $key (sort {lc $a cmp lc $b} keys %result) {
        $finalResult{$key} = $result{$key};
        #say("$key -> $result{$key}");
    }
    return {%finalResult};
}

1;
