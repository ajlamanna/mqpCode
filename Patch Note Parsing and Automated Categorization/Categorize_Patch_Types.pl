#!/usr/bin/perl
use strict;

my @championList = qw( Aatrox Ahri Akali Alistar Amumu Anivia Annie Ashe Azir Bard Blitzcrank Brand Braum Caitlyn Cassiopeia Cho'Gath Corki Darius Diana Dr._Mundo Draven Ekko Elise Evelynn Ezreal Fiddlesticks Fiora Fizz Galio Gangplank Garen Gnar Gragas Graves Hecarim Heimerdinger Irelia Janna Jarvan_IV Jax Jayce Jinx Kalista Karma Karthus Kassadin Katarina Kayle Kennen Kha'Zix Kindred Kog'Maw LeBlanc Lee_Sin Leona Lissandra Lucian Lulu Lux Malphite Malzahar Maokai Master_Yi Miss_Fortune Mordekaiser Morgana Nami Nasus Nautilus Nidalee Nocturne Nunu Olaf Orianna Pantheon Poppy Quinn Rammus Rek'Sai Renekton Rengar Riven Rumble Ryze Sejuani Shaco Shen Shyvana Singed Sion Sivir Skarner Sona Soraka Swain Syndra Tahm_Kench Talon Taric Teemo Thresh Tristana Trundle Tryndamere Twisted_Fate Twitch Udyr Urgot Varus Vayne Veigar Vel'Koz Vi Viktor Vladimir Volibear Warwick Wukong Xerath Xin_Zhao Yasuo Yorick Zac Zed Ziggs Zilean Zyra );



foreach my $champion (@championList){
	my $inputFile = "\\documents\\school\\mqp\\patch_note_files\\ " . $champion . "_patch_notes.txt";
	my $outputFile = "\\documents\\school\\mqp\\categorized_patch_notes\\ " . $champion . "_categorized_patch_notes.txt";
	open(my $ifh, '<', $inputFile) or die "Could not open file '$inputFile' $!";	
	open(my $ofh, '>', $outputFile) or die "Could not open file '$outputFile' $!";	

	while (my $row = <$ifh>) {
		chomp $row;
		my $reversed = 0;
		
		if (($row =~ /^V([0-9]*\.[0-9]*)*\:/) or ($row =~ /Week [0-9]*\:/) or ($row =~ /2[0-9]{3} Patch\:/)){
			$row =~ s/:[^]*[^]*//g; 
			print($ofh "\n$row:\n");
		}
		
		if ((index($row, 'Cost') != -1) or (index($row, 'cost') != -1) or (index($row, 'Cooldown') != -1) or (index($row, 'cooldown') != -1) or (index($row, 'Cast time') != -1) or (index($row, 'cast time') != -1) or (index($row, 'delay') != -1) or (index($row, 'Delay') != -1) or (index($row, 'benchmark') != -1) or (index($row, 'benchmarks') != -1)){
			if((index($row, 'cooldown reduction') == -1) and (index($row, 'Cooldown Reduction') == -1)){
				$reversed = 1;
			}
		}
		
		if (((index($row, 'Fixed') != -1) or (index($row, 'fixed') != -1)) and (index($row, 'bug') != -1)){
			print($ofh "Bug fix\n");
		}
		
		elsif ((index($row, 'tooltip') != -1) or (index($row, 'tooltips') != -1) or (index($row, 'Tooltip') != -1) or (index($row, 'Tooltips') != -1)){
			print($ofh "Visual Update\n");
		}
		
		elsif ((index($row, 'increased to') != -1) or (index($row, 'Increased to') != -1)){
			if ($reversed == 0){
				print($ofh "Number buff\n");
			}
			if ($reversed == 1){
				print($ofh "Number nerf\n");
			}
		}
		
		elsif ((index($row, 'decreased to') != -1) or (index($row, 'reduced to') != -1) or (index($row, 'Decreased to') != -1) or (index($row, 'Reduced to') != -1)){
			if ($reversed == 0){
				print($ofh "Number nerf\n");
			}
			if ($reversed == 1){
				print($ofh "Number buff\n");
			}
		}
		
		elsif ((index($row, 'changed') != -1) or (index($row, 'Changed') != -1)){
			print($ofh "Number neutral\n");
		}
		
		
	}

	close $ifh;
	close $ofh;
}



