requires 'perl', '5.008001';

requires 'HTML::Entities';
requires 'Template';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

