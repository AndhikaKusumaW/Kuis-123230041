import 'package:flutter/material.dart';
import '../models/game_data.dart';
import 'game_detail_page.dart';
import 'profile_page.dart';
import 'login_page.dart';

class GameListPage extends StatefulWidget {
  final String username;

  const GameListPage({super.key, required this.username});

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  List<bool> savedGames = List.generate(gameList.length, (index) => false);
  final List<GameStore> games = gameList;

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Game List",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

          actions: [
          IconButton(
            icon: const Icon(Icons.person_outlined),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => ProfilePage(username: widget.username),
                ),
              );
            },
          ),

          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                ),
              );
            },
          ),
        ],

          ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, ${widget.username}!",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Expanded(
                child: ListView.builder(
                  itemCount: games.length,

                  itemBuilder: (context, index) {

                    final game = games[index];

                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      
                      child: ListTile(

                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            game.imageUrls[0],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),

                        title: Text(
                          game.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),

                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text("Release: ${game.releaseDate}"),

                            Text("Price: ${game.price}"),

                            const SizedBox(height: 4),

                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.orange, size: 16),
                                const SizedBox(width: 4),

                                Text(game.reviewAverage),
                              ],
                            ),
                          ],
                        ),

                        trailing: IconButton(
                          icon: Icon(
                            savedGames[index]
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          ),

                          onPressed: () {
                            setState(() {
                              savedGames[index] = !savedGames[index];
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Berhasil menyimpan game"),
                                ),
                              );
                            });
                          },
                        ),

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                GameDetailPage(game: game),
                            ),
                          );
                        },
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