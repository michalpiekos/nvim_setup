vim.cmd("set expandtab")
vim.cmd("set tabstop=8")
vim.cmd("set softtabstop=8")
vim.cmd("set shiftwidth=8")
vim.g.mapleader = " "
vim.cmd("set mouse=a")
vim.cmd("set clipboard+=unnamedplus")
vim.cmd("set number")
-- vim.cmd("set nowrap")

-- Navigate vim panes better
--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

local default_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", default_opts) -- clear search highlights

vim.keymap.set("n", "x", '"_x', default_opts) -- 'x' deletes character but not put it into buffer
vim.keymap.set("n", "<leader>+", "<C-a>", default_opts) -- increases number under cursor
vim.keymap.set("n", "<leader>-", "<C-x>", default_opts) -- decreases number under cursor

vim.keymap.set("n", "<leader>sv", "<C-w>v", default_opts) -- split window vertically
vim.keymap.set("n", "<leader>ss", "<C-w>s", default_opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", default_opts) -- make split equal width
vim.keymap.set("n", "<leader>sw", "<C-w><C-w>", default_opts) -- highlight next split window
vim.keymap.set("n", "<leader>sh", "<C-w>h", default_opts) -- move to split window to the left
vim.keymap.set("n", "<leader>sj", "<C-w>j", default_opts) -- move to split window down
vim.keymap.set("n", "<leader>sk", "<C-w>k", default_opts) -- move to split window up
vim.keymap.set("n", "<leader>sl", "<C-w>l", default_opts) -- move to split window to the right
vim.keymap.set("n", "<leader>sx", ":close<CR>", default_opts) -- close current split window

vim.keymap.set("n", "<leader>ta", ":tabnew<CR>", default_opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", default_opts) -- close current tab
vim.keymap.set("n", "<leader><Right>", ":tabn<CR>", default_opts) -- go to next tab
vim.keymap.set("n", "<leader><Left>", ":tabp<CR>", default_opts) -- go to previous tab
vim.keymap.set("n", "<leader>l", ":tabn<CR>", default_opts) -- go to next tab
vim.keymap.set("n", "<leader>h", ":tabp<CR>", default_opts) -- go to previous tab

vim.keymap.set("n", "<leader>ot", ":SymbolsOutline<CR>", default_opts) -- Toggle Symbols outline

-- vim.keymap.set("n", "<leader><Left>", ":vertical resize +1<CR>", default_opts)
-- vim.keymap.set("n", "<leader><Right>", ":vertical resize -1<CR>", default_opts)
-- vim.keymap.set("n", "<leader><Up>", ":resize -1<CR>", default_opts)
-- vim.keymap.set("n", "<leader><Down>", ":resize +1<CR>", default_opts)


-- -- Create an autocommand group to hold our autocommands
-- local group_id = vim.api.nvim_create_augroup("ScrollAndCursorBind", { clear = true })
--
-- -- Define the autocommands for setting scrollbind and cursorbind on window enter
-- vim.api.nvim_create_autocmd("WinEnter", {
--     group = group_id,
--     callback = function()
--         vim.opt_local.scrollbind = true
--         vim.opt_local.cursorbind = true
--     end,
-- })

-- Enable groovy for *.jenkins files
vim.cmd [[
  augroup filetypedetect
    au! BufRead,BufNewFile *.jenkins set filetype=groovy
    au! BufRead,BufNewFile *.overlay set filetype=dts
  augroup END
]]

_G.toggle_scroll_cursor_bind = function()
    local current_window = vim.api.nvim_get_current_win()
    local scrollbind = vim.wo.scrollbind
    local cursorbind = vim.wo.cursorbind

    -- Toggle the options
    vim.api.nvim_win_set_option(current_window, "scrollbind", not scrollbind)
    vim.api.nvim_win_set_option(current_window, "cursorbind", not cursorbind)

    -- Print the status
    print("scrollbind:", not scrollbind, "cursorbind:", not cursorbind)
end

-- Set key binding to toggle scrollbind and cursorbind
vim.api.nvim_set_keymap('n', '<leader>sb', ':lua toggle_scroll_cursor_bind()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('t', '<Leader><ESC>', '<C-\\><C-n>', {noremap = true})
vim.keymap.set('i', '<End>', '<C-o>$', {})
vim.keymap.set('i', '<Home>', '<C-o>^', {})

-- Map Ctrl+h, Ctrl+j, Ctrl+k, Ctrl+l as arrow keys in insert mode
vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-\\><C-\\>', '<C-\\><C-N><C-W><C-W>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-\\><C-\\>', '<Esc><C-W><C-W>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-\\><C-\\>', '<C-W><C-W>', { noremap = true, silent = true })

-- Visual multi mode
vim.g.VM_leader = '\\'
--vim.g.VM_maps = vim.g.VM_maps or {}
--vim.g.VM_maps['Motion ,'] = ',,'

-- Switching diagnostics on/off
local diagnostics_enabled = true
function ToggleDiagnostics()
    if diagnostics_enabled then
        vim.diagnostic.disable()  -- Disable all diagnostics
        print("Diagnostics Disabled")
    else
        vim.diagnostic.enable()  -- Re-enable all diagnostics
        print("Diagnostics Enabled")
    end
    diagnostics_enabled = not diagnostics_enabled
end
vim.api.nvim_set_keymap("n", "<leader>gc", ":lua ToggleDiagnostics()<CR>", { noremap = true, silent = true })

-- Select the entire text and send it to the REPL
vim.keymap.set('n', '<leader>td', function()
  local iron = require('iron.core')  -- Ensure iron.nvim is loaded
  -- Get the entire buffer content
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local full_text = table.concat(lines, "\n")
  -- Send the full content to the REPL
  iron.send(nil, full_text)
end, { noremap = true, silent = true })

-- TODO plugin keywords
vim.keymap.set("n", "]t", function()
        require("todo-comments").jump_next()
end, { desc = "Next TODO comment" })

vim.keymap.set("n", "[t", function()
        require("todo-comments").jump_prev()
end, { desc = "Previous TODO comment" })

-- Turn on TodoTelescope with filter
vim.keymap.set('n', '<leader>fq', function()
    require('telescope').extensions["todo-comments"].todo({
        keywords="TASK,FIXIT"
    })
end, { noremap = true, silent = true })

-- Turn on multiline up/down behavior
vim.keymap.set('n', 'j', 'gj', { noremap = true, silent = true })
vim.keymap.set('n', 'k', 'gk', { noremap = true, silent = true })

-- AI
vim.keymap.set("n", "<leader>cg", ":PrtChatToggle popup<CR>", { desc = "OpenAI ChatGPT" })
vim.keymap.set("n", "<leader>ci", ":PrtImplement<CR>", { desc = "AI Implement from selection" })
vim.keymap.set("n", "<leader>cb", ":PrtFixBugs<CR>", { desc = "AI fix bugs" })
vim.keymap.set("n", "<leader>ca", ":PrtAppend<CR>", { desc = "AI append" })
vim.keymap.set("n", "<leader>cp", ":PrtPrepend<CR>", { desc = "AI prepend" })

-- Show number representation
local function to_binary(n)
  if n == 0 then return "0" end
  local t = {}
  while n > 0 do
    table.insert(t, 1, n % 2)
    n = math.floor(n / 2)
  end
  return table.concat(t)
end

local function show_number_representation()
  -- Get visual selection
  local start_pos = vim.fn.getpos("'<")
  local end_pos = vim.fn.getpos("'>")
  local line = vim.fn.getline(start_pos[2])
  local selection = string.sub(line, start_pos[3], end_pos[3])

  -- Trim whitespace
  selection = selection:match("^%s*(.-)%s*$")

  local num
  if selection:match("^0[xX][0-9a-fA-F]+$") then
    num = tonumber(selection, 16)
  else
    num = tonumber(selection)
  end

  if not num then
    vim.notify("Not a valid number: " .. selection, vim.log.levels.ERROR)
    return
  end

  local msg = string.format(
    "Dec: %d\nHex: 0x%X\nBin: 0b%s",
    num, num, to_binary(num)
  )

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, vim.split(msg, "\n"))
  local width = 40
  local height = 3
  local opts = {
    relative = "cursor",
    row = 1,
    col = 0,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    focusable = true,
  }
  local win = vim.api.nvim_open_win(buf, true, opts)  -- <== 2nd param TRUE: open in focus

  -- Save the previous window so we can return
  local prev_win = vim.api.nvim_get_current_win()

  -- Esc and q to close and return focus
  for _, key in ipairs({ "<Esc>", "q" }) do
    vim.keymap.set('n', key, function()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
      if vim.api.nvim_win_is_valid(prev_win) then
        vim.api.nvim_set_current_win(prev_win)
      end
    end, { buffer = buf, nowait = true, silent = true })
  end
end

-- Command for convenience
vim.api.nvim_create_user_command('ShowNumRep', show_number_representation, {})
vim.keymap.set('v', '<leader>nn', [[:<C-u>ShowNumRep<CR>]], { noremap = true, silent = true })

vim.keymap.set('n', '<leader>gh', function() require('gitsigns').preview_hunk() end, { desc = 'Gitsigns preview hunk' })
vim.keymap.set('n', '<leader>gR', function() vim.cmd('Gitsigns change_base HEAD') end, { desc = 'Gitsigns reset base to HEAD' })
vim.keymap.set('n', '<leader>gr', function() require('gitsigns').reset_hunk() end, { desc = 'Gitsigns reset hunk' })
vim.keymap.set('v', '<leader>gr', ':Gitsigns reset_hunk<CR>', { desc = 'Gitsigns reset hunk' })
vim.keymap.set('n', ']c', function() require('gitsigns').next_hunk() end)
vim.keymap.set('n', '[c', function() require('gitsigns').prev_hunk() end)

local function goto_next_and_show()
  vim.diagnostic.goto_next({ severity = nil })
  vim.diagnostic.open_float(nil, {focus=false})
end

local function goto_prev_and_show()
  vim.diagnostic.goto_prev({ severity = nil })
  vim.diagnostic.open_float(nil, {focus=false})
end

vim.keymap.set('n', ']d', goto_next_and_show, { desc = "Next diagnostic (show float)" })
vim.keymap.set('n', '[d', goto_prev_and_show, { desc = "Prev diagnostic (show float)" })
