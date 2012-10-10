package WWW::Discogs::Roles::HasMedia;

use strict;
use warnings;

use Moose::Role;

has "videos" => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub { +[] }
	, auto_deref => 1
);
	
has "_images" => (
	isa => 'ArrayRef'
	, is => 'ro'
	, default => sub { +[] }
	, init_arg => 'images'
);


sub images {
    my ($self, %args) = @_;
    my $image_type = $args{type};

    if ($image_type) {
        return grep { $_->{type} =~ /^${image_type}$/i } @{$self->_images};
    }

    return @{ $self->_images };
}

1;
