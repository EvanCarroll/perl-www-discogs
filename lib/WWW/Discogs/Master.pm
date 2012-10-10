package WWW::Discogs::Master;

use strict;
use warnings;

use Moose;
with 'WWW::Discogs::Roles::ReleaseBase';

use namespace::autoclean;

has 'main_release' => (
	isa => 'Str'
	, is => 'ro'
	, default => ''
);

has 'versions' => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub { +[] }
	, auto_deref => 1
);

__PACKAGE__->meta->make_immutable;
