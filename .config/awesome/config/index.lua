local Libs = {}

require('config/variables')
Libs.errors = require('config/errors')
Libs.layout_config = require('config/layout_config')
Libs.launcher = require('config/launcher')
Libs.screen_init = require('config/screen_init')
Libs.key_bindings = require('config/key_bindings')
Libs.rules = require('config/rules')
Libs.spawner = require('config/spawner')

return Libs