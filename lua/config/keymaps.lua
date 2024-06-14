
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local my_actions = require("alpha.telescope.my_actions")
map("n", "<leader>rp", function()
  require("telescope.builtin").find_files({
    prompt_title = "< Plugins >",
    cwd = "$HOME/.config/nvim/lua/plugins/",
    attach_mappings = function(_, map)
      map("i", "<C-y>", my_actions.create_plugin)
      map("i", "<C-w>", my_actions.disable_plugin)
      map("i", "<C-e>", my_actions.enable_plugin)

      return true
    end,
  })
end)
map("n", "<C-a>", "gg<S-v>G")

map("n", "<leader>rn", function()
  require("telescope.builtin").find_files({
    prompt_title = "< Neovim >",
    cwd = "$HOME/.config/nvim/",
  })
end)

-- Mover el cursor con Ctrl+Alt+J/K/L/I en modo de inserción
map('i', '<C-A-h>', '<Left>', opts)
map('i', '<C-A-j>', '<Down>', opts)
map('i', '<C-A-l>', '<Right>', opts)
map('i', '<C-A-k>', '<Up>', opts)

map("n", "<C-c>", ":ColorizerToggle<CR>", opts)

-- map("n", "<leader>t", "<cmd>ToggleTerm size=12 direction=horizontal<CR>", { noremap = true, silent = true })

map("i", "jj", "<Esc>")
local env_window_opened = false

local function toggleEnvFile()
  if env_window_opened then
    vim.cmd("bd! .env")
    env_window_opened = false
  else
    vim.cmd("vsp .env")
    env_window_opened = true
  end
end
map("n", "<leader>le", function()
  toggleEnvFile()
end, { noremap = true, silent = true, desc = "Toggle .env file" }
)
-- Select all
map("n", "<C-y>", "ggyG")

vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
vim.cmd("nnoremap gpr <cmd>lua require('goto-preview').goto_preview_references()<CR>")

vim.cmd([[
  noremap <silent> <c-h> :<C-U>TmuxNavigateLeft<cr>
  noremap <silent> <c-j> :<C-U>TmuxNavigateDown<cr>
  noremap <silent> <c-k> :<C-U>TmuxNavigateUp<cr>
  noremap <silent> <c-l> :<C-U>TmuxNavigateRight<cr>
  noremap <silent> <c-\> :<C-U>TmuxNavigatePrevious<cr>
]])

-- Aligns to 1 character
map("x", "aa", function()
  require("align").align_to_char({
    length = 1,
  })
end, opts)

-- Aligns to 2 characters with previews
map("x", "ad", function()
  require("align").align_to_char({
    preview = true,
    length = 2,
  })
end, opts)

-- Aligns to a string with previews
map("x", "aw", function()
  require("align").align_to_string({
    preview = true,
    regex = false,
  })
end, opts)

map("n", "<C-c>", ":ColorizerToggle<CR>", opts)

-- Aligns to a Vim regex with previews
map("x", "ar", function()
  require("align").align_to_string({
    preview = true,
    regex = true,
  })
end, opts)

-- Example gawip to align a paragraph to a string with previews
map("n", "gaw", function()
  local a = require("align")
  a.operator(a.align_to_string, {
    regex = false,
    preview = true,
  })
end, opts)

-- Example gaaip to align a paragraph to 1 character
map("n", "gaa", function()
  local a = require("align")
  a.operator(a.align_to_char)
end, opts)

