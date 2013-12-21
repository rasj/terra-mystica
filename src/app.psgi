#!/usr/bin/perl
# -*- mode: perl -*-

BEGIN {
    use File::Basename;
    push @INC, dirname $0;
}

use CGI::PSGI;

use Server::AppendGame;
use Server::ViewGame;

my %paths = (
   '/view-game/' => sub {
       Server::ViewGame->new()
    },
   '/append-game/' => sub {
       Server::AppendGame->new()
    },
);

my $app = sub {
    my $env = shift;
    my $q = CGI::PSGI->new($env);

    my $path_info = $q->path_info();
    my $handler = $paths{$path_info};

    if ($handler) {
        my $app = $handler->();
        $app->handle($q);
        return $app->output_psgi();
    } else {
        die "Unknown module '$path_info'";
    }
};
