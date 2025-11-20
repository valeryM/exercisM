package HighScoreBoard;

use v5.40;

our %Scores;

sub set_player_scores (%new_scores) {
    foreach my$key (keys(%new_scores)) {
            # add / replace value
            $Scores{$key} = $new_scores{$key};
    }
    return;
}

sub get_player_score ($player) {
    return $Scores{$player};
}

sub increase_player_scores (%additional_scores) {
    foreach my$key (keys(%additional_scores)) {
            # add / replace value
            $Scores{$key} += $additional_scores{$key};
    }
    return;
}

sub sort_players_by_name {
    sort keys %Scores;
}

sub sort_players_by_score {
    reverse sort { $Scores{$a} <=> $Scores{$b} } keys %Scores;
}

sub delete_player ($player) {
    delete $Scores{$player}
}

1;
