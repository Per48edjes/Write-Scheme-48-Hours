module Main (main) where

import System.Environment
import Text.ParserCombinators.Parsec hiding (spaces)

data LispVal
    = Atom String
    | List [LispVal]
    | DottedList [LispVal] LispVal
    | Number Integer
    | String String
    | Bool Bool

main :: IO ()
main = do
    (expr : _) <- getArgs -- getArgs :: IO [String]
    putStrLn (readExpr expr)

symbol :: Parser Char
symbol = oneOf "!#$%&|*+-/:<=>?@^_~"

readExpr :: String -> String
readExpr input = case parse (spaces >> symbol) "lisp" input of
    Left err -> "No match: " ++ show err
    Right x -> "Found value: " ++ show x

spaces :: Parser ()
spaces = skipMany1 space
