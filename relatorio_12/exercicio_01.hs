data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) =
  nome ++ " - " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let itemA = Cafe "Item A" 10.0 9
  let itemB = Cafe "Item B" 8.0 6
  let itemC = Cafe "Item C" 6.0 3

  putStrLn (descrever itemA ++ " - " ++ forca itemA)
  putStrLn (descrever itemB ++ " - " ++ forca itemB)
  putStrLn (descrever itemC ++ " - " ++ forca itemC)

  print (precoDoPedido True itemA)
  print (precoDoPedido False itemA)
