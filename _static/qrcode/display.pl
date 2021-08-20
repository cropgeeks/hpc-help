#!/usr/bin/perl

use CGI;
use strict;

print "Content-type: image/png\n\n";

my $cgi_query = CGI->new();
my $token     = $cgi_query->param("token");
my $label     = $cgi_query->param("label");

my $url = "otpauth://totp/$label?secret=$token&issuer=Crop%20Diversity%20HPC";

print `qrencode -o - -s 4 -l H --background=fcfcfc $url`;
