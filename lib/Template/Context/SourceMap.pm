package Template::Context::SourceMap;
use 5.008005;
use strict;
use warnings;
use parent qw(Template::Context);

use HTML::Entities qw(encode_entities);
use Scalar::Util qw(blessed);

our $VERSION = "0.01";

sub process {
  my ($self, $template, $args, $localize) = @_;
  my $template_name = blessed($template) && $template->isa('Template::Document') ? $template->name : $template;
  my $processed = $self->SUPER::process($template, $args, $localize);
  my $output = "";
  $output .= sprintf "<!-- BEGIN %s -->\n", encode_entities($template_name);
  $output .= $processed;
  $output .= sprintf "<!-- END %s -->", encode_entities($template_name);

  $output;
}

1;
__END__

=encoding utf-8

=head1 NAME

Template::Context::SourceMap - It's new $module

=head1 SYNOPSIS

    use Template::Config;
    use Template::Context::SourceMap;

    $Template::Config::CONTEXT = 'Template::Context::SourceMap';

=head1 DESCRIPTION

Template::Context::SourceMap is ...

=head1 LICENSE

Copyright (C) aereal.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

aereal E<lt>aereal@aereal.orgE<gt>

=cut

