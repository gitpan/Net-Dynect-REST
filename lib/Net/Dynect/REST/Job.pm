package Net::Dynect::REST::Job;
# $Id: Job.pm 149 2010-09-26 01:33:15Z james $
use strict;
use warnings;
use Carp;
use Net::Dynect::REST::RData;
our $VERSION = do { my @r = (q$Revision: 149 $ =~ /\d+/g); sprintf "%d."."%03d" x $#r, @r };

=head1 NAME 

Net::Dynect::REST::Job - Get the status of a job

=head1 SYNOPSIS

  use Net::Dynect::REST:Job;
  my @records = Net::Dynect::REST:Job->find(connection => $dynect, id => $id);

=head1 METHODS

=head2 Creating

=over 4

=item  Net::Dynect::REST:Job->find(connection => $dynect, id => $id);

This will return the Net::Dynect::REST::Response object for the specified job. 
Note that the "Requested" date on the response will show the requets of the "Job" 
call, but but the jobID returned in the response will matcht he one you supplied 
of the original request. So if you repeatedly ask for the same Job, the request 
date will continue to increment - all other data is as when the job completed.

=cut

sub find {
    my $proto = shift;
    my %args  = @_;
    if (
        not( defined( $args{connection} )
            && ref( $args{connection} ) eq "Net::Dynect::REST" )
      )
    {
        carp "Need a connection (Net::Dynect::REST)";
        return;
    }
    if ( not defined $args{id} ) {
        carp "Need a Job ID (id) to look for";
        return;
    }

    my $request = Net::Dynect::REST::Request->new(
        operation => 'read',
        service   => sprintf( "%s/%s", __PACKAGE__->_service_base_uri, $args{id} )
    );
    if ( not $request ) {
        carp "Request not valid: $request";
        return;
    }

    my $response = $args{connection}->execute($request);
    return $response;
    print "Job response was: " . $response . "\n";
}


sub _service_base_uri {
  return "Job";
}

1;

=back

=head1 AUTHOR

James Bromberger, james@rcpt.to

=head1 SEE ALSO

L<Net::Dynect::REST>, L<Net::Dynect::REST::Request>, L<Net::Dynect::REST::Response>, L<Net::Dynect::REST::info>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2010 by James Bromberger

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.10.1 or,
at your option, any later version of Perl 5 you may have available.

=cut
