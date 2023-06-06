local core = require('core')

core.initialize_options()
core.initialize_plugins()

-- load autocmds
require('core.autocmds')

-- load the core mappings of
require('core.mappings')

-- call the polish function
pcall(require, 'custom.polish')

