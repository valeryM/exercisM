package BookingUpForBeauty;

use v5.40;

# Suggested datetime modules you can use:
#use Time::Piece;
use DateTime::Tiny;
use DateTime;

# Recommended, commented out for portability.
#use Const::Fast;

use Exporter ('import');
our @EXPORT_OK = ('appointment_has_passed', 'is_afternoon_appointment', 'describe_appointment');

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';
#const $STRPTIME_FORMAT => $STRPTIME_FORMAT;

# Private subroutines conventionally start with an underscore.
# It isn't necessary, but provided for convenience.
sub _parse_datetime ($date_string) {
    return DateTime::Tiny->from_string($date_string);    
}

sub appointment_has_passed ($date_string) {
    my $t = DateTime::Tiny->now();
    my $dateTime = _parse_datetime($date_string);
    return (DateTime->compare($dateTime->DateTime(), $t->DateTime()) <=0);
}

sub is_afternoon_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    return ($time->hour() >=12 && $time->hour()<18);
}

sub _to12h($time) {
 return (12, "AM") if $time==0;
 return ($time, "AM") if $time<=12;
 return ($time-12, "PM") 
}

sub describe_appointment ($date_string) {
    my $time = _parse_datetime($date_string);
    my ($hour,$journey) = _to12h($time->hour());
    return sprintf('You have an appointment on %02d/%02d/%04d %d:%02d %s', $time->month(), $time->day(), $time->year(), $hour, $time->minute(), $journey);
}

1;
