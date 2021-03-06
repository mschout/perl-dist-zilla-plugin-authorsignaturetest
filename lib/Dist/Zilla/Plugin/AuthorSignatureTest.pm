# COPYRIGHT
package Dist::Zilla::Plugin::AuthorSignatureTest;

# ABSTRACT: An Author Distribution C<SIGNATURE> Test for L<Dist::Zilla>

use strict;
use warnings;

use Moose;

extends 'Dist::Zilla::Plugin::InlineFiles';
with 'Dist::Zilla::Role::PrereqSource';

=head1 DESCRIPTION

This is an extensionof L<Dist::Zilla::Plugin::InlineFile>, providing the
following files:

   xt/author/signature.t - a standard Test::Signature test

This test uses L<Test::Signature> to test the SIGNATURE file in your dist.  If
L<Test::Signature> is not installed, the test is skipped.

=for Pod::Coverage register_prereqs

=cut

sub register_prereqs {
    my $self = shift;

    $self->zilla->register_prereqs(
        { type => 'requires', phase => 'develop' },
        'Test::Signature' => 0);
}

__PACKAGE__->meta->make_immutable;

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
