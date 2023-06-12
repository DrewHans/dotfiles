# note to self:
# single quotes are evaluated dynamically (when called)
# double quotes are evaluated at time of creation and, thereafter, never changes

alias batst='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias browser='brave-browser'
alias cdr='cd $(git rev-parse --show-toplevel)'
alias dlaudio='yt-dlp -i -x --audio-format mp3 -o "%(title)s.%(ext)s"'
alias nuke='/home/nyancat/bin/nuke.sh'
alias up='sudo /home/nyancat/bin/update.sh'

# alias flatpak apps
# use `flatpak list --user` to find full application ids
alias authenticator='flatpak run com.belmoussaoui.Authenticator'
alias obfuscate='flatpak run com.belmoussaoui.Obfuscate'
alias calibre='flatpak run com.calibre_ebook.calibre'
alias discord='flatpak run com.discordapp.Discord'
alias postman='flatpak run com.getpostman.Postman'
alias fileshredder='flatpak run com.github.ADBeveridge.Raider'
alias flatseal='flatpak run com.github.tchx84.Flatseal'
alias easyeffects='flatpak run com.github.wwmm.easyeffects'
alias minecraft='flatpak run com.mojang.Minecraft'
alias obs='flatpak run com.obsproject.Studio'
alias dbeaver='flatpak run io.dbeaver.DBeaverCommunity'
alias librewolf='flatpak run io.gitlab.librewolf-community'
alias mediainfo='flatpak run net.mediaarea.MediaInfo'
alias mpv='flatpak run io.mpv.Mpv'
alias nvim='flatpak run io.neovim.nvim'
alias neovim='flatpak run io.neovim.nvim'
alias minetest='flatpak run net.minetest.Minetest'
alias gimp='flatpak run org.gimp.GIMP'
alias ghex='flatpak run org.gnome.GHex'
alias keepassxc='flatpak run org.keepassxc.KeePassXC'
alias libreoffice='flatpak run org.libreoffice.LibreOffice'
alias tagger='flatpak run org.nickvision.tagger'
alias qbittorrent='flatpak run org.qbittorrent.qBittorrent'
alias vlc='flatpak run org.videolan.VLC'
alias yuzu='flatpak run org.yuzu_emu.yuzu'
alias zoom='flatpak run us.zoom.Zoom'
