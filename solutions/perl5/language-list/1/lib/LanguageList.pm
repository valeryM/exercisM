package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
    push(@Languages, $language);
}

sub remove_language () {
    pop(@Languages);
}

sub first_language () {
    return $Languages[0];
}

sub last_language () {
    my $idx = @Languages; 
    return $Languages[$idx -1];
}

sub get_languages (@elements) {
    my @result = ();
    foreach my $idx (@elements) {
        push(@result, $Languages[$idx-1] );
    }
    return @result;
}

sub has_language ($language) {
    my @results = grep { /$language/ } @Languages;
    my $count = @results;
    return ($count > 0);
}

1;
