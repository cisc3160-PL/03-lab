/**
 * Lexical grammar
 * 
 * https://github.com/DmitrySoshnikov/syntax/blob/master/examples/lang.lex
 */

{
    macros: {
        ident: `[a-zA-Z0-9_]`,
    },

    rules: [
        ["\\/\\/.*",                `/* skip comments */`],
        ["\/\\*[\\s\\S]*?\\*\/",    `/* skip comments */`],
        [`\\s+`,                    `/* skip whitespace */`],

        /* ------------ Keywords ------------ */

        [`\\blet\\b`,                  `return 'LET'`],
        [`\\bif\\b`,                   `return 'IF'`],
        [`\\belse\\b`,                 `return 'ELSE'`],
        [`\\btrue\\b`,                 `return 'TRUE'`],
        [`\\bfalse\\b`,                `return 'FALSE'`],
        [`\\bnull\\b`,                 `return 'NULL'`],
        [`\\breturn\\b`,               `return 'RETURN'`],
        [`\\bfn\\b`,                   `return 'FN'`],
        [`\\bdo\\b`,                   `return 'DO'`],
        [`\\bwhile\\b`,                `return 'WHILE'`],
        [`\\bfor\\b`,                  `return 'FOR'`],
        [`\\bbreak\\b`,                `return 'BREAK'`],
        [`\\bcontinue\\b`,             `return 'CONTINUE'`],
        [`\\bclass\\b`,                `return 'CLASS'`],
        [`\\bextends\\b`,              `return 'EXTENDS'`],
        [`\\bnew\\b`,                  `return 'NEW'`],
        [`\\bsuper\\b`,                `return 'SUPER'`],
        [`\\bthis\\b`,                 `return 'THIS'`],

        /* ------------ Symbols ------------ */

        [`\\->`,                    `return 'ARROW'`],

        [`\\(`,                     `return 'LPAREN'`],
        [`\\)`,                     `return 'RPAREN'`],

        [`\\{`,                     `return 'LCURLY'`],
        [`\\}`,                     `return 'RCURLY'`],

        [`\\[`,                     `return 'LBRACKET'`],
        [`\\]`,                     `return 'RBRACKET'`],

        [`:`,                       `return 'COLON'`],
        [`;`,                       `return 'SEMICOLON'`],
        [`,`,                       `return 'COMMA'`],

        [`\\.`,                     `return 'DOT'`],

        /* ------------ Logical Operators (||, &&) ------------ */

        [`\\|\\|`,                  `return 'LOGICAL_OR'`],
        [`&&`,                      `return 'LOGICAL_AND'`],
    
        /* ------------ Equality Operators (==, !=) ------------ */

        [`(=|!)=`,                  `return 'EQUALITY_OPERATOR'`],

        /* ------------ Assignment Operators (=, *=, /=, +=, -=) ------------ */

        [`=`,                       `return 'SIMPLE_ASSIGN'`],
        [`(\\*|\\/|\\+|\\-)=`,      `return 'COMPLEX_ASSIGN'`],

        /* ------------ Numbers ------------ */

        [`(\\d+(\\.\\d+)?)`,        `return 'NUMBER'`],


        /* ------------ Math Operators (+, -, *, /) ------------ */

        [`(\\+|\\-)`,               `return 'ADDITIVE_OPERATOR'`],
        [`(\\*|\\/)`,               `return 'MULTIPLICATIVE_OPERATOR'`],

        /* ------------ Relational Operators (>, >=, <, <=) ------------ */

        [`(>|<)=?`,                 `return 'RELATIONAL_OPERATOR'`],

        /* ------------ Strings ------------ */

        [`"[^"]*"`,                 `yytext = yytext.slice(1, -1); return 'STRING';`],
        [`'[^']*'`,                 `yytext = yytext.slice(1, -1); return 'CHAR';`],
        [`{ident}+`,                `return 'IDENTIFIER'`],
    ],
}