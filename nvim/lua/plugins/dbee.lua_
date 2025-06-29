return {
  "kndndrj/nvim-dbee",
  dependencies = { "MunifTanjim/nui.nvim" },
  build = function() require("dbee").install() end,
  opts = {},
  keys = {
    { "<leader>pg", function() require("dbee").toggle() end },
    {
      "<leader>eq",
      mode = { "n", "v" },
      function()
        local mode = vim.api.nvim_get_mode().mode
        local query = ""

        if mode == "v" or mode == "V" then
          local start_pos = vim.fn.getpos("v")
          local end_pos = vim.fn.getpos(".")
          local lines = vim.api.nvim_buf_get_lines(0, start_pos[2] - 1, end_pos[2], false)
          query = table.concat(lines, "\n")
        else
          query = vim.api.nvim_get_current_line()
        end

        if not require("dbee").is_open() then return end

        require("dbee").execute(query)
      end,
    },
  },
  init = function() end,
}
