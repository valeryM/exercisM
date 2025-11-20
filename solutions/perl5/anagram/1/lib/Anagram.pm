package Anagram;
use strict;
use warnings;
use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub _is_anagram($word1, $word2) {
    return 0 if (length $word1 != length $word2 || lc($word1) eq lc($word2));
    my $letters1 = join "", sort split "", lc($word1);
    my $letters2 = join "", sort split "", lc($word2);
    return ($letters1 eq $letters2);
}
sub match_anagrams ( $subject, $candidates ) {
    $subject = lc($subject);
    my @result;
    foreach my $value (@$candidates) {
        push(@result, $value) if (&_is_anagram($value, $subject));
    }
    return \@result;
}

1;
