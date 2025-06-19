-- I screenshare way too often and I don't want to leak my env variables lol

local env_buf = -1
local floating_buf = -1
local floating_win = -1
local is_closing = false

---@param text string The text to center
---@param width integer The total width to center within
---@return string
local function pad_left(text, width)
  local text_width = vim.fn.strdisplaywidth(text)
  local padding = math.max(0, math.floor((width - text_width) / 2))
  return string.rep(" ", padding) .. text
end

---@return integer, integer
local function open_floating_window()
  local floating_buf = vim.api.nvim_create_buf(false, true)
  local floating_win = vim.api.nvim_open_win(floating_buf, true, {
    width = 60,
    height = 6,
    row = math.floor(((vim.o.lines - 6) / 2) - 1),
    col = math.floor((vim.o.columns - 60) / 2),
    style = "minimal",
    relative = "editor",
    border = "rounded",
  })

  return floating_buf, floating_win
end

local function hide_env()
  if env_buf ~= -1 then return end
  env_buf = vim.api.nvim_get_current_buf()

  -- move to an empty buffer to hide the env variables
  local empty_bg_buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_set_current_buf(empty_bg_buf)

  floating_buf, floating_win = open_floating_window()

  local messages = {
    "",
    "Oops",
    "",
    "Careful with screensharing",
    "Don't leak these again please",
    "",
  }

  local centered_messages = {}
  for _, msg in ipairs(messages) do
    table.insert(centered_messages, pad_left(msg, 60))
  end

  vim.api.nvim_buf_set_lines(floating_buf, 0, -1, false, centered_messages)

  vim.api.nvim_buf_set_keymap(
    floating_buf,
    "n",
    "<leader>y",
    -- close window and buffer, moving back to the original buffer
    ":ShowEnvBuffer<CR>",
    { noremap = true, silent = true }
  )

  vim.api.nvim_buf_set_keymap(
    floating_buf,
    "n",
    "<leader>n",
    -- close window and buffer, but also delete the env buffer, so it doesn't show up again
    ":CloseEnvBuffer<CR>",
    -- ":q<CR>:bd<CR>",
    { noremap = true, silent = true }
  )

  -- close the env buffer if we leave the floating window for some reason
  vim.api.nvim_create_autocmd({ "BufLeave", "WinLeave" }, {
    buffer = floating_buf,
    callback = function()
      if not is_closing then vim.api.nvim_buf_delete(floating_buf, { force = true }) end
    end,
  })
end

vim.api.nvim_create_user_command("ShowEnvBuffer", function()
  is_closing = true
  if vim.api.nvim_win_is_valid(floating_win) then vim.api.nvim_win_close(floating_win, true) end
  if vim.api.nvim_buf_is_valid(floating_buf) then vim.api.nvim_buf_delete(floating_buf, { force = true }) end
  vim.api.nvim_set_current_buf(env_buf)

  env_buf = -1
  floating_buf = -1
  floating_win = -1

  vim.defer_fn(function() is_closing = false end, 100)
end, { desc = "Close env warning and show the env buffer" })

vim.api.nvim_create_user_command("CloseEnvBuffer", function()
  is_closing = true
  if vim.api.nvim_win_is_valid(floating_win) then vim.api.nvim_win_close(floating_win, true) end
  if vim.api.nvim_buf_is_valid(floating_buf) then vim.api.nvim_buf_delete(floating_buf, { force = true }) end

  env_buf = -1
  floating_buf = -1
  floating_win = -1
  vim.defer_fn(function() is_closing = false end, 100)
end, {
  desc = "Close env warning and hide the env buffer",
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter" }, {
  -- anything that has a .env in the name in any location
  pattern = "*.env*",
  callback = hide_env,
})
