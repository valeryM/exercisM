package Yacht;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<score>;

use Yacht::Category;

sub score ( $dice, $category ) {
    my $score = 0;
    if ($category == $Yacht::Category::ONES 
        || $category == $Yacht::Category::TWOS
        || $category == $Yacht::Category::THREES
        || $category == $Yacht::Category::FOURS 
        || $category == $Yacht::Category::FIVES
        || $category == $Yacht::Category::SIXES ) {
        $score = one_face($dice, $category);
    }
    if ($category == $Yacht::Category::FOUR_OF_A_KIND) {
        $score = square($dice);
    }
    if ($category == $Yacht::Category::LITTLE_STRAIGHT ) {
        $score = little_straight($dice);
    }
    if ($category == $Yacht::Category::BIG_STRAIGHT) {
        $score = big_straight($dice);
    }
    if ($category == $Yacht::Category::YACHT ) {
        $score = yacht($dice);
    }
    if ($category == $Yacht::Category::FULL_HOUSE ) {
        $score = full_house($dice);
    }
    if ($category == $Yacht::Category::CHOICE ) {
        $score = choice($dice);
    }
    return $score;
}

sub one_face($dice, $side) {
    my $count = 0;
    
    foreach my $de (@$dice) {
        if ($de == $side) {
            $count += $side;
        }
    }
    return $count;
}

sub sum($dice) {
    my $score = 0;
    for my $de (@$dice) {

        $score += $de;
    }
    return $score;
}

sub little_straight($dice) {
    if (sum($dice) == 15) { return 30;}
    return 0;
}
sub big_straight($dice) {
    if (sum($dice) == 20) { return 30;}
    return 0;
}

sub choice($dice) {
    my $score = sum($dice);
    if ($score != 15 && $score !=30) { return $score;}
    return 0;
}
sub full_house($dice) {
    my %groupDice;
    my $score = 0 ;
    for my $de (@$dice) {
        $groupDice{$de}+=1;
        $score += $de;
    }

    if ( scalar(keys %groupDice) != 2 
        || ( (values %groupDice)[0] != 2 && (values %groupDice)[0] != 3 )) {
        return 0;
    }
    return $score;
}

sub square($dice) {
    my %groupDice;
    my $score = 0 ;
    for my $de (@$dice) {
        $groupDice{$de}+=1;
    }

    if ( scalar(keys %groupDice) > 2 
        || ( (values %groupDice)[0] < 4 && (values %groupDice)[0] >1 )) {
        return 0;
    }
    my @cles = (keys %groupDice);
    if ((values %groupDice)[0] >= 4 ) { $score = 4*$cles[0];}
    if ((values %groupDice)[1] >= 4 ) { $score = 4*$cles[1];}

    return $score;
}

sub yacht($dice) {
    my %groupDice;
    my $score = 0 ;
    for my $de (@$dice) {
        $groupDice{$de}+=1;
    }

    if ( scalar(keys %groupDice) != 1 ) {
        return 0;
    }
    my @cles = (keys %groupDice);
    return 50;
}
1;
