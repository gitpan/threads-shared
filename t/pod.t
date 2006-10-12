use strict;
use warnings;

BEGIN {
    eval {
        require Test::More;
        import Test::More 'tests' => 2;
    };
    if ($@) {
        print("1..0 # Skip: Test::More not available\n");
        exit(0);
    }
}

SKIP: {
    eval 'use Test::Pod 1.26';
    skip('Test::Pod 1.26 required for testing POD', 1) if $@;

    pod_file_ok('blib/lib/threads/shared.pm');
}

SKIP: {
    eval 'use Test::Pod::Coverage 1.08';
    skip('Test::Pod::Coverage 1.08 required for testing POD coverage', 1) if $@;

    pod_coverage_ok('threads::shared',
                    {
                        'trustme' => [
                        ],
                        'private' => [
                            qr/^import$/,
                        ]
                    }
    );
}

# EOF
