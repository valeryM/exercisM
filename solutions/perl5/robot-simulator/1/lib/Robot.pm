use v5.40;
use experimental qw<class>;

class Robot;

field $x :reader :param;
field $y :reader :param;
field $direction :reader :param;

method avance() {
    if ($direction eq "north") {
        $y++;
    } elsif ($direction eq "south") {
        $y--;
    } elsif ($direction eq "west") {
        $x--;
    } else {
        $x++;
    }
}

method turn($dir) {
    if ($direction eq "north") {
        $direction = $dir eq "L" ? "west" : "east";
    } elsif ($direction eq "south") {
        $direction = $dir eq "L" ? "east" : "west";
    } elsif ($direction eq "west") {
        $direction = $dir eq "L" ? "south" : "north";
    } else {
        $direction = $dir eq "L" ? "north" : "south";
    }
}
method enact ($instructions) {
    #parcourir chaque instruction
    foreach my $car (split(//, $instructions)) {
        if ($car eq "A") {
            $self->avance();
        } else {
            $self->turn($car);
        }
    }
    
    return $self;
}

1;
