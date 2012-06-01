package DDG::Spice::Lastfm;
# ABSTRACT: Search for musicians in Last.fm and get their top albums.

use DDG::Spice;

spice to => 'http://ws.audioscrobbler.com/2.0/?format=json&method=$1.$2&$3=$4&api_key={{ENV{DDG_SPICE_LASTFM_APIKEY}}}&callback={{callback}}';
spice from => '(?:([^/]*)/([^/]*)/([^/]*)/([^/]*)|)';

triggers startend => 'albums';

handle remainder => sub {
	my $query = $_;
	#Get album information
	if($query =~ /album-(\w+-\w+-\w+-\w+-\w+)$/) {
		return 'album', 'getinfo', 'mbid', $1;
	#Get top albums
	} elsif($query =~ /(\w+-\w+-\w+-\w+-\w+)$/) {
		return 'artist', 'gettopalbums', 'mbid', $1; 
	#Get a list of artists
	} else {
		return 'artist', 'search', 'artist', $query; 
	}
	return;
};
1;
