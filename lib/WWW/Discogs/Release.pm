package WWW::Discogs::Release;

use strict;
use warnings;

use Moose;
with 'WWW::Discogs::Roles::ReleaseBase';

use namespace::autoclean;

has [qw/title released released_formatted country status master_id/] => (
	isa => 'Str'
	, is => 'ro'
	, default => ''
);

has [qw/formats labels/] => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub { +[] }
	, auto_deref => 1
);

__PACKAGE__->meta->make_immutable;
