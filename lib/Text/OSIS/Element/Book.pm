package Text::OSIS::Element::Book;

use warnings;
use strict;
use Text::OSIS::Element;
use Text::OSIS::Element::Chapter;

our @ISA = qw(Text::OSIS::Element);

=head1 NAME

Text::OSIS::Element::Book - Class for OSIS Book elements

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

sub addChapter {
    my ($self, $chapterNo, $text) = @_;

    return $self->add(Text::OSIS::Element::Chapter->new(id => $chapterNo, name => $text));
}

sub hierarchyId {
    my ($self) = @_;
    
    return $self->id();
}

sub renderHead {
    my ($self) = @_;
    my $id = $self->id();

    return <<EOT;   
        <div type="book" osisID="$id" canonical="true">
EOT
}

sub renderTail {
    my ($self) = @_;
    
    return <<EOT;   
        </div>
EOT
}


1; # End of Text::OSIS
