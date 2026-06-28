vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.title = true
opt.titlestring = "%<%F%=%l/%L - nvim"

opt.autoindent = true
opt.smartindent = true
opt.breakindent = true
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.hlsearch = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = false
opt.linebreak = true
opt.showmode = false
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 3
opt.pumblend = 10
opt.pumheight = 12
opt.winblend = 0
opt.termguicolors = true

opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.updatetime = 200
opt.timeoutlen = 400

opt.backspace = { "start", "eol", "indent" }
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*", "*/.git/*", "*/dist/*", "*/build/*" })
opt.backupskip = { "/tmp/*", "/private/tmp/*" }

opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldcolumn = "1"
opt.fillchars = {
  foldopen = "▾",
  foldclose = "▸",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
opt.conceallevel = 2
opt.formatoptions:append({ "r" })

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.confirm = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.filetype.add({
  extension = {
    mdx = "mdx",
    astro = "astro",
  },
  filename = {
    Podfile = "ruby",
  },
})

vim.g.lazyvim_prettier_needs_config = false
vim.g.lazyvim_cmp = "blink.cmp"
