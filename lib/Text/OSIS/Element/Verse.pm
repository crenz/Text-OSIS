package Text::OSIS::Element::Verse;

use warnings;
use strict;
use Text::OSIS::Element;

our @ISA = qw(Text::OSIS::Element);

=head1 NAME

Text::OSIS::Element::Verse - Class for OSIS Verse elements

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

sub renderHead {
    my ($self) = @_;
    
    my $id = $self->hierarchyId();
    my $content = $self->content();
    
    return "                <verse osisID=\"$id\" sID=\"$id\" />$content";
}

sub renderTail {
    my ($self) = @_;
    
    my $id = $self->hierarchyId();

    return "<verse eID=\"$id\" />\n";
}


1; # End of Text::OSIS::Verse
