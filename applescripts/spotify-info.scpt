if application "Spotify" is running then
  tell application "Spotify"
    set the_name to name of the current track
    set the_artist to artist of the current track
    set the_album to album of the current track
    set the_url to spotify url of the current track
    try
      return "♫ " & the_name & " by " & the_artist
    on error err
    end try
  end tell
end if
