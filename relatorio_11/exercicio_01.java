abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " - " + feitico);
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " - Responsavel por mover a estrutura");
    }
}

public class Main {
    public static void main(String[] args) {
        Morador itemA = new Mago("Item 1", "Acao A");
        Morador itemB = new DemonioDoFogo("Item 2");

        itemA.apresentar();
        itemB.apresentar();

        // Morador itemC = new Morador("Item 3");
    }
}
