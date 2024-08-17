#!/run/current-system/sw/bin/sh

get_power_hit_radio_song() {
  song_name='';
  song_name=$(curl -s https://powerhitradio.tv3.lt/Pwr/lastSong/ | jq -r '.song')
  song_format='';
  song_format=$(playerctl metadata --format '{{title}}       ')
  echo "${song_format}${song_name}"
}

get_spotify_song() {
  playerctl metadata --format '{{title}}      {{artist}}'
}

get_default_song() {
  playerctl metadata --format '{{title}} {{artist}}'
}

main() {
  song_info='';

  if [[ $(playerctl metadata title) == 'Power Hit Radio' ]]; then
    song_info=$(get_power_hit_radio_song)
  # Spotify
  elif [[ $(playerctl metadata xesam:url) == "https://open.spotify.com/"* ]]; then
    song_info=$(get_spotify_song)
  else
    song_info=$(get_default_song)
  fi

  echo "$song_info"
}

main
