require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

-- Ctrl mappings
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- Windows
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- Resize
map("n", "<A-Up>", "<Cmd>resize +2<CR>", { desc = "Resize split up" })
map("n", "<A-Down>", "<Cmd>resize -2<CR>", { desc = "Resize split down" })
map("n", "<A-Left>", "<Cmd>vertical resize +2<CR>", { desc = "Resize split left" })
map("n", "<A-Right>", "<Cmd>vertical resize -2<CR>", { desc = "Resize split right" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "General Save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

-- LEADER mappings
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- LSP
-- global lsp mappings
map("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
-- TODO: remap lsp rename here
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "LSP Rename", remap = true })
map("n", "<leader>lc", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Tabufline
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<leader>x", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("v", "<leader>/", "gc", { desc = "Toggle comment", remap = true })

-- Nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Telescope
map("n", "<leader>f", "", { desc = "Find with Telescope" })
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fg", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>ft", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>fn", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fr", "<cmd>Telescope resume<cr>", { desc = "telescope resume" })
map("n", "<leader>fp", "<cmd>Telescope grep_string<cr>", { desc = "telescope grep string" })
map(
  "n",
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- Terminal
map("t", "<esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode", remap = true })

map("n", "<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

-- Toggleable
-- map({ "n", "t" }, "<leader>tV", function()
--   require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
-- end, { desc = "terminal toggleable vertical term" })
-- map({ "n", "t" }, "<leader>tH", function()
--   require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
-- end, { desc = "terminal new horizontal term" })
map({ "n" }, "<leader>tF", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "terminal toggle floating term" })
--
-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- TODO: what is this?
-- blankline
map("n", "<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

-- Obsidian
map("n", "<leader>o", "", { noremap = true, desc = "Obsidian" })
map("n", "<leader>ot", ":ObsidianToday", { silent = true, noremap = true, desc = "Obsidian Today" })
map("n", "<leader>os", ":ObsidianQuickSwitch<CR>", { silent = true, noremap = true, desc = "Obsidian Quick Switch" })
map("n", "<leader>oo", ":ObsidianOpen<CR>", { silent = true, noremap = true, desc = "Obsidian Open" })

-- Custom
-- Function to get text from visual selection, send to python script to
-- translate and then open the result in new vertical buffer
local function get_visual_selection()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
  if #lines == 0 then
    return ""
  end

  if start_pos[2] == end_pos[2] then
    lines[1] = string.sub(lines[1], start_pos[3], end_pos[3])
  else
    lines[1] = string.sub(lines[1], start_pos[3])
    lines[#lines] = string.sub(lines[#lines], 1, end_pos[3])
  end

  return table.concat(lines, "\n")
end

-- Create the command with inline processing
vim.api.nvim_create_user_command("VisualToBuffer", function()
  local text = get_visual_selection()
  if text == "" then
    return
  end

  -- Process the text with the Python script
  local script_path = "/home/scand/Repos/easy-translate/translate.py"
  -- Escape single quotes in the text and wrap the entire text in single quotes
  local escaped_text = text:gsub("'", "'\\''")
  -- local command = string.format("python %s '%s'", script_path, escaped_text)
  local command = string.format("%s '%s'", script_path, escaped_text)
  local processed_text = vim.fn.system(command)

  -- Open in new buffer
  local buf = vim.api.nvim_create_buf(true, true)
  local lines = vim.split(processed_text, "\n")
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.cmd "vsplit"
  vim.api.nvim_win_set_buf(0, buf)
end, { range = true })

-- Map <leader>p in visual mode to the VisualToBuffer command
map("v", "<leader>p", ":VisualToBuffer<CR>", { noremap = true, silent = true })
