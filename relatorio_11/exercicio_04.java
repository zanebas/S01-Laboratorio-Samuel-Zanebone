import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Preparo tipo 1";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Preparo tipo 2";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        this.ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println(nome + " - " + panela.getMaterial());
        for (Monstro monstro : ingredientes) {
            System.out.println(monstro.getNome() + " - " + monstro.receita());
        }
    }
}

// Composicao: a instancia de Panela e criada diretamente dentro do construtor de Cozinheiro, dependendo de seu ciclo de vida e nao existindo de forma independente.
// Agregacao: as instancias de Monstro sao instanciadas externamente e passadas por parametro no metodo adicionarIngrediente, existindo independentemente.

public class Main {
    public static void main(String[] args) {
        Monstro itemA = new Slime("Item 1");
        Monstro itemB = new Mandragora("Item 2");

        Cozinheiro cozinheiro = new Cozinheiro("Responsavel 1", "Material A");

        cozinheiro.adicionarIngrediente(itemA);
        cozinheiro.adicionarIngrediente(itemB);

        cozinheiro.servirBanquete();
    }
}
