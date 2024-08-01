return {
  "AckslD/nvim-FeMaco.lua",
  cmd = { "FeMaco" },
  opts = {
    ft_from_lang = function (lang)
      if lang == "tikz" then
        return "tex"
      end
      if lang == "markdown_inline" then
        return "tex"
      end
      return lang
    end
  },
}
