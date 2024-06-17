module.exports = grammar({
  name: 'brainfuck',

  rules: {
    source_file: $ => seq(optional($.initial_comment), repeat($._any)),

    initial_comment: $ => $._any_comment,
    _any_comment: $ => prec.right(repeat1(prec(10, choice($.comment_loop, $.comment, $.ext_debugger)))), // include ext_debugger as comment because (1) some ignore it and (2) it doesn't affect the memory/pointers
    comment_loop: $ => prec(10, seq('[', repeat(choice($.comment_loop, /[^\[\]]+/)), ']')),

    _any: $ => prec.right(choice(seq($.loop, optional($._any_comment)), $._command, $.comment)),
    loop: $ => seq('[', repeat($._any), ']'),
    _command: $ => choice($.pointerleft, $.pointerright, $.memoryadd, $.memorysubtract, $.memoryinput, $.memoryoutput, $.ext_debugger),
    pointerleft: $ => '<',
    pointerright: $ => '>',
    memoryadd: $ => '+',
    memorysubtract: $ => '-',
    memoryinput: $ => ',',
    memoryoutput: $ => '.',

    comment: $ => /[^<>+\-\[\],.#]+/,

    ext_debugger: $ => '#'
  }
});
