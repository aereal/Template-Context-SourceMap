use strict;
use warnings;

use Template;
use Template::Config;
$Template::Config::CONTEXT = 'Template::Context::SourceMap';

use Test::More;

subtest tt => sub {
  my $tt = Template->new({
    INCLUDE_PATH => 't/data/'
  });
  my $expected = <<EOS;
<!-- BEGIN index.html.tt -->
<h1>Template</h1>
<!-- BEGIN _body.html.tt -->
<p>Body</p>
<!-- END _body.html.tt -->
<!-- END index.html.tt -->
EOS

  chomp $expected;

  my $output = "";
  $tt->process('index.html.tt', +{}, \$output);
  is $output, $expected;
};

done_testing;
