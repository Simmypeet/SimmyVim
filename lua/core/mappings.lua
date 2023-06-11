-- improved window navigation
vim.keymap.set({ 'n', 't' }, '<C-h>', '<CMD>wincmd h<CR>', { desc = 'Move to the left window' })
vim.keymap.set({ 'n', 't' }, '<C-j>', '<CMD>wincmd j<CR>', { desc = 'Move to the below window' })
vim.keymap.set({ 'n', 't' }, '<C-k>', '<CMD>wincmd k<CR>', { desc = 'Move to the upper window' })
vim.keymap.set({ 'n', 't' }, '<C-l>', '<CMD>wincmd l<CR>', { desc = 'Move to the right window' })

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

vim.keymap.set({ 't', 'n' }, '<C-Left>', '<CMD>vertical resize -2<CR>', { desc = 'Resize window left' })
vim.keymap.set({ 't', 'n' }, '<C-Right>', '<CMD>vertical resize +2<CR>', { desc = 'Resize window right' })
vim.keymap.set({ 't', 'n' }, '<C-Up>', '<CMD>resize -2<CR>', { desc = 'Resize window up' })
vim.keymap.set({ 't', 'n' }, '<C-Down>', '<CMD>resize +2<CR>', { desc = 'Resize window down' })
