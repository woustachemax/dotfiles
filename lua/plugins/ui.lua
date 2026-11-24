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

  { "akinsho/bufferline.nvim", enabled = false },

  { "b0o/incline.nvim", enabled = false },

  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local c = {
        fg = "#9aa7d0",
        dim = "#4f5b7a",
        green = "#c3e88d",
        pink = "#f5a0d3",
        yellow = "#e0af68",
        red = "#f7768e",
      }

      local function mode_theme(color)
        return {
          a = { fg = color, bg = "NONE", gui = "bold" },
          b = { fg = c.fg, bg = "NONE" },
          c = { fg = c.fg, bg = "NONE" },
        }
      end

      opts.options = opts.options or {}
      opts.options.theme = {
        normal = mode_theme(c.fg),
        insert = mode_theme(c.green),
        visual = mode_theme(c.pink),
        replace = mode_theme(c.red),
        command = mode_theme(c.yellow),
        terminal = mode_theme(c.green),
        inactive = mode_theme(c.dim),
      }
      opts.options.component_separators = ""
      opts.options.section_separators = ""

      local short = {
        n = "NOR",
        i = "INS",
        v = "SEL",
        V = "SEL",
        ["\22"] = "SEL",
        s = "SEL",
        S = "SEL",
        c = "CMD",
        R = "REP",
        t = "TRM",
      }

      local path_component = "filename"
      local ok, LazyVim = pcall(require, "lazyvim.util")
      if ok and LazyVim and LazyVim.lualine and LazyVim.lualine.pretty_path then
        path_component = LazyVim.lualine.pretty_path({
          length = 0,
          relative = "cwd",
          modified_hl = "MatchParen",
          directory_hl = "",
          filename_hl = "Bold",
          modified_sign = "",
          readonly_icon = " 󰌾 ",
        })
      end

      opts.sections = {
        lualine_a = {
          {
            function()
              return short[vim.api.nvim_get_mode().mode:sub(1, 1)] or "NOR"
            end,
            padding = { left = 1, right = 1 },
          },
        },
        lualine_b = {},
        lualine_c = { path_component },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = "● ", warn = "● ", info = "● ", hint = "● " },
          },
        },
        lualine_y = {
          {
            function()
              return (vim.fn.wordcount().visual_chars or 1) .. " sel"
            end,
          },
        },
        lualine_z = {
          {
            function()
              local pos = vim.api.nvim_win_get_cursor(0)
              return pos[1] .. ":" .. (pos[2] + 1)
            end,
            padding = { left = 1, right = 1 },
          },
        },
      }
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
