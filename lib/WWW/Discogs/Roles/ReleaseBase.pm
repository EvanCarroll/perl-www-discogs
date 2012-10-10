package WWW::Discogs::Roles::ReleaseBase;

use strict;
use warnings;

use Moose::Role;
with 'WWW::Discogs::Roles::HasMedia';

use namespace::autoclean;

## XXX _params and _uri had no public (non-underscore accessor in v0.13)
## perhaps they're deprecated?

has [qw/ id year notes _uri /] => ( isa => 'Maybe[Str]', is => 'ro', default => '' );

has [qw/styles genres artists extraartists tracklist/] => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub { +[] }
	, auto_deref => 1
);

has '_params' => ( isa => 'HashRef', is => 'ro', default => sub { +{} } );

1;
