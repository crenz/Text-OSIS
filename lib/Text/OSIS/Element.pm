package Text::OSIS::Element;

use warnings;
use strict;

=head1 NAME

Text::OSIS::Element - Superclass for OSIS Elements

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

    $self->{NAME} = $opts{name} || '';
    $self->{ID} = $opts{id} || '';
    $self->{CONTENT} = $opts{content} || '';
    $self->{SUBELEMENTS} = [];

    bless $self, $class;
}

sub name {
    my ($self) = @_;

    return $self->{NAME};
}

sub id {
    my ($self) = @_;

    return $self->{ID};
}

sub hierarchyId {
    my ($self) = @_;
    
    my $id = $self->id();
    
    return $id unless (my $p = $self->parent());
    
    if (defined $id && $id) {
        $id = ".$id";
    } else {
        $id = "";
    }
    
    return $p->hierarchyId . $id;
}

sub content {
    my ($self) = @_;

    return $self->{CONTENT};
}

sub subelements {
    my ($self) = @_;

    return @{$self->{SUBELEMENTS}};
}

sub parent {
    my ($self) = @_;

    return $self->{PARENT};
}

sub add {
    my ($self, $element) = @_;
    
    $element->{PARENT} = $self;
    push @{$self->{SUBELEMENTS}}, $element;
    
    return $element;
}

sub render {
    my ($self) = @_;

    # For this default element, just render sub elements
    return 
        $self->renderHead() .
        $self->renderSubElements() .
        $self->renderTail();
}

sub renderHead {
    my ($self) = @_;
    
    return $self->content();
}

sub renderTail {
    my ($self) = @_;
    
    return '';
}

sub renderSubElements {
    my ($self) = @_;
    my $output = '';
    
    foreach ($self->subelements()) {
        $output .= $_->render();
    }
    
    return $output;
}


1; # End of Text::OSIS
