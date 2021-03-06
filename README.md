# Parse-AccessLog

Parse Nginx/Apache access logs in "combined" format. Parses web server logs
created by Apache/nginx in combined format. Assumes no knowledge of the server
which creates the log entries. Does not perform any validation (i.e. IP
address, etc). This module only parses log files (and attempts to do that
well).

Version 0.01

## Installation

To install this module, run the following commands:

    perl Makefile.PL
    make
    make test
    make install

## Support and Documentation

After installing, you can find documentation for this module with the
perldoc command.

    perldoc Parse::AccessLog

### See also:

  https://github.com/nmarley/Parse-AccessLog

## License

Released under the MIT License.  See the [LICENSE][] file for further details.

[license]: LICENSE
