#!/usr/bin/perl

use Cwd 'abs_path';
use File::Basename;

my $basedir = dirname( abs_path($0) );

my $tplHeader = "$basedir/Class.h";
my $tplCpp = "$basedir/Class.cpp";
my @args;
my $force = 0;
my $verbose = 0;
while($_ = shift) {
	if($_ eq "-f") { $force = 1; }
	elsif($_ eq "-v") { $verbose = 1; }
	else { push @args, $_; }
}
if($#args < 0) {
	die("usage: newclass [-f] <ClassName> [<TargetDir>]");
}

my $className = $args[0];
my $targetDir = abs_path( $#args == 1 ? $args[1] : "." );

if ($verbose) {
	print "verbose: $verbose\n";
	print "force: $force\n";
	print "className: $className\n";
	print "targetDir: $targetDir\n";
}


#print "$targetDir\n";
my $targetCpp = "$targetDir/$className.cpp";
my $targetHeader = "$targetDir/$className.h";

if( -f $targetCpp && !$force ) {
	die("target file $targetCpp exists.");
}
if( -f $targetHeader && !$force ) {
	die("target file $targetHeader exists.");
}

my $header = read_file($tplHeader);
my $cpp = read_file($tplCpp);

my $includeGuard = "armarx_" . basename( $targetDir ) . "_" . $className;

my $userName = `git config --global --get user.name`;
my $userEmail = `git config --global --get user.email`;
$userName =~ s/\s+$//;
$userEmail =~ s/\s+$//;
$userEmail =~ s/@/ at /g;
$userEmail =~ s/\./ dot /g;

$header =~ s/USER_NAME/$userName/g;
$header =~ s/USER_EMAIL/$userEmail/g;
$header =~ s/CLASS_NAME/$className/g;
$header =~ s/INCLUDEGUARD/$includeGuard/g;
#print $header;

$cpp =~ s/CLASS_NAME/$className/g;
#print $cpp;

print "writing $targetHeader\n" if $verbose;
write_file($targetHeader, $header);

print "writing $targetCpp\n" if $verbose;
write_file($targetCpp, $cpp);


sub read_file {
	my $filename = shift;
	open my $fh, '<', $filename or die "Can't open file $!";
	my $contents = do { local $/; <$fh> };
	return $contents;
	
}
sub write_file {
	my $filename = shift;
	my $contents = shift;
	open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";
	print $fh $contents;
	close $fh;
}
