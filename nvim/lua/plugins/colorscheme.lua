return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
  },

  {
    "loctvl842/monokai-pro.nvim",
  },

  {
    "LazyVim/LazyVim",
    opts = function()
      local is_dark = true

      -- macOS 시스템 테마 감지
      local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")

      if handle then
        local result = handle:read("*a")
        handle:close()

        is_dark = result:match("Dark") ~= nil
      end

      if is_dark then
        vim.g.catppuccin_flavour = "frappe"

        return {
          colorscheme = "catppuccin",
        }
      else
        return {
          colorscheme = "monokai-pro-light",
        }
      end
    end,
  },
}
