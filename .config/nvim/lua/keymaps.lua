-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Save all buffers and quit all buffers (exit NeoVim)
vim.keymap.set('n', '<leader>Q', ':xa<cr>', { desc = 'Save and quite all buffers (exit NeoVim)' })

-- Save all buffers
vim.keymap.set('n', '<leader>W', ':wa<cr>', { desc = 'Save all buffers' })

-- Move between buffers
vim.keymap.set('n', '<leader>bn', ':bn<cr>', { desc = '[B]uffer [N]ext' })
vim.keymap.set('n', '<leader>bp', ':bp<cr>', { desc = '[B]uffer [P]revious' })
vim.keymap.set('n', '<leader>bd', ':bd<cr>', { desc = '[B]uffer [D]elete' })

-- Select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', { desc = 'Select all' })

-- <J> and <K> move the seleted line(s) up & down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- For easily indenting lines
vim.keymap.set('v', '>', '>gv', { desc = 'after tab in re-select the same' })
vim.keymap.set('v', '<', '<gv', { desc = 'after tab out re-select the same' })

-- For easily search results and have the cursor on the middle of the screen so I don't get loget lostt
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Goes to the next result on the seach and put the cursor in the middle' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Goes to the prev result on the seach and put the cursor in the middle' })

-- Deletes to the void register
vim.keymap.set('v', '<leader>d', '"_d')

-- Nothing done when <Q> is pressed
vim.keymap.set('n', 'Q', '<nop>')

-- Helps with text search and text replace
-- rw: Replace Words (under selection) starting from the cursor until the end of the file
vim.keymap.set('v', '<leader>rw', [["hy:,$s/<C-r>h/<C-r>h/gc<left><left><left>]])
-- raw: Replace All Words (under selection) starting from the beginning of the file until the end of the file
vim.keymap.set('v', '<leader>raw', [["hy:%s/<C-r>h/<C-r>h/gc<left><left><left>]])
-- sw: Search Word (under selection)
vim.keymap.set('v', '<leader>sw', [["hy:<C-u>/\V<C-r>=escape(@h, '/\\')<CR><CR>]])

-- Source current file
vim.keymap.set('', '<leader>rr', ':source %<cr>', { noremap = true, silent = true, desc = 'Source the current file (double r: Reload)' })
