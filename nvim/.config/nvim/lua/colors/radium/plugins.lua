local palette = require("colors.radium.palette")

local M = {}

--- @param config ThemeConfig
--- @return ThemeGroup
M.lsp = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		LspDiagnosticsSignError = { fg = colors.red_bright },
		LspDiagnosticsSignHint = { fg = colors.magenta_bright },
		LspDiagnosticsSignInfo = { fg = colors.blue_bright },
		LspDiagnosticsSignWarn = { fg = "#FF7D7D" },
		LspReferenceRead = { bg = "#161921", bold = true, fg = "#82B8E7" },
		LspReferenceText = { bg = "#161921", bold = true, fg = "#CB9FE0" },
		LspReferenceWrite = { bg = "#161921", bold = true, fg = "#DC97CA" },
		LspSignatureActiveParameter = { bg = "#161921", bold = true, fg = "#78C8C2" },
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
		StatusLineModeNormal = { bg = colors.magenta, fg = colors.white },
		StatusLineNormalSeparator = { bg = nil, fg = colors.magenta },
		StatusLineModeCommand = { bg = colors.red, fg = colors.white },
		StatusLineCommandSeparator = { bg = nil, fg = colors.red },
		StatusLineModeInsert = { bg = colors.blue, fg = colors.white },
		StatusLineInsertSeparator = { bg = nil, fg = colors.blue },
		StatusLineModeVisual = { bg = colors.green, fg = colors.white },
		StatusLineVisualSeparator = { bg = nil, fg = colors.green },
		StatusLineGitBranch = { bg = nil, fg = colors.green },
		StatusLineFilename = { bg = nil, fg = colors.grey },
		StatusLineCursor = { bg = nil, fg = colors.green },
		StatusLineCursorPercent = { bg = nil, fg = colors.magenta },

		FiletypeLua = { bg = nil, fg = colors.blue },
		FiletypeRust = { bg = nil, fg = colors.yellow },
		FiletypeJs = { bg = nil, fg = colors.yellow },
		FiletypeTs = { bg = nil, fg = colors.blue },
		FiletypeOcaml = { bg = nil, fg = colors.yellow },
		FiletypeC = { bg = nil, fg = colors.blue },
		FiletypeGo = { bg = nil, fg = colors.blue },
		FiletypeGleam = { bg = nil, fg = colors.magenta },
		FileTypeElixir = { bg = nil, fg = colors.magenta },
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
		Title = { bold = true, fg = "#66B3FF" },
		LazyProp = { bg = "#151A1F", fg = colors.blue },
		AlphaButtonLabelText = { fg = colors.yellow_bright },
		AlphaFooting = { bold = true, fg = colors.magenta_bright },
		AlphaHeading = { fg = "#1A1F25" },
		AlphaKeyPrefix = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		AlphaLoaded = { fg = "#24292F" },
		AlphaScroll = { fg = colors.magenta_bright },
		Bold = { bold = true },
		BookmarkAnnotationLine = { fg = "#DDB1F2" },
		BookmarkAnnotationSign = { fg = colors.magenta_bright },
		BookmarkLine = { bg = "#31363B" },
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
		BufferLineFill = { bg = colors.bg, fg = "#313743" },
		BufferLineIndicatorSelected = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLineIndicatorVisible = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineModified = { bg = colors.bg1, fg = colors.green_bright },
		BufferLineModifiedSelected = { bg = colors.blue_bright, fg = colors.bg },
		BufferLineModifiedVisible = { bg = colors.bg1, fg = colors.green_bright },
		BufferLineOffsetSeparator = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLinePick = { bg = colors.bg1, bold = true, fg = "#D997C8" },
		BufferLinePickSelected = { bg = colors.blue_bright, bold = true, fg = "#E6CFA1" },
		BufferLinePickVisible = { bg = colors.bg1, bold = true, fg = colors.yellow },
		BufferLineSeparator = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineSeparatorSelected = { bg = colors.blue_bright, fg = colors.blue_bright },
		BufferLineSeparatorVisible = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabClose = { bg = colors.bg, fg = colors.red },
		BufferLineTab = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabSelected = { bg = colors.bg, bold = true, fg = colors.blue_bright },
		BufferLineTabSeparator = { bg = colors.bg1, fg = colors.bg1 },
		BufferLineTabSeparatorSelected = { fg = colors.bg },
		Character = { fg = "#E1C58D" },
		ColorColumn = { bg = "#111419", fg = "#171A20" },
		Comment = { fg = "#515C68" },
		Conceal = { fg = "#353E47" },
		Conditional = { fg = colors.red },
		Constant = { fg = "#FF6666" },
		CursorColumn = { bg = "#191D21" },
		Cursor = { bg = "#DFC184", fg = colors.bg },
		CursorLineFold = { bg = colors.bg, fg = colors.cyan_bright },
		CursorLine = { bg = "#191D21" },
		CursorLineNr = { bold = true, fg = colors.yellow_bright },
		CursorLineSign = { bg = colors.bg },
		Debug = { fg = colors.red_bright },
		Decorator = { fg = colors.yellow_bright },
		Define = { fg = colors.magenta_bright },
		Delimeter = { fg = colors.blue_bright },
		Delimiter = { fg = colors.red_bright },
		DiagnosticError = { fg = colors.red },
		DiagnosticFloatingError = { fg = colors.red },
		DiagnosticFloatingHint = { fg = colors.magenta_bright },
		DiagnosticFloatingInfo = { fg = colors.blue_bright },
		DiagnosticFloatingWarn = { fg = "#F97F7F" },
		DiagnosticHint = { fg = colors.magenta_bright },
		DiagnosticInfo = { fg = colors.blue_bright },
		DiagnosticSignError = { fg = colors.red_bright },
		DiagnosticSignHint = { fg = colors.magenta_bright },
		DiagnosticSignInfo = { fg = colors.blue_bright },
		DiagnosticSignWarn = { fg = "#F97F7F" },
		DiagnosticUnderlineError = { fg = colors.red },
		DiagnosticUnderlineHint = { fg = colors.magenta_bright },
		DiagnosticUnderlineInfo = { fg = colors.blue_bright },
		DiagnosticUnderlineWarn = { fg = "#F97F7F" },
		DiagnosticVirtualTextError = { fg = colors.red },
		DiagnosticVirtualTextHint = { fg = colors.magenta_bright },
		DiagnosticVirtualTextInfo = { fg = colors.blue_bright },
		DiagnosticVirtualTextWarn = { fg = "#F97F7F" },
		DiagnosticWarn = { fg = "#F97F7F" },
		Directory = { fg = colors.yellow_bright },
		EndOfBuffer = { fg = colors.magenta_bright },
		Error = { fg = "#F76262" },
		ErrorMsg = { fg = colors.red, bg = "#151A1F" },
		Exception = { fg = colors.green },
		FidgetTask = { fg = "#1A1E27" },
		FidgetTitle = { bold = true, fg = colors.green },
		FloatBorder = { bg = "#151A1F", fg = "#151A1F" },
		Float = { fg = "#F3A4F1" },
		FloatShadow = { bg = "#000000", blend = 80 },
		FloatShadowThrough = { bg = "#000000", blend = 100 },
		FocusedSymbol = { bg = "#666666", fg = "#FFA0A0" },
		FoldColumn = { bg = colors.bg, fg = colors.cyan_bright },
		Folded = { bg = colors.bg, fg = "#282F3C" },
		Function = { fg = "#BE8FD7" },
		HighlightUrl = { fg = colors.cyan_bright, undercurl = true },
		HlSearchFloat = { bg = "#1A1E27", fg = "#D0A4E5" },
		HlSearchLens = { bg = "#1A1E27", fg = "#87BDEC" },
		HlSearchLensNear = { bg = "#FFE28F", bold = true, fg = colors.bg },
		HlSearchNear = { bg = "#1A1E27", bold = true, fg = "#7DCDC7" },
		Identifier = { fg = colors.green },
		Include = { bold = true, fg = "#6AA6DF" },
		IncSearch = { bg = colors.cyan_bright, fg = colors.bg },
		IndentBlanklineChar = { fg = "#22272C" },
		IndentBlanklineContextChar = { fg = colors.blue_bright },
		IndentBlanklineContextStart = { bg = "#16191F" },
		Italic = { italic = true },
		JaqBorder = { bg = "#161921" },
		JaqWin = { bg = "#161921" },
		Keyword = { fg = "#66B3FF" },
		Label = { fg = colors.red },
		LightBulbFloatWin = { fg = colors.yellow },
		LightBulbSign = { fg = colors.yellow_bright },
		LightBulbVirtualText = { fg = colors.yellow_bright },
		LineNrAbove = { fg = "#2E3645" },
		LineNrBelow = { fg = "#2E3645" },
		LineNr = { fg = "#2E3645" },
		Macro = { fg = "#F98989" },
		MatchBackground = { bg = "#111419", fg = "#171A20" },
		MatchParenCur = { bg = "#202530", bold = true },
		MatchParen = { bg = "#202530", bold = true },
		MatchWord = { bg = "#202530", bold = true },
		ModeMsg = { bold = true, fg = colors.blue_bright },
		monarkCommand = { fg = colors.blue },
		monarkInsert = { fg = colors.blue_bright },
		monarkNormal = { fg = colors.green_bright },
		monarkReplace = { fg = colors.magenta_bright },
		MonarkSelect = { fg = colors.cyan },
		MonarkTerminal = { fg = colors.cyan },
		MonarkVisualBlock = { fg = colors.yellow },
		monarkVisual = { fg = colors.yellow_bright },
		MonarkVisualLine = { fg = colors.red },
		MoreMsg = { fg = colors.yellow_bright },
		MsgArea = { fg = "#CACACD" },
		MsgSeparator = { fg = colors.magenta_bright },
		NonText = { fg = "#222931" },
		NormalFloat = { bg = "#151A1F", fg = "#BABABE" },
		Normal = transparent and { bg = nil, fg = colors.grey } or { bg = colors.bg, fg = "#D4D4D5" },
		Number = { fg = colors.cyan },
		NvimUnaryMinus = { fg = colors.cyan_bright },
		NvimUnaryOperator = { fg = colors.cyan_bright },
		NvimUnaryPlus = { fg = colors.cyan_bright },
		Operator = { fg = colors.cyan_bright },
		Pmenu = { bg = "#171D20", fg = "#A0A0A5" },
		PmenuSbar = { bg = "#171D20", fg = "#A0A0A5" },
		PmenuSel = { bg = "#1B2226", fg = "#ADADB2" },
		PmenuThumb = { bg = "#1E2225" },
		PreCondit = { fg = "#F96262" },
		PreProc = { fg = "#F96262" },
		Question = { fg = colors.green_bright },
		QuickFixLine = { bg = colors.yellow_bright, fg = colors.bg },
		RedrawDebugClear = { bg = "#FFFF00" },
		RedrawDebugComposed = { bg = "#008000" },
		RedrawDebugNormal = { reverse = true },
		RedrawDebugRecompose = { bg = "#FF0000" },
		Repeat = { fg = colors.magenta },
		RnvimrCurses = { bg = colors.bg, fg = colors.grey },
		RnvimrNormal = { bg = "#151A1F", fg = "#BABABE" },
		Search = { bg = colors.yellow_bright, fg = colors.bg },
		SignColumn = transparent and { bg = nil } or { bg = colors.bg },
		SpecialChar = { fg = colors.magenta_bright },
		SpecialComment = { fg = "#FFDF8F" },
		Special = { fg = colors.red_bright },
		SpecialKey = { bold = true, fg = colors.yellow_bright },
		SpellBad = { fg = colors.red },
		SpellCap = { fg = colors.yellow },
		SpellLocal = { fg = colors.red_bright },
		SpellRare = { fg = colors.cyan },
		Statement = { fg = colors.red },
		StatusLine = { fg = "#191D21", bg = colors.blue_bright },
		StatusLineNC = { fg = colors.blue_bright, bg = colors.bg },
		StorageClass = { fg = "#F75858" },
		String = { fg = colors.green_bright },
		Structure = { fg = colors.blue },
		Substitute = { bg = colors.magenta, fg = colors.bg },
		TabLine = { bg = colors.bg, bold = true, fg = "#2C3640" },
		TabLineFill = { fg = colors.bg, bg = colors.blue_bright },
		TabLineSel = { bg = colors.blue_bright, bold = true, fg = colors.bg },
		Tag = { fg = colors.blue_bright },
		TermCursor = { reverse = true },
		VertSplit = { fg = "#171C21" },
		VirtColumn = { bg = colors.bg, fg = "#171A20" },
		Visual = { bg = "#333333" },
		WarningMsg = { fg = colors.red_bright },
		Whitespace = { fg = "#1E222A" },
		WildMenu = { bg = colors.blue_bright, fg = colors.bg },
		WinBar = { bold = true },
		WinBarNC = { bold = true },
		WinSeparator = { fg = "#171C21" },
		Typedef = { fg = colors.magenta_bright },
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
		DiffChange = { fg = colors.magenta_bright, reverse = true },
		DiffDelete = { fg = colors.red, reverse = true },
		DiffText = { fg = colors.blue_bright, reverse = true },
		DiffviewCursorLine = { bg = "#191D21" },
		DiffviewDiffAddAsDelete = { fg = colors.red, reverse = true },
		DiffviewDiffDelete = { fg = "#515C68" },
		DiffviewDim1 = { fg = "#515C68" },
		DiffviewEndOfBuffer = { fg = colors.magenta_bright },
		DiffviewFilePanelConflicts = { fg = "#F97F7F" },
		DiffviewFilePanelCounter = { bold = true, fg = colors.green },
		DiffviewFilePanelFileName = { fg = colors.grey },
		DiffviewFilePanelPath = { fg = "#515C68" },
		DiffviewFilePanelRootPath = { bold = true, fg = colors.red },
		DiffviewFilePanelSelected = { fg = colors.red },
		DiffviewFilePanelTitle = { bold = true, fg = colors.red },
		DiffviewFolderName = { fg = colors.yellow_bright },
		DiffviewFolderSign = { fg = "#F96262" },
		DiffviewNonText = { fg = "#222931" },
		DiffviewNormal = { bg = colors.bg, fg = colors.grey },
		DiffviewPrimary = { fg = "#BE8FD7" },
		DiffviewReference = { fg = "#BE8FD7" },
		DiffviewSecondary = { fg = colors.green_bright },
		DiffviewSignColumn = { bg = colors.bg, fg = colors.grey },
		DiffviewStatusIgnored = { fg = "#515C68" },
		DiffviewStatusLine = { bg = colors.bg, fg = colors.blue_bright },
		DiffviewStatusLineNC = { fg = colors.blue_bright },
		DiffviewWinSeparator = { fg = "#171C21" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.cmp = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		CmpItemAbbrDeprecated = { fg = "#3E4450" },
		CmpItemAbbr = { fg = "#BABABE" },
		CmpItemAbbrMatchFuzzy = { fg = colors.yellow },
		CmpItemAbbrMatch = { fg = colors.green_bright },
		CmpItemKindClass = { fg = colors.red },
		CmpItemKindColor = { fg = colors.blue_bright },
		CmpItemKindConstant = { fg = "#FF6666" },
		CmpItemKindConstructor = { fg = colors.blue },
		CmpItemKindEnum = { fg = colors.cyan },
		CmpItemKindEnumMember = { fg = "#C297B9" },
		CmpItemKindEvent = { fg = "#7AAFF3" },
		CmpItemKindField = { fg = "#FFE69F" },
		CmpItemKindFile = { fg = colors.yellow },
		CmpItemKindFolder = { fg = colors.yellow },
		CmpItemKindFunction = { fg = "#BE8FD7" },
		CmpItemKind = { fg = "#3E4450" },
		CmpItemKindInterface = { fg = colors.magenta_bright },
		CmpItemKindKeyword = { fg = "#66B3FF" },
		CmpItemKindMethod = { fg = "#DC7272" },
		CmpItemKindModule = { fg = colors.blue },
		CmpItemKindOperator = { fg = colors.cyan_bright },
		CmpItemKindProperty = { fg = colors.cyan },
		CmpItemKindReference = { fg = colors.red_bright },
		CmpItemKindSnippet = { fg = colors.yellow_bright },
		CmpItemKindStruct = { fg = colors.blue },
		CmpItemKindText = { fg = colors.blue },
		CmpItemKindTypeParameter = { fg = "#FFE49D" },
		CmpItemKindUnit = { fg = colors.cyan },
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
		GitSignsChangedelete = { fg = "#21272D" },
		GitSignsChangedeleteLn = { fg = "#CB9FE0" },
		GitSignsChangedeleteNr = { fg = colors.magenta },
		GitSignsChange = { fg = "#21272D" },
		GitSignsChangeInline = { reverse = true },
		GitSignsChangeLn = { fg = "#CB9FE0" },
		GitSignsChangeLnInline = { reverse = true },
		GitSignsChangeNr = { fg = colors.magenta },
		GitSignsCurrentLineBlame = { fg = "#222931" },
		GitSignsDelete = { fg = colors.red_bright },
		GitSignsDeleteInline = { reverse = true },
		GitSignsDeleteLn = { fg = colors.red },
		GitSignsDeleteLnInline = { reverse = true },
		GitSignsDeleteNr = { fg = "#FE7676" },
		GitSignsDeletePreview = { fg = colors.red, reverse = true },
		GitSignsDeleteVirtLn = { fg = colors.red, reverse = true },
		GitSignsDeleteVirtLnInLine = { reverse = true },
		GitSignsStagedAdd = { fg = "#3D586F" },
		GitSignsStagedAddLn = { fg = "#3D586F" },
		GitSignsStagedAddNr = { fg = "#2F587E" },
		GitSignsStagedChangedelete = { fg = "#101316" },
		GitSignsStagedChangedeleteLn = { fg = "#654F70" },
		GitSignsStagedChangedeleteNr = { fg = "#5B3F70" },
		GitSignsStagedChange = { fg = "#101316" },
		GitSignsStagedChangeLn = { fg = "#654F70" },
		GitSignsStagedChangeNr = { fg = "#5B3F70" },
		GitSignsStagedDelete = { fg = "#7D3939" },
		GitSignsStagedDeleteLn = { fg = "#7C3838" },
		GitSignsStagedDeleteNr = { fg = "#7F3B3B" },
		GitSignsStagedTopdelete = { fg = "#7D3939" },
		GitSignsStagedTopdeleteNr = { fg = "#7F3B3B" },
		GitSignsTopdelete = { fg = colors.red_bright },
		GitSignsTopdeleteNr = { fg = "#FE7676" },
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
		HarpoonBorder = { bg = "#151A1F", fg = "#151A1F" },
		HarpoonCurrentFile = { bold = true, fg = colors.yellow_bright },
		HarpoonCursor = { bg = "#1A1F25", fg = colors.blue_bright },
		HarpoonTitle = { bg = colors.red, fg = "#171C21" },
		HarpoonWindow = { bg = "#151A1F", fg = "#BABABE" },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.incline = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		InclineBG = { bg = "#171C21" },
		InclineBGNC = { bg = colors.bg1 },
		InclineCursorLine = { bg = "#151A1F" },
		InclineCursorLineNC = { bg = "#141A1D" },
		InclineFG = { fg = colors.grey },
		InclineFGNC = { fg = colors.magenta_bright },
		InclineNormal = { bg = "#151A1F", fg = "#BABABE" },
		InclineNormalNC = { bg = "#151A1F", fg = "#BABABE" },
		InclineThemeBG = { bg = colors.yellow_bright },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.lua = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		luaCommentDelimiter = { fg = "#515C68" },
		luaComment = { fg = "#515C68" },
		luaCondElse = { fg = colors.red },
		luaCond = { fg = colors.red },
		luaConstant = { fg = "#FF6666" },
		luaError = { fg = "#F76262" },
		luaFor = { fg = colors.magenta },
		luaFunc = { fg = colors.green },
		luaFunction = { fg = "#BE8FD7" },
		luaLabel = { fg = colors.red },
		luaMetaMethod = { fg = "#BE8FD7" },
		luaNumber = { fg = colors.cyan },
		luaOperator = { fg = colors.cyan_bright },
		luaParenError = { fg = "#F76262" },
		luaRepeat = { fg = colors.magenta },
		luaSpecial = { fg = colors.magenta_bright },
		luaStatement = { fg = colors.red },
		luaString2 = { fg = colors.green_bright },
		luaStringDelimiter = { fg = colors.green_bright },
		luaString = { fg = colors.green_bright },
		luaSymbolOperator = { fg = colors.cyan_bright },
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
		NavicIconsClass = { fg = "#F75858" },
		NavicIconsConstant = { bold = true, fg = "#FF6666" },
		NavicIconsConstructor = { fg = colors.blue },
		NavicIconsEnum = { fg = colors.blue_bright },
		NavicIconsEnumMember = { fg = "#F96262" },
		NavicIconsEvent = { fg = "#79CFAA" },
		NavicIconsField = { fg = colors.green },
		NavicIconsFile = { fg = colors.yellow_bright },
		NavicIconsFunction = { fg = "#BE8FD7" },
		NavicIconsInterface = { fg = "#FF7070" },
		NavicIconsKey = { fg = colors.red },
		NavicIconsMethod = { fg = colors.magenta },
		NavicIconsModule = { fg = "#F98989" },
		NavicIconsNull = { bold = true, fg = "#FFDF85" },
		NavicIconsNumber = { fg = colors.cyan },
		NavicIconsObject = { fg = "#FFE390" },
		NavicIconsOperator = { fg = colors.cyan_bright },
		NavicIconsPackage = { bold = true, fg = "#6AA6DF" },
		NavicIconsProperty = { fg = colors.cyan },
		NavicIconsString = { fg = colors.green_bright },
		NavicIconsStruct = { fg = colors.blue },
		NavicIconsTypeParameter = { fg = "#FFE49D" },
		NavicIconsVariable = { bold = true, fg = "#FA6969" },
		NavicSeparator = { fg = colors.blue_bright },
		NavicText = { fg = "#AAAAAF" },
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
		NeogitFilePath = { fg = colors.cyan_bright },
		NeogitFold = { bg = colors.bg, fg = colors.cyan },
		NeogitHunkHeader = { bg = "#171C21", fg = colors.yellow_bright },
		NeogitHunkHeaderHighlight = { bg = colors.yellow_bright, fg = colors.bg },
		NeogitNotificationError = { bg = colors.bg, fg = colors.red },
		NeogitNotificationInfo = { bg = colors.bg, fg = colors.blue_bright },
		NeogitNotificationWarning = { bg = colors.bg, fg = colors.yellow_bright },
		NeogitObjectId = { fg = colors.magenta_bright },
		NeogitRebaseDone = { bold = true, fg = colors.green_bright },
		NeogitRebasing = { bold = true, fg = colors.yellow_bright },
		NeogitRecentcommits = { bold = true, fg = colors.green_bright },
		NeogitRemote = { bold = true, fg = colors.yellow },
		NeogitStagedchanges = { bold = true, fg = colors.yellow_bright },
		NeogitStashes = { bold = true, fg = colors.cyan_bright },
		NeogitStash = { fg = colors.cyan_bright },
		NeogitUnmergedchanges = { bold = true, fg = colors.green },
		NeogitUnmergedInto = { fg = colors.blue_bright },
		NeogitUnpulledchanges = { bold = true, fg = colors.cyan },
		NeogitUnpulledFrom = { fg = colors.cyan },
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
		NotifyBackground = { bg = colors.bg, fg = colors.grey },
		NotifyDEBUGBody = { bg = "#171C21", fg = colors.magenta_bright },
		NotifyDEBUGBorder = { bg = "#171C21", fg = "#171C21" },
		NotifyDEBUGIcon = { bg = "#171C21", fg = colors.magenta },
		NotifyDEBUGTitle = { bg = "#171C21", fg = colors.magenta_bright },
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
		NUIHeading = { bg = "#151A1F", fg = colors.red },
		NUILine = { bg = "#151A1F", fg = "#22272C" },
		NUINo = { fg = colors.red },
		NUINormal = { bg = "#151A1F", fg = "#151A1F" },
		NUIPrompt = { bg = "#151A1F", fg = colors.blue_bright },
		NUIText = { bg = "#151A1F", fg = "#BABABE" },
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
		NvimTreeClosedFolderIcon = { fg = colors.magenta },
		NvimTreeCursorLine = { fg = "#12151B" },
		NvimTreeCursorLineNr = { bold = true, fg = colors.green },
		NvimTreeEmptyFolderName = { fg = "#B58ED1" },
		NvimTreeExecFile = { fg = "#D997C8" },
		NvimTreeFileDeleted = { fg = colors.red_bright },
		NvimTreeFileDirty = { fg = colors.cyan_bright },
		NvimTreeFileIgnored = { fg = "#171C21" },
		NvimTreeFileMerge = { fg = colors.green },
		NvimTreeFileNew = { fg = colors.yellow_bright },
		NvimTreeFileRenamed = { fg = colors.blue },
		NvimTreeFileStaged = { fg = "#D997C8" },
		NvimTreeFolderIcon = { fg = colors.magenta },
		NvimTreeFolderName = { fg = colors.magenta },
		NvimTreeGitDeleted = { fg = colors.red },
		NvimTreeGitDirty = { fg = colors.cyan_bright },
		NvimTreeGitIgnored = { fg = "#171C21" },
		NvimTreeGitMerge = { fg = colors.cyan },
		NvimTreeGitNew = { fg = colors.yellow_bright },
		NvimTreeGitRenamed = { fg = colors.blue },
		NvimTreeGitStaged = { fg = "#D997C8" },
		NvimTreeImageFile = { fg = colors.magenta },
		NvimTreeIndentMarker = { fg = "#1D2529" },
		NvimTreeNormal = { bg = "#0C0E11", fg = "#BABABE" },
		NvimTreeNormalNC = { bg = "#0C0E11", fg = "#BABABE" },
		NvimTreePopup = { fg = colors.blue_bright },
		NvimTreeRootFolder = { bold = true, fg = colors.red },
		NvimTreeSymlink = { fg = colors.cyan_bright },
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
		ScrollbarCursor = { fg = colors.cyan },
		ScrollbarCursorHandle = { bg = "#20272E", fg = colors.cyan },
		ScrollbarError = { fg = colors.red },
		ScrollbarErrorHandle = { fg = colors.red },
		ScrollbarGitAdd = { fg = colors.blue_bright },
		ScrollbarGitAddHandle = { fg = "#82B8E7" },
		ScrollbarGitChange = { fg = colors.magenta_bright },
		ScrollbarGitChangeHandle = { fg = "#BD84E6" },
		ScrollbarGitDelete = { fg = colors.red },
		ScrollbarGitDeleteHandle = { fg = "#FF7B7B" },
		ScrollbarHandle = { fg = colors.blue_bright },
		ScrollbarHint = { fg = colors.magenta_bright },
		ScrollbarHintHandle = { fg = colors.magenta },
		ScrollbarInfo = { fg = colors.blue_bright },
		ScrollbarInfoHandle = { fg = colors.blue_bright },
		ScrollbarMisc = { fg = "#DC97CA" },
		ScrollbarMiscHandle = { fg = colors.cyan_bright },
		ScrollbarSearch = { fg = colors.yellow_bright },
		ScrollbarSearchHandle = { fg = "#FFD76F" },
		ScrollbarWarn = { fg = "#F97F7F" },
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
		TelescopeSelection = { bg = colors.bg, fg = colors.cyan },
	}
end

--- @param config ThemeConfig
--- @return ThemeGroup
M.todo = function(config)
	local colors = palette[config.variant]
	local transparent = config.transparent
	return {
		TodoBgBUG = { bg = colors.red, bold = true, fg = "#171C21" },
		TodoBgCHORE = { bg = colors.cyan_bright, bold = true, fg = "#171C21" },
		TodoBgCLEAN = { bg = colors.blue_bright, bold = true, fg = "#171C21" },
		TodoBgDEMO = { bg = colors.blue, bold = true, fg = "#171C21" },
		TodoBgFIX = { bg = colors.yellow_bright, bold = true, fg = "#171C21" },
		TodoBgHACK = { bg = colors.green_bright, bold = true, fg = "#171C21" },
		TodoBgIMPROVE = { bg = colors.blue, bold = true, fg = "#171C21" },
		TodoBgNOTE = { bg = colors.green, bold = true, fg = "#171C21" },
		TodoBgPERF = { bg = colors.yellow, bold = true, fg = "#171C21" },
		TodoBgTEST = { bg = colors.cyan, bold = true, fg = "#171C21" },
		TodoBgTODO = { bg = colors.magenta_bright, bold = true, fg = "#171C21" },
		TodoBgUPDATE = { bg = colors.magenta, bold = true, fg = "#171C21" },
		TodoBgWANTS = { bg = "#FFEDA6", bold = true, fg = "#171C21" },
		TodoBgWARN = { bg = "#E17272", bold = true, fg = "#171C21" },
		TodoFgBUG = { fg = colors.red },
		TodoFgCHORE = { fg = colors.cyan_bright },
		TodoFgCLEAN = { fg = colors.blue_bright },
		TodoFgDEMO = { fg = colors.blue },
		TodoFgFIX = { fg = colors.yellow_bright },
		TodoFgHACK = { fg = colors.green_bright },
		TodoFgIMPROVE = { fg = colors.blue },
		TodoFgNOTE = { fg = colors.green },
		TodoFgPERF = { fg = colors.yellow },
		TodoFgTEST = { fg = colors.cyan },
		TodoFgTODO = { fg = colors.magenta_bright },
		TodoFgUPDATE = { fg = colors.magenta },
		TodoFgWANTS = { fg = "#FFEDA6" },
		TodoFgWARN = { fg = "#E17272" },
		Todo = { fg = colors.yellow_bright },
		TodoSignBUG = { bg = colors.bg, fg = colors.red },
		TodoSignCHORE = { bg = colors.bg, fg = colors.cyan_bright },
		TodoSignCLEAN = { bg = colors.bg, fg = colors.blue_bright },
		TodoSignDEMO = { bg = colors.bg, fg = colors.blue },
		TodoSignFIX = { bg = colors.bg, fg = colors.yellow },
		TodoSignHACK = { bg = colors.bg, fg = colors.green_bright },
		TodoSignIMPROVE = { bg = colors.bg, fg = colors.blue },
		TodoSignNOTE = { bg = colors.bg, fg = colors.green },
		TodoSignPERF = { bg = colors.bg, fg = colors.yellow },
		TodoSignTEST = { bg = colors.bg, fg = colors.cyan },
		TodoSignTODO = { bg = colors.bg, fg = colors.magenta_bright },
		TodoSignUPDATE = { bg = colors.bg, fg = colors.magenta },
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
		UndotreeBranch = { fg = "#FF6666" },
		UndotreeCurrent = { fg = colors.red },
		UndotreeFirstNode = { fg = "#BE8FD7" },
		UndotreeHead = { fg = colors.green },
		UndotreeHelp = { fg = "#515C68" },
		UndotreeHelpKey = { bold = true, fg = colors.red },
		UndotreeHelpTitle = { fg = colors.red },
		UndotreeNext = { fg = colors.blue_bright },
		UndotreeNodeCurrent = { fg = "#E1C58D" },
		UndotreeNode = { fg = colors.green_bright },
		UndotreeSavedBig = { bg = "#202530", bold = true },
		UndotreeSavedSmall = { fg = colors.red_bright },
		UndotreeSeq = { fg = "#515C68" },
		UndotreeTimeStamp = { fg = colors.cyan_bright },
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
		WhichKey = { fg = colors.magenta_bright },
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
		TSRainbowCyan = { fg = "#79CAFF" },
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
		["@constant"] = { bold = true, fg = "#FF6666" },
		["@constant.macro"] = { fg = "#E37070" },
		["@constructor"] = { fg = colors.blue },
		["@debug"] = { fg = "#7AAFC5" },
		["@define"] = { fg = colors.magenta_bright },
		["@exception"] = { fg = "#6AA6DF" },
		["@field"] = { fg = colors.green },
		["@float"] = { fg = "#F3A4F1" },
		["@function.builtin"] = { bold = true, fg = colors.green },
		["@function"] = { fg = "#BE8FD7" },
		["@function.macro"] = { fg = "#FF7070" },
		["@include"] = { bold = true, fg = "#6AA6DF" },
		["@keyword.function"] = { fg = colors.red_bright },
		["@keyword"] = { fg = "#66B3FF" },
		["@keyword.operator"] = { fg = colors.cyan_bright },
		["@keyword.return"] = { fg = "#66B3FF" },
		["@label"] = { fg = colors.red },
		["@lua.constant.cmd"] = { bold = true, fg = "#60B0FC" },
		["@lua.constant.vim"] = { bold = true, fg = "#FF6666" },
		["@lua.function.pcall"] = { bold = true, fg = "#F98989" },
		["@lua.parameter.self"] = { bold = true, fg = "#FFCE66" },
		["@macro"] = { fg = "#F98989" },
		["@method"] = { fg = colors.magenta },
		["@namespace"] = { fg = "#60B0FC" },
		["@number"] = { fg = colors.cyan },
		["@operator"] = { fg = colors.cyan_bright },
		["@parameter"] = { fg = "#FFE49D" },
		["@preproc"] = { fg = "#F96262" },
		["@property"] = { fg = colors.cyan },
		["@punctuation.bracket"] = { fg = "#FF7D7D" },
		["@punctuation.delimiter"] = { fg = colors.blue_bright },
		["@punctuation"] = { fg = colors.blue_bright },
		["@repeat"] = { fg = colors.magenta },
		["@storageclass"] = { fg = "#F75858" },
		["@string.escape"] = { fg = "#E5E49D" },
		["@string"] = { fg = colors.green_bright },
		["@string.regex"] = { fg = "#FFE390" },
		["@string.special"] = { fg = colors.yellow },
		["@structure"] = { fg = colors.blue },
		["@tag"] = { fg = colors.blue_bright },
		["@text"] = { fg = colors.grey },
		["@text.literal"] = { fg = "#79CFAA" },
		["@text.reference"] = { fg = colors.blue_bright },
		["@text.title"] = { bold = true, fg = "#FA6969" },
		["@text.todo"] = { fg = colors.yellow_bright },
		["@text.underline"] = { undercurl = true },
		["@text.uri"] = { fg = colors.cyan_bright, undercurl = true },
		["@type.definition"] = { fg = colors.magenta_bright },
		["@type"] = { fg = colors.red },
		["@variable"] = { fg = colors.grey },
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
