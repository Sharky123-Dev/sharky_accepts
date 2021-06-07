-- Resource Metadata
fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Sharky'
description 'Sharky Accept Script'
version '1.0.0'

-- What to run
client_scripts {
    'config/config.lua',
    'client/*.lua',
    
}

ui_page 'html/index.html'

files {
    'html/css/*',
	'html/js/*',
	'html/*'
}

export 'openMenu'