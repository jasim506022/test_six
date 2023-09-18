import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

List<String> list = [
  "https://img.freepik.com/free-photo/full-shot-people-beach_23-2150385842.jpg?size=626&ext=jpg&ga=GA1.2.888669220.1685186762",
  "https://img.freepik.com/free-photo/full-shot-astronaut-nature-collage_23-2150385898.jpg?size=626&ext=jpg&ga=GA1.2.888669220.1685186762",
  "https://img.freepik.com/premium-photo/full-shot-astronaut-nature-collage_23-2150385888.jpg?size=626&ext=jpg&ga=GA1.2.888669220.1685186762",
  "https://img.freepik.com/free-photo/full-shot-astronaut-nature-collage_23-2150385904.jpg?size=626&ext=jpg&ga=GA1.2.888669220.1685186762",
  "https://img.freepik.com/free-photo/medium-shot-man-with-camel-desert_23-2150385856.jpg?size=626&ext=jpg&ga=GA1.2.888669220.1685186762",
  "https://img.freepik.com/free-photo/collage-with-vehicle-floating-rocks_23-2150385866.jpg?size=626&ext=jpg&ga=GA1.1.888669220.1685186762"
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Photo Gallery",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Welcome to our Photo Gallery!",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter your text here...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Image $index clicked"),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        list[index],
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Photo $index"),
                      ),
                    ],
                  ),
                );
              },
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(list[0]),
              ),
              title: Text("Sample Photo 1"),
              subtitle: Text("This is a sample photo with a subtitle."),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(list[1]),
              ),
              title: Text("Sample Photo 2"),
              subtitle: Text("Another sample photo with a subtitle."),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(list[2]),
              ),
              title: Text("Sample Photo 3"),
              subtitle: Text("Yet another sample photo with a subtitle."),
            ),
            Center(
              child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Photos Uploaded Successfully!"),
                      ),
                    );
                  },
                  child: CircleAvatar(child: Icon(Icons.upload))),
            ),
          ],
        ),
      ),
    );
  }
}
