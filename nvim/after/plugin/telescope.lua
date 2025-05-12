
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function() 
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
    vim.keymap.set("i", "<C-H>", "<C-W>", { noremap = true });
end)

