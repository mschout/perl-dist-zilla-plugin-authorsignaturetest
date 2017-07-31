#
# This file is part of Dist-Zilla-Plugin-AuthorSignatureTest
#
# This software is copyright (c) 2017 by Michael Schout.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Dist::Zilla::Plugin::AuthorSignatureTest;
$Dist::Zilla::Plugin::AuthorSignatureTest::VERSION = '0.02';
# ABSTRACT: An Author Distribution C<SIGNATURE> Test for L<Dist::Zilla>

use strict;
use warnings;

use Moose;

extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::PrereqSource';


sub register_prereqs {
    my $self = shift;

    $self->zilla->register_prereqs(
        { type => 'requires', phase => 'develop' },
        'Test::Signature' => 0);
}

__PACKAGE__->meta->make_immutable;

=pod

=head1 NAME

Dist::Zilla::Plugin::AuthorSignatureTest - An Author Distribution C<SIGNATURE> Test for L<Dist::Zilla>

=head1 VERSION

version 0.02

=head1 DESCRIPTION

This is an extensionof L<Dist::Zilla::Plugin::InlineFile>, providing the
following files:

   xt/author/signature.t - a standard Test::Signature test

This test uses L<Test::Signature> to test the SIGNATURE file in your dist.  If
L<Test::Signature> is not installed, the test is skipped.

=for Pod::Coverage register_prereqs

=head1 SOURCE

The development version is on github at L<https://github.com/mschout/perl-dist-zilla-plugin-authorsignaturetest>
and may be cloned from L<git://github.com/mschout/perl-dist-zilla-plugin-authorsignaturetest.git>

=head1 BUGS

Please report any bugs or feature requests to bug-dist-zilla-plugin-authorsignaturetest@rt.cpan.org or through the web interface at:
 http://rt.cpan.org/Public/Dist/Display.html?Name=Dist-Zilla-Plugin-AuthorSignatureTest

=head1 AUTHOR

Michael Schout <mschout@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by Michael Schout.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

__DATA__

__[ xt/author/signature.t ]__
#!perl -w
# This file was automatically generated by Dist::Zilla::Plugin::AuthorSignatureTest

use strict;
use warnings;
use Test::More;

unless (eval { require Test::Signature; 1 }) {
    plan skip_all => 'Test::Signature is required for this test';
}

Test::Signature::signature_ok();
done_testing;
