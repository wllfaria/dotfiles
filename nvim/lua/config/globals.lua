P = function(v)
  print(vim.inspect(v))
  return v
end

local function reload_module(module_name, starts_with_only)
  if starts_with_only == nil then starts_with_only = true end

  local matcher
  if not starts_with_only then
    matcher = function(pack) return string.find(pack, module_name, 1, true) end
  else
    local module_name_pattern = vim.pesc(module_name)
    matcher = function(pack) return string.find(pack, "^" .. module_name_pattern) end
  end

  local luacache = (_G.__luacache or {}).cache

  for pack, _ in pairs(package.loaded) do
    if matcher(pack) then
      package.loaded[pack] = nil

      if luacache then luacache[pack] = nil end
    end
  end
end

RELOAD = function(...) return reload_module(...) end

R = function(name)
  RELOAD(name)
  return require(name)
end
