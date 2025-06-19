---Normalized representation of rows containing a test function for folding.
---
---rows are already incremented by one to account for the visual representation of the row.
---@class RowRange
---@field start_row integer
---@field end_row integer

---utility to match only against common attributes for test modules
local module_test_patterns = { "#%[cfg%(test%)%]" }

---utility to match only against common attributes for test functions
local function_test_patterns = { "#%[test%]", "#%[sqlx::test%]", "#%[tokio::test%]" }

---@param root TSNode
---@return TSNode[]
local function get_attribute_nodes(root)
  local attribute_nodes = {}

  -- finds every attribute_item node on the source program
  -- attribute_items are nodes like `#[cfg(test)]`, `#[test]` and `#[derive(Debug)]`
  for node, _ in root:iter_children() do
    if node:type() == "attribute_item" then table.insert(attribute_nodes, node) end
  end

  return attribute_nodes
end

---Attempts to find the test attribute in a given list of attribute nodes.
---@param attribute_nodes TSNode[]
---@param buffer integer
---@return TSNode[]
local function find_test_modules(attribute_nodes, buffer)
  ---@type TSNode[]
  local test_modules = {}

  for _, node in ipairs(attribute_nodes) do
    local text = vim.treesitter.get_node_text(node, buffer)

    for _, pattern in ipairs(module_test_patterns) do
      if not text:match(pattern) then goto continue end

      local next_node = node:next_sibling()
      if not next_node then goto continue end

      local text = vim.treesitter.get_node_text(next_node, buffer)
      if text:match("mod") then table.insert(test_modules, next_node) end

      ::continue::
    end
  end

  return test_modules
end

---Collects every test node in a given test module.
---@param node TSNode
---@param buffer integer
---@return RowRange[]
local function find_tests_in_module(node, buffer)
  ---@type RowRange[]
  local test_functions = {}

  for node, _ in node:iter_children() do
    -- skip over block name
    if node:type() ~= "declaration_list" then goto outer end

    for node, _ in node:iter_children() do
      local text = vim.treesitter.get_node_text(node, buffer)

      --inside of the module body, we want to find all attributes that match common test patterns.
      --and for each one, check the following siblings until we find a function_item.
      for _, pattern in ipairs(function_test_patterns) do
        if not text:match(pattern) then goto inner end

        local next_node = node:next_sibling()
        --we need to continuously check the siblings because besides having the test pattern, it could
        --also have more attributes, like `#[should_panic]`.
        while next_node and next_node:type() == "attribute_item" do
          next_node = next_node:next_sibling()
        end

        --if we find anything that is not an attribute or a function_item, we can skip this declaration
        if not next_node or next_node:type() ~= "function_item" then goto inner end

        local test_start_row, _, _ = node:start()
        local test_end_row, _, _ = next_node:end_()

        local row_range = { start_row = test_start_row + 1, end_row = test_end_row + 1 }
        table.insert(test_functions, row_range)

        ::inner::
      end
    end

    ::outer::
  end

  return test_functions
end

local function simple_test()
  local buffer = vim.api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(buffer, "rust")
  if not parser then return end

  local tree = parser:parse()
  if not tree then return end

  local root = tree[1]:root()

  local attribute_nodes = get_attribute_nodes(root)
  local test_modules = find_test_modules(attribute_nodes, buffer)

  for _, node in ipairs(test_modules) do
    local module_start_row, _, _ = node:start()
    local module_end_row, _, _ = node:end_()

    local module_range = { start_row = module_start_row + 1, end_row = module_end_row + 1 }
    local test_ranges = find_tests_in_module(node, buffer)

    for _, range in ipairs(test_ranges) do
      vim.cmd(string.format("%d,%dfold", range.start_row, range.end_row))
    end
    vim.cmd(string.format("%d,%dfold", module_range.start_row, module_range.end_row))
  end
end

simple_test()
