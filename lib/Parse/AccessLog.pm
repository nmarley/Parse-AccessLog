package Parse::AccessLog;

use 5.006;
use strict;
use warnings;
use feature qw(say);
use File::Slurp;

=head1 NAME

Parse::AccessLog - Parse Nginx/Apache access logs in "combined" format.

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

    use Parse::AccessLog;

    my $p = Parse::AccessLog->new();

    $p->parse;
# remote_addr remote_user time_local request status bytes_sent referer user_agent

    ...

=head1 SUBROUTINES/METHODS

=head2 new

=cut

sub new {
    my $class = shift;
    my $self = {};

    return bless $self, $class;
}

=head2 parse

=cut

sub parse {
    # don't parse anything in void context
    return unless defined wantarray;

    my $self = shift;
    my $class   = ref($self) || $self;

    # output determined by input data

    # array
    if ( 0 < $#_) {
        return map { $self->parse($_) } @_;
    }

    my $line = shift;
    chomp $line;

    if ( -f $line ) {
        my $filename = $line;
        chomp(my @lines = read_file( $filename ));
        return map { $self->parse($_) } @lines;
    }

    my $hr;

    if ( $line =~ /^ (\S+)         # remote_addr
                   \ \-\ (\S+)     # remote_user
                   \ \[([^\]]+)\]  # time_local
                   \ "(.*?)"       # request
                   \ (\d+)         # status
                   \ (\-|(?:\d+))  # bytes_sent
                   \ "(.*?)"       # referer
                   \ "(.*?)"       # user_agent
                   $ /x ) {

        my @fields = qw(remote_addr remote_user time_local request
                        status bytes_sent referer user_agent);
        my $c = 0;
        {   no strict 'refs';
            for ( @fields ) {
                $hr->{ $_ } = ${ ++$c };
            }
        };
    }

    return $hr;
}

=head1 AUTHOR

Nathan Marley, C<< <nathan.marley at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-parse-accesslog at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Parse-AccessLog>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Parse::AccessLog


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Parse-AccessLog>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Parse-AccessLog>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Parse-AccessLog>

=item * Search CPAN

L<http://search.cpan.org/dist/Parse-AccessLog/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2013 Nathan Marley.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1;

