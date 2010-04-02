package Text::OSIS;

use warnings;
use strict;
use Text::Template;

=head1 NAME

Text::OSIS - The great new Text::OSIS!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Text::OSIS;

    my $foo = Text::OSIS->new();
    ...

=cut

sub new {
    my $class = shift;
    my %opts  = @_;
    my $self  = {};

    $self->{TYPE} = $opts{type} || "bible";
    $self->{NAME} = $opts{name} || return undef;
    $self->{ID} = $opts{id} || return undef;
    $self->{LANG} = $opts{lang} || "en";

    bless $self, $class;
}

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

sub setChapterVerses {
    my ($self, $book, $chapter, $verses) = @_;
    
    $self->{books}->{$book}->{$chapter} = $verses;
}

=head2 output

=cut

sub output {
    my $self = shift;
    
    my $t = '';
    
    foreach my $book (keys %{$self->{books}}) {
        $t .= <<EOT;
        	<div type="book" osisID="$book" canonical="true">
        		<title type="main" short="Matthew">Matthew</title>
EOT

        foreach my $chapter (keys %{$self->{books}->{$book}}) {
            $t .= <<EOT;
        		<chapter osisID="$book.$chapter" n="$chapter">
EOT

            foreach my $verse (1..$#{$self->{books}->{$book}->{$chapter}}) {
                my $vText = $self->{books}->{$book}->{$chapter}->[$verse];
                $t .= <<EOT;
        			<verse sID="$book.$chapter.$verse" osisID="$book.$chapter.$verse" n="$verse"/>$vText<verse eID="$book.$chapter.$verse"/>
EOT
            }


            $t .= <<EOT;
                </chapter>
EOT
        }

        $t .= <<EOT;
            </div>
EOT
    }
    
    $self->{booksExpanded} = $t;

    $t = Text::Template->new(TYPE => 'STRING', SOURCE => <<'EOT');
<?xml version="1.0" encoding="UTF-8"?>
<osis
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns="http://www.bibletechnologies.net/2003/OSIS/namespace"
	xmlns:osis="http://www.bibletechnologies.net/2003/OSIS/namespace"
	xsi:schemaLocation="http://www.bibletechnologies.net/2003/OSIS/namespace http://www.bibletechnologies.net/osisCore.2.1.1.xsd">
	<osisText osisIDWork="{$ID}" osisRefWork="{$TYPE}" xml:lang="{$LANG}" canonical="true">
        <header>
            <work osisWork="{$name}">
                <title>{$NAME}</title>
                <identifier type="OSIS">{$ID}</identifier>
                <language>{$LANG}</language>
            </work>
        </header>
            {$booksExpanded}
	</osisText>
</osis>
EOT

my $commentedOut = <<EOT;
        <div type="bookGroup">
        	<title>New Testament</title>
        </div>
EOT

    return $t->fill_in(HASH => $self);
 
    

}

=head1 AUTHOR

Christian Renz, C<< <crenz at web42.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-text-osis at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text-OSIS>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::OSIS


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text-OSIS>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text-OSIS>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Text-OSIS>

=item * Search CPAN

L<http://search.cpan.org/dist/Text-OSIS/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Christian Renz.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of Text::OSIS
