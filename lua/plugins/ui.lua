return {
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })
      table.insert(opts.routes, 1, {
        filter = {
          cond = function()
            return not focused
          end,
        },
        view = "notify_send",
        opts = { stop = false },
      })

      opts.commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets = opts.presets or {}
      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      background_colour = "#000000",
      render = "wrapped-compact",
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      indent = {
        enabled = true,
        animate = { enabled = false },
        chunk = { enabled = true },
      },
      scope = { enabled = true },
      input = { enabled = true },
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },

  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next buffer" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev buffer" },
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    },
    opts = {
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = { Error = " ", Warn = " ", Info = " " }
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        show_buffer_close_icons = false,
        show_close_icon = false,
        always_show_bufferline = true,
        separator_style = "thin",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    },
  },

  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim", "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local has_colors, colors = pcall(function()
        return require("solarized-osaka.colors").setup()
      end)
      local hl_normal = { guifg = "#1a1b26", guibg = "#bb9af7" }
      local hl_nc = { guifg = "#9d7cd8", guibg = "#1a1b26" }
      if has_colors then
        hl_normal = { guibg = colors.magenta500, guifg = colors.base04 }
        hl_nc = { guifg = colors.violet500, guibg = colors.base03 }
      end
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = hl_normal,
            InclineNormalNC = hl_nc,
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if filename == "" then
            filename = "[No Name]"
          end
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon or "", guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local ok, LazyVim = pcall(require, "lazyvim.util")
      if ok and LazyVim and LazyVim.lualine and LazyVim.lualine.pretty_path then
        opts.sections = opts.sections or {}
        opts.sections.lualine_c = opts.sections.lualine_c or {}
        opts.sections.lualine_c[4] = {
          LazyVim.lualine.pretty_path({
            length = 0,
            relative = "cwd",
            modified_hl = "MatchParen",
            directory_hl = "",
            filename_hl = "Bold",
            modified_sign = "",
            readonly_icon = " 󰌾 ",
          }),
        }
      end
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        width = 0.85,
        options = {
          number = false,
          relativenumber = false,
          signcolumn = "no",
        },
      },
      plugins = {
        gitsigns = { enabled = true },
        tmux = { enabled = true },
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
}
