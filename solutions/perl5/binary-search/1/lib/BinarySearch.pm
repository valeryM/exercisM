package BinarySearch;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ( $array, $value ) {
    my @array_list = @$array;
    # list is empty ? exit
    if (@array_list == 0) { die "value not in array";}
    # list has one element and is the value : return the position
    if (@array_list == 1 && $array_list[0] == $value) { 
        return 0;
    } elsif (@array_list == 1 && $array_list[0] != $value) {
        die "value not in array";
    }
    #first position
    my $left_position = 0;
    #last position
    my $right_position = @array_list-1;
    my $non_trouve = 0;

    my $position_trouve;
    my $ cpt = 0;
    while ($non_trouve==0) {
        say("analyse du tableau de $left_position à $right_position");
        # find the middle position of the list (rounded value in case of pair length)
        my $list_length = ($right_position+1 - $left_position);
        say("longueur du tableau: $list_length");
        my $middle = $left_position+int(($list_length-1)/2); #sprintf("%.0f", ($list_length/2));
        say("position médiane: $middle");
        
        # middle value is the value searched : return the middle position
        if ($array_list[$middle] == $value ) { 
            say("valeur trouvée à la position: $middle");
            $position_trouve = $middle; 
            $non_trouve = 1;
        } elsif ($array_list[$left_position] == $value) {
            say("valeur trouvée à la position: $left_position");
            $position_trouve = $left_position; 
            $non_trouve = 1;
        } elsif ($array_list[$right_position] == $value) {
            say("valeur trouvée à la position: $right_position");
            $position_trouve = $right_position; 
            $non_trouve = 1;
        } elsif($right_position-$left_position == 1) {
            #pas trouvé
            say("value $value not in array");
            $non_trouve = 1;
            die " value not in array";
        }
        # middle value gt value : shift the first part of the array
        if ($array_list[$middle]> $value) {$right_position = $middle; }
        # middle value lt value : shift the second part of the array
        if ($array_list[$middle]< $value) {$left_position = $middle; }
        
        #$cpt++;
        if ($left_position>$right_position ||$cpt>10) { 
            $non_trouve = 1;
        }

    }
    return $position_trouve;
}

1;
