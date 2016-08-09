#!/usr/bin/perl
use strict;

my @championList = qw( Aatrox Ahri Akali Alistar Amumu Anivia Annie Ashe Azir Bard Blitzcrank Brand Braum Caitlyn Cassiopeia Cho'Gath Corki Darius Diana Dr._Mundo Draven Ekko Elise Evelynn Ezreal Fiddlesticks Fiora Fizz Galio Gangplank Garen Gnar Gragas Graves Hecarim Heimerdinger Irelia Janna Jarvan_IV Jax Jayce Jinx Kalista Karma Karthus Kassadin Katarina Kayle Kennen Kha'Zix Kindred Kog'Maw LeBlanc Lee_Sin Leona Lissandra Lucian Lulu Lux Malphite Malzahar Maokai Master_Yi Miss_Fortune Mordekaiser Morgana Nami Nasus Nautilus Nidalee Nocturne Nunu Olaf Orianna Pantheon Poppy Quinn Rammus Rek'Sai Renekton Rengar Riven Rumble Ryze Sejuani Shaco Shen Shyvana Singed Sion Sivir Skarner Sona Soraka Swain Syndra Tahm_Kench Talon Taric Teemo Thresh Tristana Trundle Tryndamere Twisted_Fate Twitch Udyr Urgot Varus Vayne Veigar Vel'Koz Vi Viktor Vladimir Volibear Warwick Wukong Xerath Xin_Zhao Yasuo Yorick Zac Zed Ziggs Zilean Zyra );



foreach my $champion (@championList){
	system("D:");
	system("cd Documents/School/MQP");
	system("GetChampionPatchNotes.au3 " . $champion);
	wait;
	system("D:");
	system("cd Documents/School/MQP");
	system("perl Parse_Patch_Notes.pl " . $champion);
}