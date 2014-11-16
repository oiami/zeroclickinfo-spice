package DDG::Spice::Calculator;

# ABSTRACT: Search for !calc, !calculator and caculator.

use DDG::Spice;

primary_example_queries 'calculator';
description 'Get scientific calculator';
name 'Calculator';
source 'Web2.0calc';
code_url 'https://github.com/duckduckgo/zeroclickinfo-spice/blob/master/lib/DDG/Spice/Calculator.pm';
topics 'everyday', 'math';
category 'software';
attribution github  => ['https://github.com/oiami','oiami'],
            twitter => ['http://twitter.com/oiiyoiyoi','oi pattawan'];


triggers any => 'calculator', 'calc';

spice call_type => 'self';

handle query_lc => sub {
    return $_ eq 'calculator' ? call : ();
};

1;