pesoMaximo :: Double
pesoMaximo = 5.0

 --pesoMaximo = 10.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " - " ++ show (peso e) ++ " - " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura = filter (\e -> peso e <= pesoMaximo)

totalDeFretes :: [Encomenda] -> Double
totalDeFretes = sum . map frete

main :: IO ()
main = do
  let item1 = Encomenda { destinatario = "Item A", peso = 2.0, frete = 15.0 }
  let item2 = Encomenda { destinatario = "Item B", peso = 6.5, frete = 30.0 }
  let item3 = Encomenda { destinatario = "Item C", peso = 4.8, frete = 22.5 }
  let item4 = Encomenda { destinatario = "Item D", peso = 8.0, frete = 40.0 }

  let listaGeral = [item1, item2, item3, item4]
  let listaFiltrada = cabemNaVassoura listaGeral

  mapM_ (putStrLn . descrever) listaGeral
  mapM_ (putStrLn . descrever) listaFiltrada

  print (totalDeFretes listaFiltrada)
