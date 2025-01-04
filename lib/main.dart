import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/pokemon.dart';
import 'providers/pokemon_provider.dart';
import 'providers/phone_provider.dart';
import 'splash.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PokemonProvider()),
        ChangeNotifierProvider(create: (_) => PhoneProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokéDex',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showPokemon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amber[700],
        title: Text(
          showPokemon ? 'Pokédex' : 'Validador de Teléfono',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Switch(
            activeColor: Colors.white,
            value: showPokemon,
            onChanged: (value) {
              setState(() {
                showPokemon = value;
              });
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amber[100]!,
              Colors.white,
            ],
          ),
        ),
        child: showPokemon ? PokemonListScreen() : PhoneValidatorScreen(),
      ),
    );
  }
}

class PhoneValidatorScreen extends StatelessWidget {
  PhoneValidatorScreen({super.key});

  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Validator'),
        leading: IconButton(
          icon: const Icon(Icons.catching_pokemon),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Ingresa un número telefónico',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    if (phone.isNotEmpty) {
                      Provider.of<PhoneProvider>(context, listen: false)
                          .validatePhone(phone);
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<PhoneProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.validation == null) {
                    return const Center(
                      child: Text('Ingresa un número telefónico'),
                    );
                  }

                  final validation = provider.validation!;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Número: ${validation.number}'),
                          Text('Válido: ${validation.valid ? "Sí" : "No"}'),
                          Text('País: ${validation.countryName}'),
                          Text('Ubicación: ${validation.location}'),
                          Text('Operador: ${validation.carrier}'),
                          Text('Tipo de línea: ${validation.lineType}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PokemonListScreen extends StatelessWidget {
  PokemonListScreen({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokémon Búsqueda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.phone),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PhoneValidatorScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Ingresa el nombre del Pokémon',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    final name = _searchController.text.toLowerCase().trim();
                    if (name.isNotEmpty) {
                      Provider.of<PokemonProvider>(context, listen: false)
                          .fetchPokemon(name);
                    }
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<PokemonProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (provider.pokemon == null) {
                  return const Center(child: Text('Busca un Pokémon'));
                }

                Pokemon pokemon = provider.pokemon!;
                return SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        pokemon.sprites.frontDefault,
                        height: 400,
                        width: 400,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        pokemon.name.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Altura: ${pokemon.height / 10} m'),
                      Text('Peso: ${pokemon.weight / 10} kg'),
                      const SizedBox(height: 8),
                      Text('Tipos: ${pokemon.types.join(", ")}'),
                      const SizedBox(height: 8),
                      Text('Habilidades: ${pokemon.abilities.join(", ")}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



