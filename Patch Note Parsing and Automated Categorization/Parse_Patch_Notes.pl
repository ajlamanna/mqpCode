#!/usr/bin/perl
use strict;

my $championName = $ARGV[0];

	

my $inputFile = "\\documents\\school\\mqp\\raw_patch_note_files\\ " . $championName . "_patch_notes_raw.txt";
my $outputFile = "\\documents\\school\\mqp\\patch_note_files\\ " . $championName . "_patch_notes.txt";

open(my $ifh, '<:encoding(UTF-8)', $inputFile) or die "Could not open file '$inputFile' $!";	
open(my $ofh, '>', $outputFile) or die "Could not open file '$outputFile' $!";	


my $switch = 0;
my $firstHalf = ''; 
my $secondHalf = '';
while (my $row = <$ifh>) {
	chomp $row;
	
	if (index($row, 'Patch History') != -1){
		$switch = 1;
		$row = "Patch History:";
	}

	if(index($row, 'References') != -1){
		$switch = 0;
	}
	
	if($switch == 1){
		$row =~ s/<[^>]*>//g;
		if(index($row, ':') != -1){
			if ((!($row =~ /^V([0-9]*\.[0-9]*)*\:/)) and (!($row =~ /Week [0-9]*\:/)) and (!($row =~ /2[0-9]{3} Patch\:/))){
				$firstHalf = $row;
				$secondHalf = $row;
				$firstHalf =~ s/:[^]*[^]*//g;
				$secondHalf =~ s/[^]*[^]*://g;
				print($ofh "\n$firstHalf:\n");
				print($ofh "\n$secondHalf:\n");
			}
			else{
				print($ofh "$row\n");
			}
		}
		else{
			print($ofh "$row\n");
		}
	}
}

close $ifh;
close $ofh;


