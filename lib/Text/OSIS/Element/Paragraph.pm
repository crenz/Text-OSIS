package Text::OSIS::Element::Paragraph;

use warnings;
use strict;
use Text::OSIS::Element::Chapter;

our @ISA = qw(Text::OSIS::Element::Chapter);

=head1 NAME

Text::OSIS::Element::Paragraph - Class for OSIS Paragraph elements

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

sub isParagraph {
    return 1;
}

sub renderHead {
    my ($self) = @_;

    return <<EOT;   
                <p>
EOT
}

sub renderTail {
    my ($self) = @_;
    
    return <<EOT;   
            </p>
EOT
}


1; # End of Text::OSIS
