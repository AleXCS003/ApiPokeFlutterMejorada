class Pokemon {
  final String name;
  final int height;
  final int weight;
  final List<String> types;
  final List<String> abilities;
  final PokemonSprites sprites;

  Pokemon({
    required this.name,
    required this.height,
    required this.weight,
    required this.types,
    required this.abilities,
    required this.sprites,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'] ?? '',
      height: json['height'] ?? 0,
      weight: json['weight'] ?? 0,
      types: (json['types'] as List<dynamic>?)
          ?.map((type) => type['type']['name'].toString())
          .toList() ?? [],
      abilities: (json['abilities'] as List<dynamic>?)
          ?.map((ability) => ability['ability']['name'].toString())
          .toList() ?? [],
      sprites: PokemonSprites(
        frontDefault: json['sprites']['front_default'] ?? '',
      ),
    );
  }
}

class PokemonSprites {
  final String frontDefault;

  PokemonSprites({required this.frontDefault});
} 