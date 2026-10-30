import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " - Manifestacao do tipo 1");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " - Manifestacao do tipo 2");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        this.avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural ser = this.avistamentos.get(local);
        if (ser == null) {
            System.out.println(local + " - Local tranquilo");
        } else {
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Sobrenatural itemA = new Alienigena("Item 1");
        Sobrenatural itemB = new EspiritoYoukai("Item 2");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();

        mapa.registrar("Local A", itemA);
        mapa.registrar("Local B", itemB);

        mapa.investigar("Local A");
        mapa.investigar("Local B");
        mapa.investigar("Local C");
    }
}
