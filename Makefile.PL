use 5.008;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Net::Dynect::REST',
    VERSION	      => '0.05',
    PREREQ_PM         =>  { 'LWP::UserAgent' => 0, 'JSON' => 0}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/Net/Dynect/REST.pm', # retrieve abstract from module
       AUTHOR         => 'James Bromberger <james@rcpt.to>') : ()),
);
