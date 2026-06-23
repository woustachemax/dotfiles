local M = {}

function M.toggleInlayHints()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end

function M.toggleAutoformat()
  local ok, LazyVim = pcall(require, "lazyvim.util")
  if ok and LazyVim.format and LazyVim.format.toggle then
    LazyVim.format.toggle()
  end
end

return M
