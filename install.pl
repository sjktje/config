#!/usr/bin/perl

use strict;
use warnings;

use Cwd;
use File::Copy;

my @dotfiles = (
	'zshrc',
	'vimrc',
	'gitconfig', 
	'screenrc',	
	'tmux.conf',
);

my $curdir = getcwd();

install_dotfiles();

sub install_dotfiles {
	foreach my $file (@dotfiles) {
		my $target = $ENV{'HOME'} . "/." . $file;

		if (file_exists($target)) {
			print "$target exists. Moving to $target.old\n";
			if (!move($target, "$target.old")) {
				print "Could not rename $target to $target.old: $!\n";
				exit(1);
			}
		} else {
			print "I'm past file_exists if.\n";
		}

		if (!symlink($curdir."/".$file, $target)) {
			print "Could not symlink $file to $target: $!\n";
			exit(1);
		}
	}

	print "Dotfiles installed.\n";
}

sub file_exists {
	my $f = shift;
	if (!-e $f && !-l $f) {
		return 0;
	} else {
		return 1;
	}
}
