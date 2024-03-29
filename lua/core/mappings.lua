-- improved window navigation
vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>wincmd h<CR>', { desc = 'Move to the left window', noremap = false })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>wincmd j<CR>', { desc = 'Move to the below window', noremap = false })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>wincmd k<CR>', { desc = 'Move to the upper window', noremap = false })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>wincmd l<CR>', { desc = 'Move to the right window', noremap = false })
vim.keymap.set({ 'v' }, '<C-r>', '"hy:%s/<C-r>h//gc<left><left><left>',
    { desc = 'Replace selected text', noremap = false })

local save = function()
    -- check if the current buffer is modifiable
    if vim.bo.modifiable then
        vim.cmd('w')
    end
end

vim.keymap.set({ 'n', 'i' }, '<C-s>', save, { desc = 'Save' })
vim.keymap.set('n', '<C-\\>', '<CMD>vsplit<CR>', { desc = 'Vertical split' })

-- disable q recording
vim.keymap.set({ 't', 'n' }, 'q', '<NOP>', { desc = 'Disable q recording' })
