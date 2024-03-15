local palette = require("colors.lucky.palette")

local M = {}

--- @alias ThemeStyle vim.api.keyset.highlight

--- @alias ThemeGroup table<string, ThemeStyle>

--- @param config ThemeConfig
--- @return ThemeGroup
M.lsp = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		LspDiagnosticsSignError = { fg = colors.red_bright },
		LspDiagnosticsSignHint = { fg = colors.purple_bright },
		LspDiagnosticsSignInfo = { fg = colors.blue_bright },
		LspDiagnosticsSignWarn = { fg = colors.red_bright },
		LspReferenceRead = { bg = colors.bg2, bold = true, fg = colors.teal },
		LspReferenceText = { bg = colors.bg2, bold = true, fg = colors.purple_bright },
		LspReferenceWrite = { bg = colors.bg2, bold = true, fg = colors.purple },
		LspSignatureActiveParameter = { bg = colors.bg2, bold = true, fg = colors.green_bright },
		["@lsp.type.boolean"] = { link = "@boolean" },
		["@lsp.type.builtinType"] = { link = "@type.builtin" },
		["@lsp.type.comment"] = { link = "@comment" },
		["@lsp.type.enum"] = { link = "@type" },
		["@lsp.type.enumMember"] = { link = "@constant" },
		["@lsp.type.escapeSequence"] = { link = "@string.escape" },
		["@lsp.type.formatSpecifier"] = { link = "@punctuation.special" },
		["@lsp.type.interface"] = { link = "Structur" },
		["@lsp.type.keyword"] = { link = "@keywor" },
		["@lsp.type.namespace"] = { link = "@namespac" },
		["@lsp.type.number"] = { link = "@number" },
		["@lsp.type.operator"] = { link = "@operator" },
		["@lsp.type.parameter"] = { link = "@parameter" },
		["@lsp.type.property"] = { link = "@property" },
		["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
		["@lsp.type.typeAlias"] = { link = "@type.definition" },
		["@lsp.type.unresolvedReference"] = { link = "@error" },
		["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
		["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
		["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
		["@lsp.typemod.operator.injected"] = { link = "@operator" },
		["@lsp.typemod.string.injected"] = { link = "@string" },
		["@lsp.typemod.type.defaultLibrary"] = { link = "@type.builtin" },
		["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
		["@lsp.typemod.variable.injected"] = { link = "@variable" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.statusline = function(config)
	local colors = palette[config.variant]
	return {
		StatusLineModeNormal = { bg = colors.purple, fg = colors.white },
		StatusLineNormalSeparator = { bg = nil, fg = colors.purple },
		StatusLineModeCommand = { bg = colors.red, fg = colors.white },
		StatusLineCommandSeparator = { bg = nil, fg = colors.red },
		StatusLineModeInsert = { bg = colors.blue, fg = colors.white },
		StatusLineInsertSeparator = { bg = nil, fg = colors.blue },
		StatusLineModeVisual = { bg = colors.green, fg = colors.white },
		StatusLineVisualSeparator = { bg = nil, fg = colors.green },
		StatusLineGitBranch = { bg = nil, fg = colors.green },
		StatusLineFilename = { bg = nil, fg = colors.fg2 },
		StatusLineCursor = { bg = nil, fg = colors.green },
		StatusLineCursorPercent = { bg = nil, fg = colors.purple },

		FiletypeLua = { bg = nil, fg = colors.blue },
		FiletypeRust = { bg = nil, fg = colors.yellow },
		FiletypeJs = { bg = nil, fg = colors.yellow },
		FiletypeTs = { bg = nil, fg = colors.blue },
		FiletypeOcaml = { bg = nil, fg = colors.yellow },
		FiletypeC = { bg = nil, fg = colors.blue },
		FiletypeGo = { bg = nil, fg = colors.blue },
		FiletypeDir = { bg = nil, fg = colors.yellow },
		FiletypeNone = { bg = nil, fg = colors.red },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.defaults = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		Title = { bold = true, fg = colors.blue },
		LazyProp = { bg = colors.bg1, fg = colors.blue },
		AlphaButtonLabelText = { fg = colors.yellow_bright },
		AlphaFooting = { bold = true, fg = colors.purple_bright },
		AlphaHeading = { fg = colors.bg1 },
		AlphaKeyPrefix = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		AlphaLoaded = { fg = colors.bg2 },
		AlphaScroll = { fg = colors.purple_bright },
		Bold = { bold = true },
		BookmarkAnnotationLine = { fg = colors.purple_bright },
		BookmarkAnnotationSign = { fg = colors.purple_bright },
		BookmarkLine = { bg = colors.bg2 },
		BookmarkSign = { fg = colors.red },
		Boolean = { bold = true, fg = colors.red },
		BufferLineBackground = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineBuffer = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineBufferSelected = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		BufferLineBufferVisible = { bg = colors.bg1, fg = colors.blue_bright },
		BufferLineCloseButton = { bg = colors.bg1, fg = colors.red },
		BufferLinecloseButtonSelected = { bg = colors.blue_bright, fg = colors.bg },
		BufferLineCloseButtonVisible = { bg = colors.bg1, fg = colors.red },
		BufferLineDuplicate = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineDuplicateSelected = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineDuplicateVisible = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineFill = { bg = colors.bg, fg = colors.bg1 },
		BufferLineIndicatorSelected = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLineIndicatorVisible = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineModified = { bg = colors.bg1, fg = colors.green_bright },
		BufferLineModifiedSelected = { bg = colors.blue_bright, fg = colors.bg },
		BufferLineModifiedVisible = { bg = colors.bg1, fg = colors.green_bright },
		BufferLineOffsetSeparator = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLinePick = { bg = colors.bg1, bold = true, fg = colors.purple },
		BufferLinePickSelected = { bg = colors.blue_bright, bold = true, fg = colors.yellow_bright },
		BufferLinePickVisible = { bg = colors.bg1, bold = true, fg = colors.yellow },
		BufferLineSeparator = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineSeparatorSelected = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLineSeparatorVisible = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabClose = { bg = colors.bg, fg = colors.red },
		BufferLineTab = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabSelected = { bg = colors.bg, bold = true, fg = colors.blue_bright },
		BufferLineTabSeparator = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabSeparatorSelected = { fg = colors.bg },
		Character = { fg = colors.yellow_bright },
		ColorColumn = { bg = colors.bg, fg = colors.bg2 },
		Comment = { fg = colors.fg2 },
		Conceal = { fg = colors.bg2 },
		Conditional = { fg = colors.red },
		Constant = { fg = colors.red },
		CursorColumn = { bg = colors.bg1 },
		Cursor = { bg = colors.yellow_bright, fg = colors.bg },
		CursorLineFold = { bg = colors.bg, fg = colors.teal_bright },
		CursorLine = { bg = colors.bg1 },
		CursorLineNr = { bold = true, fg = colors.yellow_bright },
		CursorLineSign = { bg = colors.bg },
		Debug = { fg = colors.red_bright },
		Decorator = { fg = colors.yellow_bright },
		Define = { fg = colors.purple_bright },
		Delimeter = { fg = colors.blue_bright },
		Delimiter = { fg = colors.red_bright },
		DiagnosticError = { fg = colors.red },
		DiagnosticFloatingError = { fg = colors.red },
		DiagnosticFloatingHint = { fg = colors.purple_bright },
		DiagnosticFloatingInfo = { fg = colors.blue_bright },
		DiagnosticFloatingWarn = { fg = colors.red_bright },
		DiagnosticHint = { fg = colors.purple_bright },
		DiagnosticInfo = { fg = colors.blue_bright },
		DiagnosticSignError = { fg = colors.red_bright },
		DiagnosticSignHint = { fg = colors.purple_bright },
		DiagnosticSignInfo = { fg = colors.blue_bright },
		DiagnosticSignWarn = { fg = colors.red_bright },
		DiagnosticUnderlineError = { fg = colors.red },
		DiagnosticUnderlineHint = { fg = colors.purple_bright },
		DiagnosticUnderlineInfo = { fg = colors.blue_bright },
		DiagnosticUnderlineWarn = { fg = colors.red_bright },
		DiagnosticVirtualTextError = { fg = colors.red },
		DiagnosticVirtualTextHint = { fg = colors.purple_bright },
		DiagnosticVirtualTextInfo = { fg = colors.blue_bright },
		DiagnosticVirtualTextWarn = { fg = colors.red_bright },
		DiagnosticWarn = { fg = colors.red_bright },
		Directory = { fg = colors.yellow_bright },
		EndOfBuffer = { fg = colors.purple_bright },
		Error = { fg = colors.red },
		ErrorMsg = { fg = colors.red, bg = colors.bg },
		Exception = { fg = colors.green },
		FidgetTask = { fg = colors.bg1 },
		FidgetTitle = { bold = true, fg = colors.green },
		FloatBorder = { bg = colors.bg1, fg = colors.bg1 },
		Float = { fg = colors.pink },
		FloatShadow = { bg = colors.black, blend = 80 },
		FloatShadowThrough = { bg = colors.black, blend = 100 },
		FocusedSymbol = { bg = colors.fg2, fg = colors.pink },
		FoldColumn = { bg = colors.bg, fg = colors.teal_bright },
		Folded = { bg = colors.bg, fg = colors.bg2 },
		Function = { fg = colors.purple },
		HighlightUrl = { fg = colors.teal_bright, undercurl = true },
		HlSearchFloat = { bg = colors.bg, fg = colors.pink_bright },
		HlSearchLens = { bg = colors.bg, fg = colors.blue },
		HlSearchLensNear = { bg = "#FFE28F", bold = true, fg = colors.bg },
		HlSearchNear = { bg = colors.bg, bold = true, fg = colors.green_bright },
		Identifier = { fg = colors.green },
		Include = { bold = true, fg = colors.blue },
		IncSearch = { bg = colors.teal_bright, fg = colors.bg },
		IndentBlanklineChar = { fg = colors.bg1 },
		IndentBlanklineContextChar = { fg = colors.blue_bright },
		IndentBlanklineContextStart = { bg = colors.bg1 },
		Italic = { italic = true },
		JaqBorder = { bg = colors.bg2 },
		JaqWin = { bg = colors.bg2 },
		Keyword = { fg = colors.blue },
		Label = { fg = colors.red },
		LightBulbFloatWin = { fg = colors.yellow },
		LightBulbSign = { fg = colors.yellow_bright },
		LightBulbVirtualText = { fg = colors.yellow_bright },
		LineNrAbove = { fg = colors.bg2 },
		LineNrBelow = { fg = colors.bg2 },
		LineNr = { fg = colors.bg2 },
		Macro = { fg = colors.red_bright },
		MatchBackground = { bg = colors.bg, fg = colors.bg1 },
		MatchParenCur = { bg = colors.bg1, bold = true },
		MatchParen = { bg = colors.bg1, bold = true },
		MatchWord = { bg = colors.bg1, bold = true },
		ModeMsg = { bold = true, fg = colors.blue_bright },
		monarkCommand = { fg = colors.blue },
		monarkInsert = { fg = colors.blue_bright },
		monarkNormal = { fg = colors.green_bright },
		monarkReplace = { fg = colors.purple_bright },
		MonarkSelect = { fg = colors.teal },
		MonarkTerminal = { fg = colors.teal },
		MonarkVisualBlock = { fg = colors.yellow },
		monarkVisual = { fg = colors.yellow_bright },
		MonarkVisualLine = { fg = colors.red },
		MoreMsg = { fg = colors.yellow_bright },
		MsgArea = { fg = colors.teal_bright },
		MsgSeparator = { fg = colors.purple_bright },
		NonText = { fg = colors.bg2 },
		NormalFloat = { bg = colors.bg1, fg = colors.fg2 },
		Normal = transparent and { bg = nil, fg = colors.fg2 } or { bg = colors.bg, fg = colors.fg2 },
		Number = { fg = colors.teal },
		NvimUnaryMinus = { fg = colors.teal_bright },
		NvimUnaryOperator = { fg = colors.teal_bright },
		NvimUnaryPlus = { fg = colors.teal_bright },
		Operator = { fg = colors.teal_bright },
		Pmenu = { bg = colors.bg1, fg = colors.fg2 },
		PmenuSbar = { bg = colors.bg1, fg = colors.fg2 },
		PmenuSel = { bg = colors.bg1, fg = colors.fg2 },
		PmenuThumb = { bg = colors.bg1 },
		PreCondit = { fg = colors.red },
		PreProc = { fg = colors.red },
		Question = { fg = colors.green_bright },
		QuickFixLine = { bg = colors.yellow_bright, fg = colors.bg },
		RedrawDebugClear = { bg = colors.yellow },
		RedrawDebugComposed = { bg = colors.green },
		RedrawDebugNormal = { reverse = true },
		RedrawDebugRecompose = { bg = colors.red },
		Repeat = { fg = colors.purple },
		RnvimrCurses = { bg = colors.bg, fg = colors.fg2 },
		RnvimrNormal = { bg = colors.bg1, fg = colors.teal_bright },
		Search = { bg = colors.yellow_bright, fg = colors.bg },
		SignColumn = transparent and { bg = nil } or { bg = colors.bg },
		SpecialChar = { fg = colors.purple_bright },
		SpecialComment = { fg = colors.yellow_bright },
		Special = { fg = colors.red_bright },
		SpecialKey = { bold = true, fg = colors.yellow_bright },
		SpellBad = { fg = colors.red },
		SpellCap = { fg = colors.yellow },
		SpellLocal = { fg = colors.red_bright },
		SpellRare = { fg = colors.teal },
		Statement = { fg = colors.red },
		StatusLine = { fg = colors.bg1, bg = colors.blue_bright },
		StatusLineNC = { fg = colors.blue_bright, bg = colors.bg },
		StorageClass = { fg = colors.red_bright },
		String = { fg = colors.green_bright },
		Structure = { fg = colors.blue },
		Substitute = { bg = colors.purple, fg = colors.bg },
		TabLine = { bg = colors.bg, bold = true, fg = colors.bg1 },
		TabLineFill = { fg = colors.bg, bg = colors.blue_bright },
		TabLineSel = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		Tag = { fg = colors.blue_bright },
		TermCursor = { reverse = true },
		VertSplit = { fg = colors.bg1 },
		VirtColumn = { bg = colors.bg, fg = colors.bg1 },
		Visual = { bg = colors.bg2 },
		WarningMsg = { fg = colors.red_bright },
		Whitespace = { fg = colors.bg1 },
		WildMenu = { bg = colors.blue_bright, fg = colors.bg },
		WinBar = { bold = true },
		WinBarNC = { bold = true },
		WinSeparator = { fg = colors.bg1 },
		Typedef = { fg = colors.purple_bright },
		Type = { fg = colors.red },
		Underlined = { undercurl = true },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.diffview = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		DiffAdd = { fg = colors.green_bright, reverse = true },
		DiffChange = { fg = colors.purple_bright, reverse = true },
		DiffDelete = { fg = colors.red, reverse = true },
		DiffText = { fg = colors.blue_bright, reverse = true },
		DiffviewCursorLine = { bg = colors.bg1 },
		DiffviewDiffAddAsDelete = { fg = colors.red, reverse = true },
		DiffviewDiffDelete = { fg = colors.fg2 },
		DiffviewDim1 = { fg = colors.fg2 },
		DiffviewEndOfBuffer = { fg = colors.purple_bright },
		DiffviewFilePanelConflicts = { fg = colors.red_bright },
		DiffviewFilePanelCounter = { bold = true, fg = colors.green },
		DiffviewFilePanelFileName = { fg = colors.fg2 },
		DiffviewFilePanelPath = { fg = colors.fg2 },
		DiffviewFilePanelRootPath = { bold = true, fg = colors.red },
		DiffviewFilePanelSelected = { fg = colors.red },
		DiffviewFilePanelTitle = { bold = true, fg = colors.red },
		DiffviewFolderName = { fg = colors.yellow_bright },
		DiffviewFolderSign = { fg = colors.red_bright },
		DiffviewNonText = { fg = colors.bg1 },
		DiffviewNormal = { bg = colors.bg, fg = colors.fg2 },
		DiffviewPrimary = { fg = colors.purple_bright },
		DiffviewReference = { fg = colors.purple_bright },
		DiffviewSecondary = { fg = colors.green_bright },
		DiffviewSignColumn = { bg = colors.bg, fg = colors.fg2 },
		DiffviewStatusIgnored = { fg = colors.fg2 },
		DiffviewStatusLine = { bg = colors.bg, fg = colors.blue_bright },
		DiffviewStatusLineNC = { fg = colors.blue_bright },
		DiffviewWinSeparator = { fg = colors.bg1 },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.cmp = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		CmpItemAbbrDeprecated = { fg = colors.bg2 },
		CmpItemAbbr = { fg = colors.fg2 },
		CmpItemAbbrMatchFuzzy = { fg = colors.yellow },
		CmpItemAbbrMatch = { fg = colors.green_bright },
		CmpItemKindClass = { fg = colors.red },
		CmpItemKindColor = { fg = colors.blue_bright },
		CmpItemKindConstant = { fg = colors.red },
		CmpItemKindConstructor = { fg = colors.blue },
		CmpItemKindEnum = { fg = colors.teal },
		CmpItemKindEnumMember = { fg = colors.purple },
		CmpItemKindEvent = { fg = colors.blue },
		CmpItemKindField = { fg = colors.yellow_bright },
		CmpItemKindFile = { fg = colors.yellow },
		CmpItemKindFolder = { fg = colors.yellow },
		CmpItemKindFunction = { fg = colors.purple },
		CmpItemKind = { fg = colors.bg2 },
		CmpItemKindInterface = { fg = colors.purple_bright },
		CmpItemKindKeyword = { fg = colors.blue },
		CmpItemKindMethod = { fg = colors.red },
		CmpItemKindModule = { fg = colors.blue },
		CmpItemKindOperator = { fg = colors.teal_bright },
		CmpItemKindProperty = { fg = colors.teal },
		CmpItemKindReference = { fg = colors.red_bright },
		CmpItemKindSnippet = { fg = colors.yellow_bright },
		CmpItemKindStruct = { fg = colors.blue },
		CmpItemKindText = { fg = colors.blue },
		CmpItemKindTypeParameter = { fg = colors.yellow_bright },
		CmpItemKindUnit = { fg = colors.teal },
		CmpItemKindValue = { fg = colors.green_bright },
		CmpItemKindVariable = { fg = colors.green },
		CmpItemMenu = { fg = colors.blue_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.gitsigns = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		GitSignsAdd = { fg = colors.blue_bright },
		GitSignsAddInline = { reverse = true },
		GitSignsAddLn = { fg = colors.blue_bright },
		GitSignsAddLnInline = { reverse = true },
		GitSignsAddNr = { fg = colors.blue },
		GitSignsAddPreview = { fg = colors.green_bright, reverse = true },
		GitSignsChangedelete = { fg = colors.bg1 },
		GitSignsChangedeleteLn = { fg = colors.pink },
		GitSignsChangedeleteNr = { fg = colors.purple },
		GitSignsChange = { fg = colors.bg1 },
		GitSignsChangeInline = { reverse = true },
		GitSignsChangeLn = { fg = colors.pink_bright },
		GitSignsChangeLnInline = { reverse = true },
		GitSignsChangeNr = { fg = colors.purple },
		GitSignsCurrentLineBlame = { fg = colors.bg1 },
		GitSignsDelete = { fg = colors.red_bright },
		GitSignsDeleteInline = { reverse = true },
		GitSignsDeleteLn = { fg = colors.red },
		GitSignsDeleteLnInline = { reverse = true },
		GitSignsDeleteNr = { fg = colors.red_bright },
		GitSignsDeletePreview = { fg = colors.red, reverse = true },
		GitSignsDeleteVirtLn = { fg = colors.red, reverse = true },
		GitSignsDeleteVirtLnInLine = { reverse = true },
		GitSignsStagedAdd = { fg = colors.fg2 },
		GitSignsStagedAddLn = { fg = colors.fg2 },
		GitSignsStagedAddNr = { fg = colors.teal },
		GitSignsStagedChangedelete = { fg = colors.bg },
		GitSignsStagedChangedeleteLn = { fg = colors.fg2 },
		GitSignsStagedChangedeleteNr = { fg = colors.fg2 },
		GitSignsStagedChange = { fg = colors.bg },
		GitSignsStagedChangeLn = { fg = colors.fg2 },
		GitSignsStagedChangeNr = { fg = colors.fg2 },
		GitSignsStagedDelete = { fg = colors.red_bright },
		GitSignsStagedDeleteLn = { fg = colors.fg2 },
		GitSignsStagedDeleteNr = { fg = colors.red_bright },
		GitSignsStagedTopdelete = { fg = colors.red_bright },
		GitSignsStagedTopdeleteNr = { fg = colors.red_bright },
		GitSignsTopdelete = { fg = colors.red_bright },
		GitSignsTopdeleteNr = { fg = colors.red_bright },
		GitSignsUntracked = { fg = colors.blue_bright },
		GitSignsUntrackedLn = { fg = colors.blue_bright },
		GitSignsUntrackedNr = { fg = colors.blue },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.harpoon = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		HarpoonBorder = { bg = colors.bg1, fg = colors.bg1 },
		HarpoonCurrentFile = { bold = true, fg = colors.yellow_bright },
		HarpoonCursor = { bg = colors.bg, fg = colors.blue_bright },
		HarpoonTitle = { bg = colors.red, fg = colors.bg1 },
		HarpoonWindow = { bg = colors.bg1, fg = colors.fg2 },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.incline = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		InclineBG = { bg = colors.bg1 },
		InclineBGNC = { bg = colors.bg1 },
		InclineCursorLine = { bg = colors.bg1 },
		InclineCursorLineNC = { bg = colors.bg1 },
		InclineFG = { fg = colors.fg2 },
		InclineFGNC = { fg = colors.purple_bright },
		InclineNormal = { bg = colors.bg1, fg = colors.fg2 },
		InclineNormalNC = { bg = colors.bg1, fg = colors.fg2 },
		InclineThemeBG = { bg = colors.yellow_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.lua = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		luaCommentDelimiter = { fg = colors.fg2 },
		luaComment = { fg = colors.fg2 },
		luaCondElse = { fg = colors.red },
		luaCond = { fg = colors.red },
		luaConstant = { fg = colors.red },
		luaError = { fg = colors.red },
		luaFor = { fg = colors.purple },
		luaFunc = { fg = colors.green },
		luaFunction = { fg = colors.purple },
		luaLabel = { fg = colors.red },
		luaMetaMethod = { fg = colors.purple },
		luaNumber = { fg = colors.teal },
		luaOperator = { fg = colors.teal_bright },
		luaParenError = { fg = colors.red },
		luaRepeat = { fg = colors.purple },
		luaSpecial = { fg = colors.purple_bright },
		luaStatement = { fg = colors.red },
		luaString2 = { fg = colors.green_bright },
		luaStringDelimiter = { fg = colors.green_bright },
		luaString = { fg = colors.green_bright },
		luaSymbolOperator = { fg = colors.teal_bright },
		luaTable = { fg = colors.blue },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.navic = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		NavicIconsArray = { fg = colors.yellow },
		NavicIconsBoolean = { bold = true, fg = colors.red },
		NavicIconsClass = { fg = colors.red_bright },
		NavicIconsConstant = { bold = true, fg = colors.red },
		NavicIconsConstructor = { fg = colors.blue },
		NavicIconsEnum = { fg = colors.blue_bright },
		NavicIconsEnumMember = { fg = colors.red },
		NavicIconsEvent = { fg = colors.green },
		NavicIconsField = { fg = colors.green },
		NavicIconsFile = { fg = colors.yellow_bright },
		NavicIconsFunction = { fg = colors.purple },
		NavicIconsInterface = { fg = colors.red },
		NavicIconsKey = { fg = colors.red },
		NavicIconsMethod = { fg = colors.purple },
		NavicIconsModule = { fg = colors.red_bright },
		NavicIconsNull = { bold = true, fg = colors.yellow },
		NavicIconsNumber = { fg = colors.teal },
		NavicIconsObject = { fg = colors.yellow },
		NavicIconsOperator = { fg = colors.teal_bright },
		NavicIconsPackage = { bold = true, fg = colors.teal },
		NavicIconsProperty = { fg = colors.teal },
		NavicIconsString = { fg = colors.green_bright },
		NavicIconsStruct = { fg = colors.blue },
		NavicIconsTypeParameter = { fg = colors.yellow_bright },
		NavicIconsVariable = { bold = true, fg = colors.red },
		NavicSeparator = { fg = colors.blue_bright },
		NavicText = { fg = colors.fg2 },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.neogit = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		NeogitBranch = { bold = true, fg = colors.green },
		NeogitCommitViewHeader = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		NeogitDiffAdd = transparent and { bg = nil, fg = colors.blue_bright } or { bg = "#16191D", fg = "#7AB0DF" },
		NeogitDiffAddHighlight = transparent and { bg = nil, fg = colors.blue_bright }
			or { bg = "#16191D", fg = "#7AB0DF" },
		NeogitDiffContextHighlight = { bg = "#1A1D24" },
		NeogitDiffDelete = transparent and { bg = nil, fg = colors.red } or { bg = "#1C1F22", fg = "#F87070" },
		NeogitDiffDeleteHighlight = transparent and { bg = nil, fg = colors.red }
			or { bg = "#1C1F22", fg = colors.red },
		NeogitFilePath = { fg = colors.teal_bright },
		NeogitFold = { bg = colors.bg, fg = colors.teal },
		NeogitHunkHeader = { bg = "#171C21", fg = colors.yellow_bright },
		NeogitHunkHeaderHighlight = { bg = colors.yellow_bright, fg = colors.bg },
		NeogitNotificationError = { bg = colors.bg, fg = colors.red },
		NeogitNotificationInfo = { bg = colors.bg, fg = colors.blue_bright },
		NeogitNotificationWarning = { bg = colors.bg, fg = colors.yellow_bright },
		NeogitObjectId = { fg = colors.purple_bright },
		NeogitRebaseDone = { bold = true, fg = colors.green_bright },
		NeogitRebasing = { bold = true, fg = colors.yellow_bright },
		NeogitRecentcommits = { bold = true, fg = colors.green_bright },
		NeogitRemote = { bold = true, fg = colors.yellow },
		NeogitStagedchanges = { bold = true, fg = colors.yellow_bright },
		NeogitStashes = { bold = true, fg = colors.teal_bright },
		NeogitStash = { fg = colors.teal_bright },
		NeogitUnmergedchanges = { bold = true, fg = colors.green },
		NeogitUnmergedInto = { fg = colors.blue_bright },
		NeogitUnpulledchanges = { bold = true, fg = colors.teal },
		NeogitUnpulledFrom = { fg = colors.teal },
		NeogitUnstagedchanges = { bold = true, fg = colors.red_bright },
		NeogitUntrackedfiles = { bold = true, fg = colors.blue },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.notify = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		NotifyBackground = { bg = colors.bg, fg = colors.fg2 },
		NotifyDEBUGBody = { bg = "#171C21", fg = colors.purple_bright },
		NotifyDEBUGBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyDEBUGIcon = { bg = "#171C21", fg = colors.purple },
		NotifyDEBUGTitle = { bg = "#171C21", fg = colors.purple_bright },
		NotifyERRORBody = { bg = "#171C21", fg = colors.red },
		NotifyERRORBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyERRORIcon = { bg = "#171C21", fg = colors.red_bright },
		NotifyERRORTitle = { bg = "#171C21", fg = colors.red },
		NotifyINFOBody = { bg = "#171C21", fg = colors.blue_bright },
		NotifyINFOBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyINFOIcon = { bg = "#171C21", fg = colors.blue },
		NotifyINFOTitle = { bg = "#171C21", fg = colors.blue_bright },
		NotifyLogTime = { fg = "#515C68" },
		NotifyLogTitle = { fg = colors.red_bright },
		NotifyTRACEBody = { bg = "#171C21", fg = colors.green_bright },
		NotifyTRACEBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyTRACEIcon = { bg = "#171C21", fg = colors.green },
		NotifyTRACETitle = { bg = "#171C21", fg = colors.green_bright },
		NotifyWARNBody = { bg = "#171C21", fg = colors.yellow_bright },
		NotifyWARNBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyWARNIcon = { bg = "#171C21", fg = colors.yellow },
		NotifyWARNTitle = { bg = "#171C21", fg = colors.yellow_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.nui = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		NUICancel = { fg = "#222931" },
		NUIHeading = { bg = colors.bg1, fg = colors.red },
		NUILine = { bg = colors.bg1, fg = "#22272C" },
		NUINo = { fg = colors.red },
		NUINormal = { bg = colors.bg1, fg = colors.bg1 },
		NUIPrompt = { bg = colors.bg1, fg = colors.blue_bright },
		NUIText = { bg = colors.bg1, fg = "#BABABE" },
		NUIYes = { fg = colors.blue_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.nvimtree = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		NvimTreeBookmark = { fg = colors.yellow_bright },
		NvimTreeClosedFolderIcon = { fg = colors.purple },
		NvimTreeCursorLine = { fg = "#12151B" },
		NvimTreeCursorLineNr = { bold = true, fg = colors.green },
		NvimTreeEmptyFolderName = { fg = "#B58ED1" },
		NvimTreeExecFile = { fg = "#D997C8" },
		NvimTreeFileDeleted = { fg = colors.red_bright },
		NvimTreeFileDirty = { fg = colors.teal_bright },
		NvimTreeFileIgnored = { fg = "#171C21" },
		NvimTreeFileMerge = { fg = colors.green },
		NvimTreeFileNew = { fg = colors.yellow_bright },
		NvimTreeFileRenamed = { fg = colors.blue },
		NvimTreeFileStaged = { fg = "#D997C8" },
		NvimTreeFolderIcon = { fg = colors.purple },
		NvimTreeFolderName = { fg = colors.purple },
		NvimTreeGitDeleted = { fg = colors.red },
		NvimTreeGitDirty = { fg = colors.teal_bright },
		NvimTreeGitIgnored = { fg = "#171C21" },
		NvimTreeGitMerge = { fg = colors.teal },
		NvimTreeGitNew = { fg = colors.yellow_bright },
		NvimTreeGitRenamed = { fg = colors.blue },
		NvimTreeGitStaged = { fg = "#D997C8" },
		NvimTreeImageFile = { fg = colors.purple },
		NvimTreeIndentMarker = { fg = "#1D2529" },
		NvimTreeNormal = { bg = "#0C0E11", fg = "#BABABE" },
		NvimTreeNormalNC = { bg = "#0C0E11", fg = "#BABABE" },
		NvimTreePopup = { fg = colors.blue_bright },
		NvimTreeRootFolder = { bold = true, fg = colors.red },
		NvimTreeSymlink = { fg = colors.teal_bright },
		NvimTreeVertSplit = { bg = "#0C0E11", fg = "#0C0E11" },
		NvimTreeWindowPicker = { bg = "#191C24", fg = colors.blue_bright },
		NvimTreeWinSeparator = { bg = "#0C0E11", fg = "#0C0E11" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.scrollbar = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		ScrollbarCursor = { fg = colors.teal },
		ScrollbarCursorHandle = { bg = "#20272E", fg = colors.teal },
		ScrollbarError = { fg = colors.red },
		ScrollbarErrorHandle = { fg = colors.red },
		ScrollbarGitAdd = { fg = colors.blue_bright },
		ScrollbarGitAddHandle = { fg = "#82B8E7" },
		ScrollbarGitChange = { fg = colors.purple_bright },
		ScrollbarGitChangeHandle = { fg = "#BD84E6" },
		ScrollbarGitDelete = { fg = colors.red },
		ScrollbarGitDeleteHandle = { fg = "#FF7B7B" },
		ScrollbarHandle = { fg = colors.blue_bright },
		ScrollbarHint = { fg = colors.purple_bright },
		ScrollbarHintHandle = { fg = colors.purple },
		ScrollbarInfo = { fg = colors.blue_bright },
		ScrollbarInfoHandle = { fg = colors.blue_bright },
		ScrollbarMisc = { fg = "#DC97CA" },
		ScrollbarMiscHandle = { fg = colors.teal_bright },
		ScrollbarSearch = { fg = colors.yellow_bright },
		ScrollbarSearchHandle = { fg = "#FFD76F" },
		ScrollbarWarn = { fg = colors.red_bright },
		ScrollbarWarnHandle = { fg = "#FA6969" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
local telescope = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		TelescopeMatching = { bold = true, fg = "#DC97CA" },
		TelescopePreviewBorder = { bg = "#0E1014", fg = "#0E1014" },
		TelescopePreviewLine = { bg = "#15181E" },
		TelescopePreviewNormal = { bg = "#0E1014", fg = "#BABABE" },
		TelescopePreviewTitle = { bg = colors.blue_bright, fg = colors.bg },
		TelescopePromptCounter = { bg = "#12151B", bold = true, fg = "#D997C8" },
		TelescopePromptNormal = { bg = "#12151B", fg = "#BABABE" },
		TelescopePromptPrefix = { bg = "#12151B", fg = colors.red },
		TelescopePromptTitle = { bg = colors.red, fg = colors.bg },
		TelescopePromptBorder = { bg = "#12151B", fg = "#2E7DC2" },
		TelescopeResultsBorder = { bg = "#0C0E11", fg = "#0C0E11" },
		TelescopeResultsNormal = { bg = "#0C0E11", fg = "#BABABE" },
		TelescopeResultsTitle = { bg = colors.green_bright, fg = colors.bg },
		TelescopeSelectionCaret = { bg = colors.bg, fg = colors.red_bright },
		TelescopeSelection = { bg = colors.bg, fg = colors.teal },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.todo = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		TodoBgBUG = { bg = colors.red, bold = true, fg = "#171C21" },
		TodoBgCHORE = { bg = colors.teal_bright, bold = true, fg = "#171C21" },
		TodoBgCLEAN = { bg = colors.blue_bright, bold = true, fg = "#171C21" },
		TodoBgDEMO = { bg = colors.blue, bold = true, fg = "#171C21" },
		TodoBgFIX = { bg = colors.yellow_bright, bold = true, fg = "#171C21" },
		TodoBgHACK = { bg = colors.green_bright, bold = true, fg = "#171C21" },
		TodoBgIMPROVE = { bg = colors.blue, bold = true, fg = "#171C21" },
		TodoBgNOTE = { bg = colors.green, bold = true, fg = "#171C21" },
		TodoBgPERF = { bg = colors.yellow, bold = true, fg = "#171C21" },
		TodoBgTEST = { bg = colors.teal, bold = true, fg = "#171C21" },
		TodoBgTODO = { bg = colors.purple_bright, bold = true, fg = "#171C21" },
		TodoBgUPDATE = { bg = colors.purple, bold = true, fg = "#171C21" },
		TodoBgWANTS = { bg = "#FFEDA6", bold = true, fg = "#171C21" },
		TodoBgWARN = { bg = "#E17272", bold = true, fg = "#171C21" },
		TodoFgBUG = { fg = colors.red },
		TodoFgCHORE = { fg = colors.teal_bright },
		TodoFgCLEAN = { fg = colors.blue_bright },
		TodoFgDEMO = { fg = colors.blue },
		TodoFgFIX = { fg = colors.yellow_bright },
		TodoFgHACK = { fg = colors.green_bright },
		TodoFgIMPROVE = { fg = colors.blue },
		TodoFgNOTE = { fg = colors.green },
		TodoFgPERF = { fg = colors.yellow },
		TodoFgTEST = { fg = colors.teal },
		TodoFgTODO = { fg = colors.purple_bright },
		TodoFgUPDATE = { fg = colors.purple },
		TodoFgWANTS = { fg = "#FFEDA6" },
		TodoFgWARN = { fg = "#E17272" },
		Todo = { fg = colors.yellow_bright },
		TodoSignBUG = { bg = colors.bg, fg = colors.red },
		TodoSignCHORE = { bg = colors.bg, fg = colors.teal_bright },
		TodoSignCLEAN = { bg = colors.bg, fg = colors.blue_bright },
		TodoSignDEMO = { bg = colors.bg, fg = colors.blue },
		TodoSignFIX = { bg = colors.bg, fg = colors.yellow },
		TodoSignHACK = { bg = colors.bg, fg = colors.green_bright },
		TodoSignIMPROVE = { bg = colors.bg, fg = colors.blue },
		TodoSignNOTE = { bg = colors.bg, fg = colors.green },
		TodoSignPERF = { bg = colors.bg, fg = colors.yellow },
		TodoSignTEST = { bg = colors.bg, fg = colors.teal },
		TodoSignTODO = { bg = colors.bg, fg = colors.purple_bright },
		TodoSignUPDATE = { bg = colors.bg, fg = colors.purple },
		TodoSignWANTS = { bg = colors.bg, fg = "#FFEDA6" },
		TodoSignWARN = { bg = colors.bg, fg = "#E17272" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
local trouble = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		TroubleNormal = { bg = "#0C0E11" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.undotree = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		UndotreeBranch = { fg = colors.red },
		UndotreeCurrent = { fg = colors.red },
		UndotreeFirstNode = { fg = "#BE8FD7" },
		UndotreeHead = { fg = colors.green },
		UndotreeHelp = { fg = "#515C68" },
		UndotreeHelpKey = { bold = true, fg = colors.red },
		UndotreeHelpTitle = { fg = colors.red },
		UndotreeNext = { fg = colors.blue_bright },
		UndotreeNodeCurrent = { fg = "#E1C58D" },
		UndotreeNode = { fg = colors.green_bright },
		UndotreeSavedBig = { bg = colors.bg1, bold = true },
		UndotreeSavedSmall = { fg = colors.red_bright },
		UndotreeSeq = { fg = "#515C68" },
		UndotreeTimeStamp = { fg = colors.teal_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.whichkey = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		WhichKeyBorder = { bg = "#0E1014" },
		WhichKeyDesc = { fg = colors.yellow_bright },
		WhichKeyFloat = { bg = "#0E1014" },
		WhichKeyGroup = { bold = true, fg = colors.red },
		WhichKey = { fg = colors.purple_bright },
		WhichKeySeparator = { fg = colors.blue_bright },
		WhichKeyValue = { fg = "#929299" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.treesitter = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		TSRainbowBlue = { fg = "#94CAF9" },
		TSRainbowteal = { fg = "#79CAFF" },
		TSRainbowGreen = { fg = "#50E0AC" },
		TSRainbowOrange = { fg = "#FF9393" },
		TSRainbowRed = { fg = "#F96262" },
		TSRainbowViolet = { fg = "#D098FF" },
		TSRainbowYellow = { fg = "#FFE981" },
		TreesitterContext = { bg = "#171A20" },
		["@boolean"] = { bold = true, fg = colors.red },
		["@character"] = { fg = "#E1C58D" },
		["@comment"] = { fg = "#515C68" },
		["@conditional"] = { fg = colors.red },
		["@constant.builtin"] = { bold = true, fg = "#FFDF85" },
		["@constant"] = { bold = true, fg = colors.red },
		["@constant.macro"] = { fg = "#E37070" },
		["@constructor"] = { fg = colors.blue },
		["@debug"] = { fg = "#7AAFC5" },
		["@define"] = { fg = colors.purple_bright },
		["@exception"] = { fg = "#6AA6DF" },
		["@field"] = { fg = colors.green },
		["@float"] = { fg = "#F3A4F1" },
		["@function.builtin"] = { bold = true, fg = colors.green },
		["@function"] = { fg = "#BE8FD7" },
		["@function.macro"] = { fg = "#FF7070" },
		["@include"] = { bold = true, fg = "#6AA6DF" },
		["@keyword.function"] = { fg = colors.red_bright },
		["@keyword"] = { fg = "#66B3FF" },
		["@keyword.operator"] = { fg = colors.teal_bright },
		["@keyword.return"] = { fg = "#66B3FF" },
		["@label"] = { fg = colors.red },
		["@lua.constant.cmd"] = { bold = true, fg = "#60B0FC" },
		["@lua.constant.vim"] = { bold = true, fg = colors.red },
		["@lua.function.pcall"] = { bold = true, fg = "#F98989" },
		["@lua.parameter.self"] = { bold = true, fg = "#FFCE66" },
		["@macro"] = { fg = "#F98989" },
		["@method"] = { fg = colors.purple },
		["@namespace"] = { fg = "#60B0FC" },
		["@number"] = { fg = colors.teal },
		["@operator"] = { fg = colors.teal_bright },
		["@parameter"] = { fg = "#FFE49D" },
		["@preproc"] = { fg = "#F96262" },
		["@property"] = { fg = colors.teal },
		["@punctuation.bracket"] = { fg = "#FF7D7D" },
		["@punctuation.delimiter"] = { fg = colors.blue_bright },
		["@punctuation"] = { fg = colors.blue_bright },
		["@repeat"] = { fg = colors.purple },
		["@storageclass"] = { fg = colors.red_bright },
		["@string.escape"] = { fg = "#E5E49D" },
		["@string"] = { fg = colors.green_bright },
		["@string.regex"] = { fg = "#FFE390" },
		["@string.special"] = { fg = colors.yellow },
		["@structure"] = { fg = colors.blue },
		["@tag"] = { fg = colors.blue_bright },
		["@text"] = { fg = colors.fg2 },
		["@text.literal"] = { fg = "#79CFAA" },
		["@text.reference"] = { fg = colors.blue_bright },
		["@text.title"] = { bold = true, fg = "#FA6969" },
		["@text.todo"] = { fg = colors.yellow_bright },
		["@text.underline"] = { undercurl = true },
		["@text.uri"] = { fg = colors.teal_bright, undercurl = true },
		["@type.definition"] = { fg = colors.purple_bright },
		["@type"] = { fg = colors.red },
		["@variable"] = { fg = colors.fg2 },
	}
end

--- @param config ThemeConfig
function M:with_config(config)
	local statusline = M.statusline(config)
	local defaults = M.defaults(config)
	local diffview = M.diffview(config)
	local cmp = M.cmp(config)
	local gitsigns = M.gitsigns(config)
	local harpoon = M.harpoon(config)
	local incline = M.incline(config)
	local lsp = M.lsp(config)
	local lua = M.lua(config)
	local navic = M.navic(config)
	local neogit = M.neogit(config)
	local notify = M.notify(config)
	local nui = M.nui(config)
	local nvimtree = M.nvimtree(config)
	local scrollbar = M.scrollbar(config)
	local todo = M.todo(config)
	local treesitter = M.treesitter(config)
	local undotree = M.undotree(config)
	local whichkey = M.whichkey(config)

	local groups = vim.tbl_deep_extend(
		"force",
		{},
		defaults,
		diffview,
		cmp,
		gitsigns,
		harpoon,
		incline,
		lua,
		lsp,
		navic,
		neogit,
		notify,
		nui,
		nvimtree,
		scrollbar,
		todo,
		treesitter,
		undotree,
		whichkey,
		statusline
	)

	return groups
end

return M
