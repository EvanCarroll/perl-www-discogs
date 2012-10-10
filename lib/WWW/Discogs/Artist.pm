package WWW::Discogs::Artist;

use strict;
use warnings;

use Moose;
with 'WWW::Discogs::Roles::HasMedia';

use Carp qw(carp);

use namespace::autoclean;

has [qw/name realname profile uri/] => (
	isa => 'Str'
	, is => 'ro'
	, default => ''
);

has [qw/aliases namevariations urls/] => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub {+[]}
	, auto_deref => 1
);

has '_releases' => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub {+[]}
	, init_arg => 'releases'
);

has 'params' => ( isa => 'HashRef', is => 'ro', default => sub { +{} } );

sub releases {
    my $self = shift;
    unless ($self->{params}->{releases}) {
        carp "No releases fetched for artist '" . $self->name .
            "'. Call 'artist' method with releases => 1 param."
    }

    return @{ $self->_releases };
}

__PACKAGE__->meta->make_immutable;
