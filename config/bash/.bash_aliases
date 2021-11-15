alias python=python3

alias browser="brave-browser"

# if yt-dlp is installed
command -v yt-dlp >/dev/null 2>&1 && {
    alias youtube-dl="yt-dlp"
}
