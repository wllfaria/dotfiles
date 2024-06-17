#include "tree_sitter/parser.h"

#if defined(__GNUC__) || defined(__clang__)
#pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif

#define LANGUAGE_VERSION 14
#define STATE_COUNT 29
#define LARGE_STATE_COUNT 13
#define SYMBOL_COUNT 22
#define ALIAS_COUNT 0
#define TOKEN_COUNT 12
#define EXTERNAL_TOKEN_COUNT 0
#define FIELD_COUNT 0
#define MAX_ALIAS_SEQUENCE_LENGTH 3
#define PRODUCTION_ID_COUNT 1

enum ts_symbol_identifiers {
  anon_sym_LBRACK = 1,
  aux_sym_comment_loop_token1 = 2,
  anon_sym_RBRACK = 3,
  sym_pointerleft = 4,
  sym_pointerright = 5,
  sym_memoryadd = 6,
  sym_memorysubtract = 7,
  sym_memoryinput = 8,
  sym_memoryoutput = 9,
  sym_comment = 10,
  sym_ext_debugger = 11,
  sym_source_file = 12,
  sym_initial_comment = 13,
  sym__any_comment = 14,
  sym_comment_loop = 15,
  sym__any = 16,
  sym_loop = 17,
  sym__command = 18,
  aux_sym_source_file_repeat1 = 19,
  aux_sym__any_comment_repeat1 = 20,
  aux_sym_comment_loop_repeat1 = 21,
};

static const char * const ts_symbol_names[] = {
  [ts_builtin_sym_end] = "end",
  [anon_sym_LBRACK] = "[",
  [aux_sym_comment_loop_token1] = "comment_loop_token1",
  [anon_sym_RBRACK] = "]",
  [sym_pointerleft] = "pointerleft",
  [sym_pointerright] = "pointerright",
  [sym_memoryadd] = "memoryadd",
  [sym_memorysubtract] = "memorysubtract",
  [sym_memoryinput] = "memoryinput",
  [sym_memoryoutput] = "memoryoutput",
  [sym_comment] = "comment",
  [sym_ext_debugger] = "ext_debugger",
  [sym_source_file] = "source_file",
  [sym_initial_comment] = "initial_comment",
  [sym__any_comment] = "_any_comment",
  [sym_comment_loop] = "comment_loop",
  [sym__any] = "_any",
  [sym_loop] = "loop",
  [sym__command] = "_command",
  [aux_sym_source_file_repeat1] = "source_file_repeat1",
  [aux_sym__any_comment_repeat1] = "_any_comment_repeat1",
  [aux_sym_comment_loop_repeat1] = "comment_loop_repeat1",
};

static const TSSymbol ts_symbol_map[] = {
  [ts_builtin_sym_end] = ts_builtin_sym_end,
  [anon_sym_LBRACK] = anon_sym_LBRACK,
  [aux_sym_comment_loop_token1] = aux_sym_comment_loop_token1,
  [anon_sym_RBRACK] = anon_sym_RBRACK,
  [sym_pointerleft] = sym_pointerleft,
  [sym_pointerright] = sym_pointerright,
  [sym_memoryadd] = sym_memoryadd,
  [sym_memorysubtract] = sym_memorysubtract,
  [sym_memoryinput] = sym_memoryinput,
  [sym_memoryoutput] = sym_memoryoutput,
  [sym_comment] = sym_comment,
  [sym_ext_debugger] = sym_ext_debugger,
  [sym_source_file] = sym_source_file,
  [sym_initial_comment] = sym_initial_comment,
  [sym__any_comment] = sym__any_comment,
  [sym_comment_loop] = sym_comment_loop,
  [sym__any] = sym__any,
  [sym_loop] = sym_loop,
  [sym__command] = sym__command,
  [aux_sym_source_file_repeat1] = aux_sym_source_file_repeat1,
  [aux_sym__any_comment_repeat1] = aux_sym__any_comment_repeat1,
  [aux_sym_comment_loop_repeat1] = aux_sym_comment_loop_repeat1,
};

static const TSSymbolMetadata ts_symbol_metadata[] = {
  [ts_builtin_sym_end] = {
    .visible = false,
    .named = true,
  },
  [anon_sym_LBRACK] = {
    .visible = true,
    .named = false,
  },
  [aux_sym_comment_loop_token1] = {
    .visible = false,
    .named = false,
  },
  [anon_sym_RBRACK] = {
    .visible = true,
    .named = false,
  },
  [sym_pointerleft] = {
    .visible = true,
    .named = true,
  },
  [sym_pointerright] = {
    .visible = true,
    .named = true,
  },
  [sym_memoryadd] = {
    .visible = true,
    .named = true,
  },
  [sym_memorysubtract] = {
    .visible = true,
    .named = true,
  },
  [sym_memoryinput] = {
    .visible = true,
    .named = true,
  },
  [sym_memoryoutput] = {
    .visible = true,
    .named = true,
  },
  [sym_comment] = {
    .visible = true,
    .named = true,
  },
  [sym_ext_debugger] = {
    .visible = true,
    .named = true,
  },
  [sym_source_file] = {
    .visible = true,
    .named = true,
  },
  [sym_initial_comment] = {
    .visible = true,
    .named = true,
  },
  [sym__any_comment] = {
    .visible = false,
    .named = true,
  },
  [sym_comment_loop] = {
    .visible = true,
    .named = true,
  },
  [sym__any] = {
    .visible = false,
    .named = true,
  },
  [sym_loop] = {
    .visible = true,
    .named = true,
  },
  [sym__command] = {
    .visible = false,
    .named = true,
  },
  [aux_sym_source_file_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym__any_comment_repeat1] = {
    .visible = false,
    .named = false,
  },
  [aux_sym_comment_loop_repeat1] = {
    .visible = false,
    .named = false,
  },
};

static const TSSymbol ts_alias_sequences[PRODUCTION_ID_COUNT][MAX_ALIAS_SEQUENCE_LENGTH] = {
  [0] = {0},
};

static const uint16_t ts_non_terminal_alias_map[] = {
  0,
};

static const TSStateId ts_primary_state_ids[STATE_COUNT] = {
  [0] = 0,
  [1] = 1,
  [2] = 2,
  [3] = 2,
  [4] = 4,
  [5] = 5,
  [6] = 6,
  [7] = 7,
  [8] = 8,
  [9] = 9,
  [10] = 10,
  [11] = 11,
  [12] = 12,
  [13] = 13,
  [14] = 14,
  [15] = 15,
  [16] = 16,
  [17] = 17,
  [18] = 18,
  [19] = 18,
  [20] = 20,
  [21] = 21,
  [22] = 22,
  [23] = 23,
  [24] = 22,
  [25] = 21,
  [26] = 16,
  [27] = 17,
  [28] = 28,
};

static bool ts_lex(TSLexer *lexer, TSStateId state) {
  START_LEXER();
  eof = lexer->eof(lexer);
  switch (state) {
    case 0:
      if (eof) ADVANCE(3);
      ADVANCE_MAP(
        '#', 25,
        '+', 15,
        ',', 19,
        '-', 17,
        '.', 21,
        '<', 11,
        '>', 13,
        '[', 4,
        ']', 9,
      );
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(5);
      if (lookahead != 0) ADVANCE(7);
      END_STATE();
    case 1:
      if (lookahead == '[') ADVANCE(4);
      if (lookahead == ']') ADVANCE(9);
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(6);
      if (lookahead != 0) ADVANCE(8);
      END_STATE();
    case 2:
      if (eof) ADVANCE(3);
      ADVANCE_MAP(
        '#', 24,
        '+', 14,
        ',', 18,
        '-', 16,
        '.', 20,
        '<', 10,
        '>', 12,
        '[', 4,
        ']', 9,
      );
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(22);
      if (lookahead != 0) ADVANCE(23);
      END_STATE();
    case 3:
      ACCEPT_TOKEN(ts_builtin_sym_end);
      END_STATE();
    case 4:
      ACCEPT_TOKEN(anon_sym_LBRACK);
      END_STATE();
    case 5:
      ACCEPT_TOKEN(aux_sym_comment_loop_token1);
      if (lookahead == '#') ADVANCE(25);
      if (lookahead == '+') ADVANCE(15);
      if (lookahead == ',') ADVANCE(19);
      if (lookahead == '-') ADVANCE(17);
      if (lookahead == '.') ADVANCE(21);
      if (lookahead == '<') ADVANCE(11);
      if (lookahead == '>') ADVANCE(13);
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(5);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(7);
      END_STATE();
    case 6:
      ACCEPT_TOKEN(aux_sym_comment_loop_token1);
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(6);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 7:
      ACCEPT_TOKEN(aux_sym_comment_loop_token1);
      if (lookahead == '#' ||
          ('+' <= lookahead && lookahead <= '.') ||
          lookahead == '<' ||
          lookahead == '>') ADVANCE(8);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(7);
      END_STATE();
    case 8:
      ACCEPT_TOKEN(aux_sym_comment_loop_token1);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 9:
      ACCEPT_TOKEN(anon_sym_RBRACK);
      END_STATE();
    case 10:
      ACCEPT_TOKEN(sym_pointerleft);
      END_STATE();
    case 11:
      ACCEPT_TOKEN(sym_pointerleft);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 12:
      ACCEPT_TOKEN(sym_pointerright);
      END_STATE();
    case 13:
      ACCEPT_TOKEN(sym_pointerright);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 14:
      ACCEPT_TOKEN(sym_memoryadd);
      END_STATE();
    case 15:
      ACCEPT_TOKEN(sym_memoryadd);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 16:
      ACCEPT_TOKEN(sym_memorysubtract);
      END_STATE();
    case 17:
      ACCEPT_TOKEN(sym_memorysubtract);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 18:
      ACCEPT_TOKEN(sym_memoryinput);
      END_STATE();
    case 19:
      ACCEPT_TOKEN(sym_memoryinput);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 20:
      ACCEPT_TOKEN(sym_memoryoutput);
      END_STATE();
    case 21:
      ACCEPT_TOKEN(sym_memoryoutput);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    case 22:
      ACCEPT_TOKEN(sym_comment);
      if (('\t' <= lookahead && lookahead <= '\r') ||
          lookahead == ' ') ADVANCE(22);
      if (lookahead != 0 &&
          lookahead != '#' &&
          (lookahead < '+' || '.' < lookahead) &&
          lookahead != '<' &&
          lookahead != '>' &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(23);
      END_STATE();
    case 23:
      ACCEPT_TOKEN(sym_comment);
      if (lookahead != 0 &&
          lookahead != '#' &&
          (lookahead < '+' || '.' < lookahead) &&
          lookahead != '<' &&
          lookahead != '>' &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(23);
      END_STATE();
    case 24:
      ACCEPT_TOKEN(sym_ext_debugger);
      END_STATE();
    case 25:
      ACCEPT_TOKEN(sym_ext_debugger);
      if (lookahead != 0 &&
          lookahead != '[' &&
          lookahead != ']') ADVANCE(8);
      END_STATE();
    default:
      return false;
  }
}

static const TSLexMode ts_lex_modes[STATE_COUNT] = {
  [0] = {.lex_state = 0},
  [1] = {.lex_state = 2},
  [2] = {.lex_state = 0},
  [3] = {.lex_state = 0},
  [4] = {.lex_state = 2},
  [5] = {.lex_state = 2},
  [6] = {.lex_state = 2},
  [7] = {.lex_state = 2},
  [8] = {.lex_state = 2},
  [9] = {.lex_state = 2},
  [10] = {.lex_state = 2},
  [11] = {.lex_state = 2},
  [12] = {.lex_state = 2},
  [13] = {.lex_state = 2},
  [14] = {.lex_state = 2},
  [15] = {.lex_state = 2},
  [16] = {.lex_state = 2},
  [17] = {.lex_state = 2},
  [18] = {.lex_state = 0},
  [19] = {.lex_state = 2},
  [20] = {.lex_state = 2},
  [21] = {.lex_state = 1},
  [22] = {.lex_state = 1},
  [23] = {.lex_state = 1},
  [24] = {.lex_state = 1},
  [25] = {.lex_state = 1},
  [26] = {.lex_state = 1},
  [27] = {.lex_state = 1},
  [28] = {.lex_state = 0},
};

static const uint16_t ts_parse_table[LARGE_STATE_COUNT][SYMBOL_COUNT] = {
  [0] = {
    [ts_builtin_sym_end] = ACTIONS(1),
    [anon_sym_LBRACK] = ACTIONS(1),
    [aux_sym_comment_loop_token1] = ACTIONS(1),
    [anon_sym_RBRACK] = ACTIONS(1),
    [sym_pointerleft] = ACTIONS(1),
    [sym_pointerright] = ACTIONS(1),
    [sym_memoryadd] = ACTIONS(1),
    [sym_memorysubtract] = ACTIONS(1),
    [sym_memoryinput] = ACTIONS(1),
    [sym_memoryoutput] = ACTIONS(1),
    [sym_comment] = ACTIONS(1),
    [sym_ext_debugger] = ACTIONS(1),
  },
  [1] = {
    [sym_source_file] = STATE(28),
    [sym_initial_comment] = STATE(6),
    [sym__any_comment] = STATE(20),
    [sym_comment_loop] = STATE(11),
    [sym__any] = STATE(8),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(8),
    [aux_sym_source_file_repeat1] = STATE(8),
    [aux_sym__any_comment_repeat1] = STATE(11),
    [ts_builtin_sym_end] = ACTIONS(3),
    [anon_sym_LBRACK] = ACTIONS(5),
    [sym_pointerleft] = ACTIONS(7),
    [sym_pointerright] = ACTIONS(7),
    [sym_memoryadd] = ACTIONS(7),
    [sym_memorysubtract] = ACTIONS(7),
    [sym_memoryinput] = ACTIONS(7),
    [sym_memoryoutput] = ACTIONS(7),
    [sym_comment] = ACTIONS(9),
    [sym_ext_debugger] = ACTIONS(11),
  },
  [2] = {
    [sym_comment_loop] = STATE(22),
    [sym__any] = STATE(9),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(9),
    [aux_sym_source_file_repeat1] = STATE(9),
    [aux_sym_comment_loop_repeat1] = STATE(22),
    [anon_sym_LBRACK] = ACTIONS(13),
    [aux_sym_comment_loop_token1] = ACTIONS(15),
    [anon_sym_RBRACK] = ACTIONS(17),
    [sym_pointerleft] = ACTIONS(19),
    [sym_pointerright] = ACTIONS(19),
    [sym_memoryadd] = ACTIONS(19),
    [sym_memorysubtract] = ACTIONS(19),
    [sym_memoryinput] = ACTIONS(19),
    [sym_memoryoutput] = ACTIONS(19),
    [sym_comment] = ACTIONS(19),
    [sym_ext_debugger] = ACTIONS(19),
  },
  [3] = {
    [sym_comment_loop] = STATE(24),
    [sym__any] = STATE(9),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(9),
    [aux_sym_source_file_repeat1] = STATE(9),
    [aux_sym_comment_loop_repeat1] = STATE(24),
    [anon_sym_LBRACK] = ACTIONS(13),
    [aux_sym_comment_loop_token1] = ACTIONS(21),
    [anon_sym_RBRACK] = ACTIONS(23),
    [sym_pointerleft] = ACTIONS(19),
    [sym_pointerright] = ACTIONS(19),
    [sym_memoryadd] = ACTIONS(19),
    [sym_memorysubtract] = ACTIONS(19),
    [sym_memoryinput] = ACTIONS(19),
    [sym_memoryoutput] = ACTIONS(19),
    [sym_comment] = ACTIONS(19),
    [sym_ext_debugger] = ACTIONS(19),
  },
  [4] = {
    [sym__any] = STATE(4),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(4),
    [aux_sym_source_file_repeat1] = STATE(4),
    [ts_builtin_sym_end] = ACTIONS(25),
    [anon_sym_LBRACK] = ACTIONS(27),
    [anon_sym_RBRACK] = ACTIONS(30),
    [sym_pointerleft] = ACTIONS(32),
    [sym_pointerright] = ACTIONS(32),
    [sym_memoryadd] = ACTIONS(32),
    [sym_memorysubtract] = ACTIONS(32),
    [sym_memoryinput] = ACTIONS(32),
    [sym_memoryoutput] = ACTIONS(32),
    [sym_comment] = ACTIONS(35),
    [sym_ext_debugger] = ACTIONS(32),
  },
  [5] = {
    [sym__any] = STATE(4),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(4),
    [aux_sym_source_file_repeat1] = STATE(4),
    [ts_builtin_sym_end] = ACTIONS(38),
    [anon_sym_LBRACK] = ACTIONS(40),
    [sym_pointerleft] = ACTIONS(42),
    [sym_pointerright] = ACTIONS(42),
    [sym_memoryadd] = ACTIONS(42),
    [sym_memorysubtract] = ACTIONS(42),
    [sym_memoryinput] = ACTIONS(42),
    [sym_memoryoutput] = ACTIONS(42),
    [sym_comment] = ACTIONS(44),
    [sym_ext_debugger] = ACTIONS(42),
  },
  [6] = {
    [sym__any] = STATE(5),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(5),
    [aux_sym_source_file_repeat1] = STATE(5),
    [ts_builtin_sym_end] = ACTIONS(46),
    [anon_sym_LBRACK] = ACTIONS(40),
    [sym_pointerleft] = ACTIONS(48),
    [sym_pointerright] = ACTIONS(48),
    [sym_memoryadd] = ACTIONS(48),
    [sym_memorysubtract] = ACTIONS(48),
    [sym_memoryinput] = ACTIONS(48),
    [sym_memoryoutput] = ACTIONS(48),
    [sym_comment] = ACTIONS(50),
    [sym_ext_debugger] = ACTIONS(48),
  },
  [7] = {
    [sym__any_comment] = STATE(14),
    [sym_comment_loop] = STATE(11),
    [aux_sym__any_comment_repeat1] = STATE(11),
    [ts_builtin_sym_end] = ACTIONS(52),
    [anon_sym_LBRACK] = ACTIONS(54),
    [anon_sym_RBRACK] = ACTIONS(56),
    [sym_pointerleft] = ACTIONS(56),
    [sym_pointerright] = ACTIONS(56),
    [sym_memoryadd] = ACTIONS(56),
    [sym_memorysubtract] = ACTIONS(56),
    [sym_memoryinput] = ACTIONS(56),
    [sym_memoryoutput] = ACTIONS(56),
    [sym_comment] = ACTIONS(9),
    [sym_ext_debugger] = ACTIONS(11),
  },
  [8] = {
    [sym__any] = STATE(4),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(4),
    [aux_sym_source_file_repeat1] = STATE(4),
    [ts_builtin_sym_end] = ACTIONS(46),
    [anon_sym_LBRACK] = ACTIONS(40),
    [sym_pointerleft] = ACTIONS(42),
    [sym_pointerright] = ACTIONS(42),
    [sym_memoryadd] = ACTIONS(42),
    [sym_memorysubtract] = ACTIONS(42),
    [sym_memoryinput] = ACTIONS(42),
    [sym_memoryoutput] = ACTIONS(42),
    [sym_comment] = ACTIONS(44),
    [sym_ext_debugger] = ACTIONS(42),
  },
  [9] = {
    [sym__any] = STATE(4),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(4),
    [aux_sym_source_file_repeat1] = STATE(4),
    [anon_sym_LBRACK] = ACTIONS(40),
    [anon_sym_RBRACK] = ACTIONS(58),
    [sym_pointerleft] = ACTIONS(42),
    [sym_pointerright] = ACTIONS(42),
    [sym_memoryadd] = ACTIONS(42),
    [sym_memorysubtract] = ACTIONS(42),
    [sym_memoryinput] = ACTIONS(42),
    [sym_memoryoutput] = ACTIONS(42),
    [sym_comment] = ACTIONS(44),
    [sym_ext_debugger] = ACTIONS(42),
  },
  [10] = {
    [sym__any] = STATE(9),
    [sym_loop] = STATE(7),
    [sym__command] = STATE(9),
    [aux_sym_source_file_repeat1] = STATE(9),
    [anon_sym_LBRACK] = ACTIONS(40),
    [anon_sym_RBRACK] = ACTIONS(60),
    [sym_pointerleft] = ACTIONS(19),
    [sym_pointerright] = ACTIONS(19),
    [sym_memoryadd] = ACTIONS(19),
    [sym_memorysubtract] = ACTIONS(19),
    [sym_memoryinput] = ACTIONS(19),
    [sym_memoryoutput] = ACTIONS(19),
    [sym_comment] = ACTIONS(62),
    [sym_ext_debugger] = ACTIONS(19),
  },
  [11] = {
    [sym_comment_loop] = STATE(12),
    [aux_sym__any_comment_repeat1] = STATE(12),
    [ts_builtin_sym_end] = ACTIONS(64),
    [anon_sym_LBRACK] = ACTIONS(54),
    [anon_sym_RBRACK] = ACTIONS(66),
    [sym_pointerleft] = ACTIONS(66),
    [sym_pointerright] = ACTIONS(66),
    [sym_memoryadd] = ACTIONS(66),
    [sym_memorysubtract] = ACTIONS(66),
    [sym_memoryinput] = ACTIONS(66),
    [sym_memoryoutput] = ACTIONS(66),
    [sym_comment] = ACTIONS(68),
    [sym_ext_debugger] = ACTIONS(70),
  },
  [12] = {
    [sym_comment_loop] = STATE(12),
    [aux_sym__any_comment_repeat1] = STATE(12),
    [ts_builtin_sym_end] = ACTIONS(72),
    [anon_sym_LBRACK] = ACTIONS(74),
    [anon_sym_RBRACK] = ACTIONS(77),
    [sym_pointerleft] = ACTIONS(77),
    [sym_pointerright] = ACTIONS(77),
    [sym_memoryadd] = ACTIONS(77),
    [sym_memorysubtract] = ACTIONS(77),
    [sym_memoryinput] = ACTIONS(77),
    [sym_memoryoutput] = ACTIONS(77),
    [sym_comment] = ACTIONS(79),
    [sym_ext_debugger] = ACTIONS(82),
  },
};

static const uint16_t ts_small_parse_table[] = {
  [0] = 2,
    ACTIONS(85), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(87), 9,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [16] = 2,
    ACTIONS(89), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(91), 9,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [32] = 2,
    ACTIONS(93), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(95), 9,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [48] = 2,
    ACTIONS(97), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(99), 9,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [64] = 2,
    ACTIONS(101), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(103), 9,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [80] = 2,
    ACTIONS(103), 3,
      anon_sym_LBRACK,
      aux_sym_comment_loop_token1,
      anon_sym_RBRACK,
    ACTIONS(87), 8,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_comment,
      sym_ext_debugger,
  [96] = 2,
    ACTIONS(101), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(103), 8,
      anon_sym_LBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [111] = 2,
    ACTIONS(105), 2,
      ts_builtin_sym_end,
      sym_comment,
    ACTIONS(107), 8,
      anon_sym_LBRACK,
      sym_pointerleft,
      sym_pointerright,
      sym_memoryadd,
      sym_memorysubtract,
      sym_memoryinput,
      sym_memoryoutput,
      sym_ext_debugger,
  [126] = 4,
    ACTIONS(109), 1,
      anon_sym_LBRACK,
    ACTIONS(111), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(113), 1,
      anon_sym_RBRACK,
    STATE(22), 2,
      sym_comment_loop,
      aux_sym_comment_loop_repeat1,
  [140] = 4,
    ACTIONS(109), 1,
      anon_sym_LBRACK,
    ACTIONS(115), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(117), 1,
      anon_sym_RBRACK,
    STATE(23), 2,
      sym_comment_loop,
      aux_sym_comment_loop_repeat1,
  [154] = 4,
    ACTIONS(119), 1,
      anon_sym_LBRACK,
    ACTIONS(122), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(125), 1,
      anon_sym_RBRACK,
    STATE(23), 2,
      sym_comment_loop,
      aux_sym_comment_loop_repeat1,
  [168] = 4,
    ACTIONS(109), 1,
      anon_sym_LBRACK,
    ACTIONS(115), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(127), 1,
      anon_sym_RBRACK,
    STATE(23), 2,
      sym_comment_loop,
      aux_sym_comment_loop_repeat1,
  [182] = 4,
    ACTIONS(109), 1,
      anon_sym_LBRACK,
    ACTIONS(129), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(131), 1,
      anon_sym_RBRACK,
    STATE(24), 2,
      sym_comment_loop,
      aux_sym_comment_loop_repeat1,
  [196] = 2,
    ACTIONS(97), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(99), 2,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
  [204] = 2,
    ACTIONS(101), 1,
      aux_sym_comment_loop_token1,
    ACTIONS(103), 2,
      anon_sym_LBRACK,
      anon_sym_RBRACK,
  [212] = 1,
    ACTIONS(133), 1,
      ts_builtin_sym_end,
};

static const uint32_t ts_small_parse_table_map[] = {
  [SMALL_STATE(13)] = 0,
  [SMALL_STATE(14)] = 16,
  [SMALL_STATE(15)] = 32,
  [SMALL_STATE(16)] = 48,
  [SMALL_STATE(17)] = 64,
  [SMALL_STATE(18)] = 80,
  [SMALL_STATE(19)] = 96,
  [SMALL_STATE(20)] = 111,
  [SMALL_STATE(21)] = 126,
  [SMALL_STATE(22)] = 140,
  [SMALL_STATE(23)] = 154,
  [SMALL_STATE(24)] = 168,
  [SMALL_STATE(25)] = 182,
  [SMALL_STATE(26)] = 196,
  [SMALL_STATE(27)] = 204,
  [SMALL_STATE(28)] = 212,
};

static const TSParseActionEntry ts_parse_actions[] = {
  [0] = {.entry = {.count = 0, .reusable = false}},
  [1] = {.entry = {.count = 1, .reusable = false}}, RECOVER(),
  [3] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_source_file, 0, 0, 0),
  [5] = {.entry = {.count = 1, .reusable = false}}, SHIFT(2),
  [7] = {.entry = {.count = 1, .reusable = false}}, SHIFT(8),
  [9] = {.entry = {.count = 1, .reusable = true}}, SHIFT(11),
  [11] = {.entry = {.count = 1, .reusable = false}}, SHIFT(11),
  [13] = {.entry = {.count = 1, .reusable = false}}, SHIFT(3),
  [15] = {.entry = {.count = 1, .reusable = false}}, SHIFT(22),
  [17] = {.entry = {.count = 1, .reusable = false}}, SHIFT(19),
  [19] = {.entry = {.count = 1, .reusable = false}}, SHIFT(9),
  [21] = {.entry = {.count = 1, .reusable = false}}, SHIFT(24),
  [23] = {.entry = {.count = 1, .reusable = false}}, SHIFT(18),
  [25] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym_source_file_repeat1, 2, 0, 0),
  [27] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_source_file_repeat1, 2, 0, 0), SHIFT_REPEAT(10),
  [30] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_source_file_repeat1, 2, 0, 0),
  [32] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_source_file_repeat1, 2, 0, 0), SHIFT_REPEAT(4),
  [35] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_source_file_repeat1, 2, 0, 0), SHIFT_REPEAT(4),
  [38] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_source_file, 2, 0, 0),
  [40] = {.entry = {.count = 1, .reusable = false}}, SHIFT(10),
  [42] = {.entry = {.count = 1, .reusable = false}}, SHIFT(4),
  [44] = {.entry = {.count = 1, .reusable = true}}, SHIFT(4),
  [46] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_source_file, 1, 0, 0),
  [48] = {.entry = {.count = 1, .reusable = false}}, SHIFT(5),
  [50] = {.entry = {.count = 1, .reusable = true}}, SHIFT(5),
  [52] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__any, 1, 0, 0),
  [54] = {.entry = {.count = 1, .reusable = false}}, SHIFT(21),
  [56] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__any, 1, 0, 0),
  [58] = {.entry = {.count = 1, .reusable = false}}, SHIFT(15),
  [60] = {.entry = {.count = 1, .reusable = false}}, SHIFT(13),
  [62] = {.entry = {.count = 1, .reusable = true}}, SHIFT(9),
  [64] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__any_comment, 1, 0, 0),
  [66] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__any_comment, 1, 0, 0),
  [68] = {.entry = {.count = 1, .reusable = true}}, SHIFT(12),
  [70] = {.entry = {.count = 1, .reusable = false}}, SHIFT(12),
  [72] = {.entry = {.count = 1, .reusable = true}}, REDUCE(aux_sym__any_comment_repeat1, 2, 0, 0),
  [74] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym__any_comment_repeat1, 2, 0, 0), SHIFT_REPEAT(21),
  [77] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym__any_comment_repeat1, 2, 0, 0),
  [79] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym__any_comment_repeat1, 2, 0, 0), SHIFT_REPEAT(12),
  [82] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym__any_comment_repeat1, 2, 0, 0), SHIFT_REPEAT(12),
  [85] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_loop, 2, 0, 0),
  [87] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_loop, 2, 0, 0),
  [89] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym__any, 2, 0, 0),
  [91] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym__any, 2, 0, 0),
  [93] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_loop, 3, 0, 0),
  [95] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_loop, 3, 0, 0),
  [97] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment_loop, 3, 0, 0),
  [99] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_comment_loop, 3, 0, 0),
  [101] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_comment_loop, 2, 0, 0),
  [103] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_comment_loop, 2, 0, 0),
  [105] = {.entry = {.count = 1, .reusable = true}}, REDUCE(sym_initial_comment, 1, 0, 0),
  [107] = {.entry = {.count = 1, .reusable = false}}, REDUCE(sym_initial_comment, 1, 0, 0),
  [109] = {.entry = {.count = 1, .reusable = false}}, SHIFT(25),
  [111] = {.entry = {.count = 1, .reusable = true}}, SHIFT(22),
  [113] = {.entry = {.count = 1, .reusable = false}}, SHIFT(17),
  [115] = {.entry = {.count = 1, .reusable = true}}, SHIFT(23),
  [117] = {.entry = {.count = 1, .reusable = false}}, SHIFT(16),
  [119] = {.entry = {.count = 2, .reusable = false}}, REDUCE(aux_sym_comment_loop_repeat1, 2, 0, 0), SHIFT_REPEAT(25),
  [122] = {.entry = {.count = 2, .reusable = true}}, REDUCE(aux_sym_comment_loop_repeat1, 2, 0, 0), SHIFT_REPEAT(23),
  [125] = {.entry = {.count = 1, .reusable = false}}, REDUCE(aux_sym_comment_loop_repeat1, 2, 0, 0),
  [127] = {.entry = {.count = 1, .reusable = false}}, SHIFT(26),
  [129] = {.entry = {.count = 1, .reusable = true}}, SHIFT(24),
  [131] = {.entry = {.count = 1, .reusable = false}}, SHIFT(27),
  [133] = {.entry = {.count = 1, .reusable = true}},  ACCEPT_INPUT(),
};

#ifdef __cplusplus
extern "C" {
#endif
#ifdef TREE_SITTER_HIDE_SYMBOLS
#define TS_PUBLIC
#elif defined(_WIN32)
#define TS_PUBLIC __declspec(dllexport)
#else
#define TS_PUBLIC __attribute__((visibility("default")))
#endif

TS_PUBLIC const TSLanguage *tree_sitter_brainfuck(void) {
  static const TSLanguage language = {
    .version = LANGUAGE_VERSION,
    .symbol_count = SYMBOL_COUNT,
    .alias_count = ALIAS_COUNT,
    .token_count = TOKEN_COUNT,
    .external_token_count = EXTERNAL_TOKEN_COUNT,
    .state_count = STATE_COUNT,
    .large_state_count = LARGE_STATE_COUNT,
    .production_id_count = PRODUCTION_ID_COUNT,
    .field_count = FIELD_COUNT,
    .max_alias_sequence_length = MAX_ALIAS_SEQUENCE_LENGTH,
    .parse_table = &ts_parse_table[0][0],
    .small_parse_table = ts_small_parse_table,
    .small_parse_table_map = ts_small_parse_table_map,
    .parse_actions = ts_parse_actions,
    .symbol_names = ts_symbol_names,
    .symbol_metadata = ts_symbol_metadata,
    .public_symbol_map = ts_symbol_map,
    .alias_map = ts_non_terminal_alias_map,
    .alias_sequences = &ts_alias_sequences[0][0],
    .lex_modes = ts_lex_modes,
    .lex_fn = ts_lex,
    .primary_state_ids = ts_primary_state_ids,
  };
  return &language;
}
#ifdef __cplusplus
}
#endif
