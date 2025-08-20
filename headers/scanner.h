#pragma once

#include <stdio.h>
#include <iostream>
#include <cstdint>


// enum containing token types
typedef enum {
      // Single-character tokens.
  LEFT_PAREN, RIGHT_PAREN, LEFT_BRACE, RIGHT_BRACE,
  COMMA, DOT, MINUS, PLUS, SEMICOLON, SLASH, STAR,

  // One or two character tokens.
  BANG, BANG_EQUAL,
  EQUAL, EQUAL_EQUAL,
  GREATER, GREATER_EQUAL,
  LESS, LESS_EQUAL,

  // Literals.
  IDENTIFIER, STRING, NUMBER,

  // Keywords.
  AND, CLASS, ELSE, FALSE, FUN, FOR, IF, NIL, OR,
  PRINT, RETURN, SUPER, THIS, TRUE, VAR, WHILE, 
  EOFL
} TokenType;


typedef struct {
    std::string lexeme;
    TokenType type;
    uint32_t line;

} Token;

class Scanner {
    public:
        Scanner();
        ~Scanner();
    private:
}