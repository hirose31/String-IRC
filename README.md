<div>
    <a href="https://travis-ci.org/hirose31/String-IRC"><img src="https://travis-ci.org/hirose31/String-IRC.png?branch=master" alt="Build Status" /></a>
    <a href="https://coveralls.io/r/hirose31/String-IRC?branch=master"><img src="https://coveralls.io/repos/hirose31/String-IRC/badge.png?branch=master" alt="Coverage Status" /></a>
</div>

# NAME

String::IRC - add color codes for mIRC compatible client

# SYNOPSIS

    use String::IRC;

    my $si1 = String::IRC->new('hello');
    $si1->red->underline;
    my $si2 = String::IRC->new('world')->yellow('green')->bold;
    my $msg = "$si1, $si2!";

# DESCRIPTION

String::IRC can be used to add color or decoration code to string.

# METHODS

## new

    $si = String::IRC->new('I love YAKINIKU.');

This method constructs a new "String::IRC" instance and returns
it.

## COLOR

    $si->COLOR([BG_COLOR]);

Add color code and return String::IRC object. BG\_COLOR is
optional. Available COLOR and BC\_COLOR are as follows.

    white
    black
    blue navy
    green
    red
    brown maroon
    purple
    orange olive
    yellow
    lightt_green lime
    teal
    light_cyan cyan aqua
    light_blue royal
    pink light_purple fuchsia
    grey
    light_grey silver

## bold

    $si->bold;

Add bold code and return String::IRC object.

## underline

    $si->underline;

Add underline code and return String::IRC object.

## inverse

    $si->inverse;

Add inverse code and return String::IRC object.

## stringify

    $si->stringify;

Return string which is added color or decoration code.

String::IRC calls this method implicitly by context. You may call it
explicitly.

# AUTHOR

HIROSE Masaaki <hirose31@gmail.com>

# REPOSITORY

[https://github.com/hirose31/String-IRC](https://github.com/hirose31/String-IRC)

    git clone https://github.com/hirose31/String-IRC.git

patches and collaborators are welcome.

# SEE ALSO

[http://www.mirc.co.uk/help/color.txt](http://www.mirc.co.uk/help/color.txt)

# COPYRIGHT

Copyright HIROSE Masaaki

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
