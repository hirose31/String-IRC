package String::IRC;

use strict;
use warnings;
use 5.008_005;
use utf8;

our $VERSION = '0.05';

use overload (
    q{""}    => 'stringify',
    fallback => 'stringify',
   );

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;

    $self->{string} = defined $_[0] ? shift : "";

    return $self;
}

sub _add_code_l {
    my ($self, $code) = @_;
    $self->{string} = $code . $self->{string};
    return $self;
}

my %color_table = (
    0  => [qw(white)],
    1  => [qw(black)],
    2  => [qw(blue         navy)],
    3  => [qw(green)],
    4  => [qw(red)],
    5  => [qw(brown        maroon)],
    6  => [qw(purple)],
    7  => [qw(orange       olive)],
    8  => [qw(yellow)],
    9  => [qw(light_green lime)],
    10 => [qw(teal)],
    11 => [qw(light_cyan   cyan aqua)],
    12 => [qw(light_blue   royal)],
    13 => [qw(pink         light_purple  fuchsia)],
    14 => [qw(grey)],
    15 => [qw(light_grey   silver)],
   );
my %color_name_table;
{
    ## no critic
    no strict 'refs';
    while (my ($code, $colors) = each %color_table) {
        for my $color (@$colors) {
            $color_name_table{ $color } = $code;

            *{__PACKAGE__.'::'.$color} = sub {
                my $color_code = "";
                if ($_[1] && exists $color_name_table{ $_[1] }) {
                    $color_code .= sprintf "%02d,%02d", $code, $color_name_table{ $_[1] };
                } else {
                    $color_code .= sprintf "%02d",      $code;
                }
                $_[0]->_add_code_l("$color_code");
            };
        }
    }
}

sub bold      { $_[0]->_add_code_l(""); }
sub underline { $_[0]->_add_code_l(""); }
sub inverse   { $_[0]->_add_code_l(""); }

sub stringify { $_[0]->{string} . ""; }

1;

__END__

=encoding utf8

=begin html

<a href="https://travis-ci.org/hirose31/String-IRC"><img src="https://travis-ci.org/hirose31/String-IRC.png?branch=master" alt="Build Status" /></a>
<a href="https://coveralls.io/r/hirose31/String-IRC?branch=master"><img src="https://coveralls.io/repos/hirose31/String-IRC/badge.png?branch=master" alt="Coverage Status" /></a>

=end html

=head1 NAME

String::IRC - add color codes for mIRC compatible client

=begin readme

=head1 INSTALLATION

To install this module, run the following commands:

    perl Build.PL
    ./Build
    ./Build test
    ./Build install

=end readme

=head1 SYNOPSIS

    use String::IRC;

    my $si1 = String::IRC->new('hello');
    $si1->red->underline;
    my $si2 = String::IRC->new('world')->yellow('green')->bold;
    my $msg = "$si1, $si2!";

=head1 DESCRIPTION

String::IRC can be used to add color or decoration code to string.

=head1 METHODS

=head2 new

  $si = String::IRC->new('I love YAKINIKU.');

This method constructs a new "String::IRC" instance and returns
it.

=head2 COLOR

  $si->COLOR([BG_COLOR]);

Add color code and return String::IRC object. BG_COLOR is
optional. Available COLOR and BC_COLOR are as follows.

  white
  black
  blue navy
  green
  red
  brown maroon
  purple
  orange olive
  yellow
  light_green lime
  teal
  light_cyan cyan aqua
  light_blue royal
  pink light_purple fuchsia
  grey
  light_grey silver

=head2 bold

  $si->bold;

Add bold code and return String::IRC object.

=head2 underline

  $si->underline;

Add underline code and return String::IRC object.

=head2 inverse

  $si->inverse;

Add inverse code and return String::IRC object.

=head2 stringify

  $si->stringify;

Return string which is added color or decoration code.

String::IRC calls this method implicitly by context. You may call it
explicitly.

=head1 AUTHOR

HIROSE Masaaki E<lt>hirose31@gmail.comE<gt>

=head1 REPOSITORY

L<https://github.com/hirose31/String-IRC>

    git clone https://github.com/hirose31/String-IRC.git

patches and collaborators are welcome.

=head1 SEE ALSO

L<http://www.mirc.co.uk/help/color.txt>

=head1 COPYRIGHT

Copyright HIROSE Masaaki

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

# for Emacsen
# Local Variables:
# mode: cperl
# cperl-indent-level: 4
# cperl-close-paren-offset: -4
# cperl-indent-parens-as-block: t
# indent-tabs-mode: nil
# coding: utf-8
# End:

# vi: set ts=4 sw=4 sts=0 et ft=perl fenc=utf-8 ff=unix :
