package Text::OSIS::Element::Chapter;

use warnings;
use strict;
use Text::OSIS::Element;
use Text::OSIS::Element::Verse;
use Text::OSIS::Element::Section;
use Text::OSIS::Element::Paragraph;

our @ISA = qw(Text::OSIS::Element);

=head1 NAME

Text::OSIS::Element::Chapter - Class for OSIS Chapter elements

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

sub addVerse {
    my ($self, $verseNo, $text) = @_;

    return $self->add(Text::OSIS::Element::Verse->new(
        id => $verseNo, content => $text));
}

sub addSection {
    my ($self, $text) = @_;

    return $self->add(Text::OSIS::Element::Section->new(
        name => $text));
}

sub addParagraph {
    my ($self, $text) = @_;

    return $self->add(Text::OSIS::Element::Paragraph->new());
}

sub titleType {
    return 'chapter';
}

sub renderHeadTag {
    my ($self) = @_;

    my $id = $self->hierarchyId();
    
    return <<EOT;   
            <chapter osisID="$id">
EOT
}

sub renderTitle {
    my ($self) = @_;

    my $name = $self->name();
    return '' unless defined $name && $name;
    
    my $type = $self->titleType();
    
    return <<EOT;
                <title type="$type">$name</title>
EOT
}

sub renderHead {
    my ($self) = @_;
    
    return $self->renderHeadTag() . $self->renderTitle();
}

sub renderTail {
    my ($self) = @_;
    
    return <<EOT;   
            </chapter>
EOT
}


1; # End of Text::OSIS
