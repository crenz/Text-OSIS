package Text::OSIS::Element::Section;

use warnings;
use strict;
use Text::OSIS::Element::Chapter;
use Text::OSIS::Element::Verse;

our @ISA = qw(Text::OSIS::Element::Chapter);

=head1 NAME

Text::OSIS::Element::Section - Class for OSIS Section elements

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

sub titleType {
    return 'section';
}

sub renderHeadTag {
    my ($self) = @_;

    return <<EOT;   
                <div type="section">
EOT
}

sub renderTail {
    my ($self) = @_;
    
    return <<EOT;   
            </div>
EOT
}


1; # End of Text::OSIS
