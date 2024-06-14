return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.comment = "#848cb1"
      colors.fg_gutter = "#56608d"
      colors.border = "#4985e3"
      colors.diff.delete = "#ff0000"
      colors.none = "NONE"
    end,
    on_highlights = function(hl, c)
      hl.FloatBorder = {
        fg = c.none,
        bg = c.none,
      }
      hl.CursorLine = {
        bold = true,
      }
    end,
  },
}
