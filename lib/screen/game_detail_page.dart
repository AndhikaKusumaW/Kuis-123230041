import 'package:flutter/material.dart';
import 'package:kuis_123230041/models/game_data.dart';

class GameDetailPage extends StatelessWidget {
  final GameStore game;

  const GameDetailPage({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Detail Page"),
        ),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// Poster Game
              Image.network(
                game.imageUrls[0],
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Title
                    Text(
                      game.name,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Release Date
                    Text(
                      "Release: ${game.releaseDate}",
                      style: const TextStyle(
                        color: Colors.grey
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// Price
                    Text(
                      "Price: ${game.price}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 12),

                    /// Tags
                    Text(
                      "Tags: ${game.tags.join(", ")}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// Description
                    Text(
                      game.about,
                      textAlign: TextAlign.justify,
                    ),

                    const SizedBox(height: 20),

                    /// Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.orange
                        ),

                        const SizedBox(width: 5),

                        Text(
                          "${game.reviewAverage} (${game.reviewCount} reviews)",
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// Button Store
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil download game"),
                              backgroundColor: Colors.purpleAccent,
                            ),
                          );
                        },
                        child: const Text("Beli aja deh"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}