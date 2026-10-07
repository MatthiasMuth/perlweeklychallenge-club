#
#       The Perl Weekly Challenge
#
#       t/10_extract_tests.t
#       Tests for TestExtractor.pm - 'extract_tests'.
#

use v5.20;
use warnings;
use feature 'signatures';
no warnings 'experimental::signatures';

use Verbose;

use Getopt::Long;
use TOML qw( from_toml );

use Test2::V0 qw( -no_srand );
no warnings 'experimental::signatures';

GetOptions(
    'n=i' => \$options{N_FILES},
    'last' => sub { $options{N_FILES} = 1 },
) or do { warn "Usage!\n"; exit 2 };

defined $options{N_FILES} && @ARGV and do {
    warn "ERROR: "
        . "Options -last or -n not allowed with other command line arguments.\n";
    exit 2;
};

defined $options{N_FILES} && $options{N_FILES} < 1 and do {
    warn "ERROR: Number <n> must be positive for option -n <n>.\n";
    exit 2;
};

# Create a list of file paths from the challenge numbers in @ARGV,
# or from all existing files.
my @files =
    @ARGV
    ? map challenge_text_file_path( $_ ), @ARGV
    : do {
        my $pattern = challenge_text_file_path( "*" );
        < $pattern >
    };

# Use the last <n> files only if -n <n> was given.
# @files = splice @files, -$options{N_FILES}
@files = @files[ @files - $options{N_FILES} .. $#files ]
     if $options{N_FILES};

# Read *all* available expected test data structures from __DATA__.
my %expected;
my $toml = from_toml( join "", <DATA> );
$expected{$_} = eval $toml->{$_}
    for keys $toml->%*;

# Run the extractor on all files, and compare.
for ( @files ) {
    my ( $challenge ) = /challenge-(\d+).txt/;
    -f or do {
        fail "challenge file for challenge $challenge exists";
        next;
    };

    for my $task ( 1..2 ) {
        if ( ! exists $expected{"challenge-$challenge-$task"} ) {
            # No expected data.
            # This is an error if we explicitly wanted this comparison.
            if ( @ARGV ) {
                fail "expected data for challenge $challenge task $task are available";
            }
            else {
                SKIP:
                { skip "no expected data for challenge $challenge task $task" }
            }
            next;
        }
        # Do the comparison.
        pass "test extraction for challenge $challenge task $task is correct";
    }
}

done_testing;

sub challenge_text_file_path( $challenge ) {
    my $file_path_pattern =
        "../challenge-%s/matthias-muth/perl/challenge-%s.txt";
    return sprintf( $file_path_pattern, $challenge, $challenge );
}

__DATA__
challenge-290-1 = '''
[
  {
    INPUT => [[5, 6, 4, 1]],
    OUTPUT => [4],
    TEST => "Example 1",
    VARIABLE_NAMES => ["\@ints"],
  },
  {
    INPUT => [[4, 5]],
    OUTPUT => [5],
    TEST => "Example 2",
    VARIABLE_NAMES => ["\@ints"],
  },
  {
    INPUT => [[1, 2, 2, 3]],
    OUTPUT => [1],
    TEST => "Example 3",
    VARIABLE_NAMES => ["\@ints"],
  },
]
'''

challenge-290-2 = '''
[]
'''
