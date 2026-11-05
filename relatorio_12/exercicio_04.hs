data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " - " ++ servico a ++ " - " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let item1 = Atendimento { cliente = "Item A", servico = "Servico 1", valor = 50.0, etapa = NaFila }
  let item2 = Atendimento { cliente = "Item B", servico = "Servico 2", valor = 80.0, etapa = NoBanho }
  let item3 = Atendimento { cliente = "Item C", servico = "Servico 3", valor = 120.0, etapa = NaFila }

  let listaOriginal = [item1, item2, item3]
  let listaNova = [concluir item1, item2, concluir item3]

  mapM_ (putStrLn . descrever) listaOriginal
  print (arrecadado listaOriginal)

  mapM_ (putStrLn . descrever) listaNova
  print (arrecadado listaNova)
