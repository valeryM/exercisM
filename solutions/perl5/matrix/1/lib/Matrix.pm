package Matrix;

use v5.40;

use Exporter qw<import>;
our @EXPORT_OK = qw<extract_row extract_column>;

sub splitFromString($matrix)  {
    my @DD = (
           map
           {
             [
               split( ' ' , $_ )
             ]
           }
           split( '\n' , $matrix )
         );
    return @DD;
}

sub extract_row ( $matrix, $row ) {
    #"1 2\n10 20"
    my @array = splitFromString($matrix);
    #my $cnt = @array;
    #if ($cnt < $row) {return;}
    my @result = $array[$row-1];
    return $result[0];
}

sub extract_column ( $matrix, $column ) {
    # "1 2\n10 20"
    my @result;
    my @array = splitFromString($matrix);
    foreach my $row (@array){
        #my @cols = split(' ', $row);
        push(@result, @$row[$column-1])
    }
    return \@result;
}

1;
