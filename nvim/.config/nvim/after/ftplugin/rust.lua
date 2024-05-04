local function compile_some_rust()
  print 'cargo check...'
  vim.cmd 'silent make! check'
  vim.cmd 'redraw!'

  local qflist = vim.fn.getqflist()
  local error_count = 0
  local warning_count = 0

  if #qflist > 0 then
    local collect_err = 0
    local new_qf_list = {}

    for _, entry in ipairs(qflist) do
      if entry.type == 'W' and not entry.text:find '.*generated%s%d*%swarning' then
        warning_count = warning_count + 1
        collect_err = 0
      end

      if entry.type == 'E' then
        collect_err = 1
        error_count = error_count + 1
      end

      if collect_err == 1 then table.insert(new_qf_list, entry) end
    end

    vim.fn.setqflist(new_qf_list)
  end

  if error_count > 0 then
    if vim.fn.tabpagewinnr(vim.fn.tabpagenr(), '$') > 1 then
      vim.cmd 'botright copen 6'
    else
      vim.cmd 'copen 6'
    end
    vim.cmd 'wincmd p'
    vim.cmd 'cfirst'
  else
    vim.cmd 'cclose'
  end

  local err_out = "echo 'E: " .. error_count .. "'"
  if error_count > 0 then err_out = "echohl ToggleRustErr | echo 'E: " .. error_count .. "' | echohl None" end

  local warn_out = " | echon ' | W: " .. warning_count .. "'"
  if warning_count > 0 then
    warn_out = "| echon ' | ' | echohl ToggleRustWarn | echon 'W: " .. warning_count .. "' | echohl None"
  end

  vim.cmd(err_out .. warn_out)
end

local function debug_project()
  local path_fragments = vim.fn.split(vim.fn.getcwd(), '/')
  local project_name = path_fragments[#path_fragments]
  local bin_dir = 'target/debug/'
  local bin_path = bin_dir .. project_name

  -- If there is no 'target/debug' perhaps this is a workspace?
  -- Try the parent dir
  if not vim.fn.filereadable(bin_dir .. project_name) then bin_path = '../target/debug/' .. project_name end

  if vim.fn.filereadable(bin_path) then
    local command = ':Termdebug ' .. bin_path
    vim.cmd(command)

    vim.cmd 'wincmd p'
  end
end

local function run_debugger_from_main()
  print 'building ...'
  -- Build project to ensure we have target/debug
  local command = 'cargo build'
  local _ = vim.fn.system(command)
  debug_project()
end

local function find_test_executable(test_func_name)
  local command = 'cargo test --all-features --test ' .. test_func_name .. ' -v'
  local test_output = vim.fn.systemlist(command)
  test_output = vim.fn.reverse(test_output)

  print(vim.inspect(test_output))

  local use_next = 0
  for _, line in ipairs(test_output) do
    if string.find(string.lower(line), 'running') then
      local fragments = vim.fn.split(line, ' ')

      if use_next > 0 then return string.sub(fragments[1], 2) end

      if tonumber(fragments[2]) > 0 then
        use_next = 1
      else
        vim.cmd 'echo "no tests to run"'
        return ''
      end
    end
  end

  return ''
end

local function find_test_function_under_cursor()
  local cursor_line = vim.fn.line '.'

  -- Find #[test] attribute
  if vim.fn.search('\\m\\C#\\[test\\]', 'bcW') == 0 then return '' end

  -- Move to an opening brace of the test function
  local test_func_line = vim.fn.search('\\m\\C^\\s*fn\\s\\+\\h\\w*\\s*(.\\+{$', 'eW')
  if test_func_line == 0 then return '' end

  -- Search the end of test function (closing brace) to ensure that the
  -- cursor position is within function definition
  vim.cmd 'normal! %'
  if vim.fn.line '.' < cursor_line then return '' end

  return vim.fn.matchstr(vim.fn.getline(test_func_line), '\\m\\C^\\s*fn\\s\\+\\zs\\h\\w*')
end

local function run_debugger()
  local line_nr = vim.fn.line '.'
  local test_func_name = find_test_function_under_cursor()

  if #test_func_name > 0 then
    local test_bin_path = find_test_executable(test_func_name)
    if test_bin_path ~= '' then
      local command = ':Termdebug ' .. test_bin_path
      vim.cmd(command)
    end
  else
    run_debugger_from_main()
  end

  vim.cmd 'wincmd p'
  vim.cmd 'normal k'
  -- Jump to the line number where the debug was called from
  local jump_command = ':' .. line_nr
  vim.cmd(jump_command)
end

local function run_debug_and_break()
  -- Set a breakpoint if the debugger is running
  -- otherwise start the debugger and then set the breakpoint
  if vim.g.TermDebugging > 0 then
    vim.cmd ':Break'
  else
    run_debugger_from_main()
    vim.cmd ':Break'
    vim.cmd ':Run'
  end
end

vim.api.nvim_create_user_command('Compile', function() compile_some_rust() end, {})
vim.api.nvim_create_user_command('DebugTest', function() run_debugger() end, {})
vim.api.nvim_create_user_command('DebugMain', function() run_debugger_from_main() end, {})
vim.api.nvim_create_user_command('DebugAndBreak', function() run_debug_and_break() end, {})

vim.g.rustfmt_command = 'rustfmt +nightly'
vim.g.termdebugger = 'rust-gdb'
vim.g.termdebug_useFloatingHover = 0
vim.opt.textwidth = 99

vim.keymap.set('n', '<leader>d', ':DebugMain<CR>')
vim.keymap.set('n', '<leader>b', ':DebugAndBreak<CR>')
vim.keymap.set('n', ';', ':Over<CR>')
vim.keymap.set('n', '<leader>;', ':Step<CR>')
vim.keymap.set('n', '<leader>fmt', function() vim.cmd 'RustFmt' end)
vim.keymap.set('n', '<C-B>', function() vim.cmd 'Compile' end)
vim.keymap.set('n', '<leader>rt', function() vim.cmd 'RustTest' end)
vim.keymap.set('n', '<leader>tt', function() vim.cmd 'DebugTest' end)
