require "core.helpers.globals"

-- Set associating between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Disable comments on pressing Enter
cmd[[autocmd FileType * setlocal formatoptions-=cro]]

-- General UI config
opt.number = true																											-- Enabling line numbers
opt.relativenumber = true																							-- Enabling relative line numbers
opt.termguicolors = true																							-- Enabling colors on terminal
opt.cursorline = false																								-- Disable cursor line
opt.clipboard = "unnamedplus"																					-- Using the same clipboard as OS
opt.confirm = true																										-- Confirming unsaved changes
opt.mouse = "a"																												-- Enable mouse support
opt.undofile = true																										-- Enable undo file
opt.swapfile = false																									-- Disable swap file

-- Indentation
opt.expandtab = false                																	-- Use tabs by default
opt.shiftwidth = 2                  																	-- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 2                     																	-- 1 tab equal 2 spaces
opt.smartindent = true																								-- Turn on smart indentation.

-- Search
opt.ignorecase = true               																	-- Ignore case if all characters in lower case
opt.joinspaces = false              																	-- Join multiple spaces in search
opt.smartcase = true                																	-- When there is a one capital letter search for exact match
opt.showmatch = true                																	-- Highlight search instances

-- Split behavior
opt.splitbelow = true               																	-- Put new windows below current
opt.splitright = true               																	-- Put new vertical splits to right

-- Wild Menu
opt.wildmenu = true																										-- Enabling the wild menu
opt.wildmode = "longest:full,full"																		-- Setting wild menu mode

-- Make cursor blink magic
opt.guicursor = {
    "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50",
    "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Disabling default plugins
local disabled_built_ins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "gzip",
  "zip",
  "zipPlugin",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spellfile_plugin",
  "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
  g["loaded_" .. plugin] = 1
end
