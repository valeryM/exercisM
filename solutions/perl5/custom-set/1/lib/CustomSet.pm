use v5.40;
use experimental qw<class>;

class CustomSet;

field $elements :reader :param;

method is_empty () {
    my $size = @$elements;
    return ($size == 0);
}

method contains ($element) {
    my @result = grep(/$element/, @$elements);    
    return @result;
}

method is_subset_of ($other) {
   my $result = true;
   foreach my $value (@$elements) {
       my $cnt = $other->contains($value);
       if ($cnt==0) {$result = false;}
   }
    return $result;
}

method is_disjoint_of ($other) {
    my $cnt = @$elements;
    if ($cnt==0 || $other->is_empty()) {return true;}
    
    my $result = true;
    foreach my $value (@$elements) {
       $cnt = $other->contains($value);
       if ($cnt>0) { $result = false}
    }
   return $result;
}

method getElements() {
    return @$elements;
}
method is_equal_to ($other) {
    my @otherElts = $other->getElements();
    my $cnt = @$elements;
    my @sortedElts = sort{$a<=>$b}@$elements;
    my @sortedOtherElts = sort{$a<=>$b}@otherElts;
    return ( ($cnt==0 && $other->is_empty()) 
        || (join("-", @sortedElts) eq join("-", @sortedOtherElts))
    );
}

method add ($element) {
    if (!$self->contains($element)) {
        push(@$elements, $element);
    }
    return $self;
}

method intersection ($other) {
    my %original = ();
    my @isect = ();
    map { $original{$_} = 1 } @$elements;
    @isect = grep { $original{$_} } $other->getElements();
    my $new = CustomSet->new( elements => \@isect);
    return $new;
}

method difference ($other) {
    my %second = map {$_=>1} $other->getElements();
    my @only_in_first = grep { !$second{$_} } @$elements; 
    my $new = CustomSet->new( elements => \@only_in_first);
    return $new;
}

method union ($other) {
    my (@union, @isect, @diff) = ((), (), ());
    my (%union, %isect);
    my %count = ();
    foreach my $e (@$elements) { $union{$e} = 1 }

    foreach my $e ($other->getElements()) {
        $union{$e} = 1;
    }
    @union = keys %union;
    my $new = CustomSet->new( elements => \@union);
    return $new;
}

1;
