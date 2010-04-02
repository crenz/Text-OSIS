use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Text::OSIS',
    AUTHOR              => q{Christian Renz <crenz@web42.com>},
    VERSION_FROM        => 'lib/Text/OSIS.pm',
    ABSTRACT_FROM       => 'lib/Text/OSIS.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Text-OSIS-*' },
);
