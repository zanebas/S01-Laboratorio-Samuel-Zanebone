import java.util.ArrayList;

class ItemDoCardapio {
    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return preco;
    }
}

class ComboLeblanc extends ItemDoCardapio {
    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}

class CafeLeblanc {
    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        this.cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        this.cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio item : cardapio) {
            System.out.println(item.getNome() + " - " + item.precoFinal());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        ItemDoCardapio item1 = new ItemDoCardapio("Item A", 10.0);
        ItemDoCardapio item2 = new ItemDoCardapio("Item B", 20.0);
        ComboLeblanc combo1 = new ComboLeblanc("Item C", 30.0);

        CafeLeblanc cafe = new CafeLeblanc();
        cafe.adicionar(item1);
        cafe.adicionar(item2);
        cafe.adicionar(combo1);

        cafe.mostrarCardapio();
    }
}
