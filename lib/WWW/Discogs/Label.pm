package WWW::Discogs::Label;

use strict;
use warnings;

use Moose;
with 'WWW::Discogs::Roles::HasMedia';

use Carp qw(carp);

use namespace::autoclean;

has [qw/name contactinfo parentLabel uri/] => ( isa => 'Str', is => 'ro', default => '' );

has 'sublabels' => ( isa => 'ArrayRef', is => 'ro', default => sub { +[] }, auto_deref => 1 );

has '_releases' => ( isa => 'ArrayRef', is => 'ro', default => sub { +[] }, init_arg => 'releases' );

has 'params' => ( isa => 'HashRef', is => 'ro', default => sub { +{} } );

## XXX Deprecate against Moose convention, from 0.13
sub parentlabel { +shift->parentLabel; }

sub releases {
    my $self = shift;
    unless ($self->{params}->{releases}) {
        carp "No releases fetched for label '" . $self->name .
            "'. Call 'label' method with releases => 1 param."
    }

    return @{ $self->_releases };
}

__PACKAGE__->meta->make_immutable;
