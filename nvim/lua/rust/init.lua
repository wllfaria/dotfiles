local M = {}

M.setup = function()
  require("rust.fold_tests")
  require("rust.cargo_check")
end

return M
