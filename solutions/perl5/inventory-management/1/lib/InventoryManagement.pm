package InventoryManagement;

use strict;
use warnings;
use v5.40;

sub create_inventory ($items) {
    my %inventory;
    foreach my $key (@$items) {
        $inventory{$key} += 1;
    }    
    return \%inventory;
}

sub add_items ( $inventory, $items ) {
    my %hash = %$inventory;
    foreach my $key (@$items) {
        $hash{$key} +=1;
    }  
    return \%hash;
}

sub remove_items ( $inventory, $items ) {
    my %hash = %$inventory;
    foreach my $key (@$items) {
        if ($hash{$key} > 0) {
            $hash{$key} +=-1;
        }
    }
    return \%hash;
}

sub delete_item ( $inventory, $item ) {
    my %hash = %$inventory;
    delete %hash{$item};
    return \%hash;
}

1;
