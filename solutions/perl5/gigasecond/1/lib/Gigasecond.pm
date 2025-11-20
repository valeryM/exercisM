package Gigasecond;

use v5.40;
use DateTime;
use DateTime::Tiny;
use Time::Piece;

use Exporter qw<import>;
our @EXPORT_OK = qw<add_gigasecond>;

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';

sub add_gigasecond ($time) {
    my $t = DateTime::Tiny->now();
    if ($time !~ m/T/) {
        $time .= "T00:00:00";
    }
    my $dateTimeInput = Time::Piece->strptime( $time, $STRPTIME_FORMAT );
    my $date1 = DateTime->new({
        year => $dateTimeInput->year,
        month => $dateTimeInput->mon,
        day => $dateTimeInput->mday,
        hour => $dateTimeInput->hour,
        minute => $dateTimeInput->minute,
        second => $dateTimeInput->second
    });

    my $dateTime = $date1 + DateTime::Duration->new({seconds => 1000000000});
    return (sprintf('%04d-%02d-%02dT%02d:%02d:%02d', $dateTime->year, $dateTime->month, $dateTime->day, $dateTime->hour, $dateTime->minute, $dateTime->second))
}

1;
