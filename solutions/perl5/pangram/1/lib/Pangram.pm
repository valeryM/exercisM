package Pangram;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_pangram>;

my @chars = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);

sub is_pangram ($text) {
    if ($text eq "") {return 0};
    $text = lc($text);
    foreach my $char (@chars) {
        if (index($text, $char) == -1) {
            return 0;
        }
    }
    return 1;
}

1;
