import 'package:flutter/material.dart';

void main() {
  runApp(const ImperioGestaoApp());
}

class ImperioGestaoApp extends StatelessWidget {
  const ImperioGestaoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMPÉRIO GESTÃO',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const HomePage(),
    );
  }
}

// ======================================================
// DADOS
// ======================================================

class Cliente {
  String nome;
  String telefone;
  double divida;
  int comprasPendentes;

  Cliente({
    required this.nome,
    required this.telefone,
    this.divida = 0,
    this.comprasPendentes = 0,
  });
}

class Produto {
  String nome;
  double preco;
  int estoque;

  Produto({
    required this.nome,
    required this.preco,
    required this.estoque,
  });
}

class Vendedor {
  String nome;
  String login;
  String senha;
  bool ativo;

  Vendedor({
    required this.nome,
    required this.login,
    required this.senha,
    this.ativo = true,
  });
}

// Dados temporários.
// Depois vamos ligar ao banco de dados na nuvem.

final List<Cliente> clientes = [
  Cliente(
    nome: 'Cliente Exemplo',
    telefone: '(98) 99999-9999',
    divida: 150,
    comprasPendentes: 1,
  ),
];

final List<Produto> produtos = [
  Produto(
    nome: 'Sabão Líquido Lava Roupas',
    preco: 25,
    estoque: 800,
  ),
  Produto(
    nome: 'Detergente',
    preco: 5,
    estoque: 300,
  ),
];

final List<Vendedor> vendedores = [
  Vendedor(
    nome: 'Administrador',
    login: 'admin',
    senha: '1234',
  ),
];

// ======================================================
// HOME
// ======================================================

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pagina = 0;

  final List<Widget> paginas = const [
    DashboardPage(),
    ClientesPage(),
    EstoquePage(),
    VendasPage(),
    AtrasadosPage(),
    VendedoresPage(),
  ];

  final List<String> titulos = [
    'IMPÉRIO GESTÃO',
    'Clientes',
    'Estoque',
    'Vendas',
    'Clientes em atraso',
    'Vendedores',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titulos[pagina],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(
                    Icons.business,
                    color: Colors.white,
                    size: 45,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'IMPÉRIO GESTÃO',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Vendas • Estoque • Clientes',
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            _menuItem(
              icon: Icons.dashboard,
              texto: 'Início',
              index: 0,
            ),

            _menuItem(
              icon: Icons.people,
              texto: 'Clientes',
              index: 1,
            ),

            _menuItem(
              icon: Icons.inventory_2,
              texto: 'Estoque
