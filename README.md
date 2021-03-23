# 03-lab
A WIP language built on JavaScript/NodeJS

## Parser
This project uses [Syntax: a language-agnostic parser generator](https://github.com/DmitrySoshnikov/syntax)

## Installation
Install the syntactic analysis toolkit:
```sh
npm install -g syntax-cli

syntax-cli --help
```

## Compilation
Compile the lex and grammar in LALR(1) mode using the toolkit, and input a test file to parse:
```sh
syntax-cli
    --grammar src/lang.bnf
    --lex src/lang.lex
    --mode LALR1
    --file examples/test.lang
```