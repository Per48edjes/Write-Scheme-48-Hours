module Main (module Main) where

main :: IO ()
main = do
    putStrLn "Please enter something:"
    userInput <- getLine
    if null userInput
        then do
            putStrLn "You didn't enter anything. Please try again."
            main -- Recursive call to keep prompting
        else putStrLn $ "You entered: " ++ userInput
