data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "Vazio"
esbocoMaisRecente (e:_) = titulo e ++ " - " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos []     = 0
contarEsbocos (_:xs) = 1 + contarEsbocos xs

horasDesenhando :: [Esboco] -> Int
horasDesenhando []     = 0
horasDesenhando (e:xs) = horas e + horasDesenhando xs

main :: IO ()
main = do
  let item1 = Esboco { titulo = "Item 1", tecnica = "Tecnica A", horas = 3 }
  let item2 = Esboco { titulo = "Item 2", tecnica = "Tecnica B", horas = 5 }
  let item3 = Esboco { titulo = "Item 3", tecnica = "Tecnica C", horas = 2 }

  let listaA = [item1, item2, item3]

  putStrLn (esbocoMaisRecente listaA)
  print (contarEsbocos listaA)
  print (horasDesenhando listaA)

  putStrLn (esbocoMaisRecente [])

  let itemExtra = Esboco { titulo = "Item Extra", tecnica = "Tecnica D", horas = 4 }
  let listaB = itemExtra : listaA

  putStrLn (esbocoMaisRecente listaB)
  print (contarEsbocos listaB)

  putStrLn (esbocoMaisRecente listaA)
  print (contarEsbocos listaA)

  -- putStrLn (titulo (head []))
