require("luasnip.session.snippet_collection").clear_snippets("rust")

local ls = require("luasnip")

local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("rust", {
  s("dd", fmt("#[derive(Debug)]", {})),
  s("st", fmt("pub struct {} {{ {} }}", { i(1), i(0) })),
  s(
    "stn",
    fmt(
      [[pub struct {} {{}}
impl {} {{
    pub fn new() -> Self {{
        Self {{ }}
    }}
}}]],
      { i(1, "Name"), i(2, "Name") }
    )
  ),
  s(
    "ts",
    fmt(
      [[#[cfg(test)]
mod tests {{
    use super::*;
    {}
}}
    ]],
      { i(1) }
    )
  ),
})
