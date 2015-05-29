# -*- mode: cperl; -*-
use Test::Base;
use String::IRC;

plan tests => 1 * blocks;

run {
    my $block = shift;
    my $x = String::IRC->new( $block->input );

    my $method = $block->name;
    $x->$method();

    is "$x", $block->expect, $block->name;
};

__END__
=== red
--- input:  hello
--- expect: 4hello
=== blue
--- input:  hello
--- expect: 2hello
=== light_purple
--- input:  hello
--- expect: 13hello
=== red
--- input:
--- expect: 4
