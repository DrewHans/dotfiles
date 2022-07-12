alias browser="brave-browser"
alias vpn="nordvpn"
alias vpnc="vpn set killswitch off && vpn c && vpn set killswitch on"
alias vpnst="vpn status"
alias dlaudio="yt-dlp -i -x --audio-format mp3 -o '%(title)s.%(ext)s'"

# openvpn aliases
#alias startvpn="sudo /home/nyancat/bin/vpnstart.sh"
#alias stopvpn="sudo /home/nyancat/bin/vpnstop.sh"
#alias vpnstatus="/home/nyancat/bin/vpnstatus.sh"

# alias flatpak apps
# use `flatpak list --user` to find full application ids
alias calibre="flatpak run com.calibre_ebook.calibre"
alias discord="flatpak run com.discordapp.Discord"
alias postman="flatpak run com.getpostman.Postman"
alias flatseal="flatpak run com.github.tchx84.Flatseal"
alias easyeffects="flatpak run com.github.wwmm.easyeffects"
alias obs="flatpak run com.obsproject.Studio"
alias dbeaver="flatpak run io.dbeaver.DBeaverCommunity"
alias librewolf="flatpak run io.gitlab.librewolf-community"
alias mediainfo="flatpak run net.mediaarea.MediaInfo"
alias mpv="flatpak run io.mpv.Mpv"
alias gimp="flatpak run org.gimp.GIMP"
alias ghex="flatpak run org.gnome.GHex"
alias keepassxc="flatpak run org.keepassxc.KeePassXC"
alias libreoffice="flatpak run org.libreoffice.LibreOffice"
alias tagger="flatpak run org.nickvision.tagger"
alias qbittorrent="flatpak run org.qbittorrent.qBittorrent"
alias vlc="flatpak run org.videolan.VLC"
alias zoom="flatpak run us.zoom.Zoom"

alias installupdates="sudo /home/nyancat/bin/update.sh"
