local ok_discipline, discipline = pcall(require, "util.discipline")
if ok_discipline then
  discipline.cowboy()
end

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
keymap.set("n", "dw", 'vb"_d')

keymap.set("n", "<C-a>", "gg<S-v>G")
keymap.set("n", "<Esc>", "<cmd>noh<CR>", opts)

keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

keymap.set("n", "<C-m>", "<C-i>", opts)

keymap.set("n", "te", ":tabedit ", { noremap = true })
keymap.set("n", "tn", ":tabnew<Return>", opts)
keymap.set("n", "tc", ":tabclose<Return>", opts)
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sl", "<C-w>l")
keymap.set("n", "sx", "<C-w>q", opts)
keymap.set("n", "so", "<C-w>o", opts)

keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

keymap.set("n", "<A-Up>", ":m .-2<CR>==", opts)
keymap.set("n", "<A-Down>", ":m .+1<CR>==", opts)
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
keymap.set("n", "<C-k>", function()
  vim.diagnostic.goto_prev()
end, opts)

keymap.set("n", "<leader>r", function()
  require("util.hsl").replaceHexWithHSL()
end, { desc = "Replace hex with HSL" })

keymap.set("n", "<leader>uh", function()
  require("util.lsp").toggleInlayHints()
end, { desc = "Toggle Inlay Hints" })

vim.api.nvim_create_user_command("ToggleAutoformat", function()
  require("util.lsp").toggleAutoformat()
end, {})

keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
keymap.set("n", "<C-q>", "<cmd>qa<CR>", { desc = "Quit all" })
keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

keymap.set("n", "<leader>bD", "<cmd>bd!<CR>", { desc = "Force delete buffer" })

keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
