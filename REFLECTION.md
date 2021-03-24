# Reflection

## Problems Worked On
One of the main problems I had while working on Lab 2 was the steep learning curve in learning lex and yacc on top of C. While developing the Kuiper language, a major issue was having limited, predefined space in the symbol table, so I decided to do some research on how to implement ASTs for more flexibility. Being an imperative language, C was not the easiest tool to use to solve this problem, but it had been done by languages such as Ruby and Streem, so I decided to use those languages as reference. After some failed attempts, I decided to look for some existing solutions in a more comfortable language, and that's when I found [syntax](https://github.com/DmitrySoshnikov/syntax).

## Design Notes

### Language and tools
The syntactic analysis toolkit and language-agnostic parser generator provides options for using different LL and LR parsing algorithms, but I decided to stick with LALR(1) for simplicity. The grammar is written in Yacc/Bison/Jison format, using JavaScript for auxiliary code, with AST nodes in JSON format. The lexical grammar is also written in JSON format. The parser generator runs on Node, and provides options to directly parse a specified file, or to generate a language-specific parser module that can act as an interpreter.

This tool was perfect for my use case because I was more focused on developing the structure of the language rather than the logic of it. The tool is mainly used to parse and validate possible and legal language syntax, and display the parsed values (AST nodes).

### What I learned
Using the language examples from the toolkit, it was easier to understand the grammar written in JS format, and how the AST nodes were formed. I learned that left-recursion is a helpful property for creating lists of statements/expressions. Left-recursion is also helpful for describing the grammar of operators and their precedences. For optional expressions or lists, we can describe an empty rule and set its value to null. It was interesting to see how different components of the language could be described separately, but can be put together to form complex structures, such as lambda expressions, a mixture between variable assignment and function declaration.

### What could further improve the work
It would be nice to be able to convert the language's design back to C and implement the logic for it. Future features of the language may include more object-oriented structures and allow for abstraction.