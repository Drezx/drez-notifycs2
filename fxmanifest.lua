fx_version "cerulean"
game "gta5"
lua54 "yes"
author "Drez https://github.com/Drezx | https://drez.tebex.io/"


client_scripts {
    "client/*.lua",
}


ui_page "web/index.html"
files {
    "web/*"
}
escrow_ignore {
    "client/*.lua",
    "web/**"
}