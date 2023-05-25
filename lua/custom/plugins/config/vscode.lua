local M = function(_, opts)
    local vscode = require('vscode');
    vscode.setup(opts)
    vscode.load()
end

return M
