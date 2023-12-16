import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const loadingImagePath = 'assets/images/loading.gif';
    const webpImagePath = 'assets/images/example.webp';
    const webpImageUrl = 'https://www.gstatic.com/webp/gallery/4.webp';

    const webpImageWidth = 1024;
    const webpImageheight = 772;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Image.asset'),
            trailing: const Icon(Icons.image),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(
                    child: Image.asset(webpImagePath),
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('Image.network'),
            trailing: const Icon(Icons.image),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return Dialog(
                    child: Image.network(
                      webpImageUrl,
                    ),
                  );
                },
              );
            },
          ),
          ListTile(
            title: const Text('FadeInImage.assetNetwork'),
            trailing: const Icon(Icons.image),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return LayoutBuilder(builder: (_, c) {
                    final maxWidth = c.maxWidth;
                    final width = maxWidth * 0.8;
                    final height = webpImageheight * width / webpImageWidth;

                    return Dialog(
                      child: FadeInImage.assetNetwork(
                        placeholder: loadingImagePath,
                        image: webpImageUrl,
                        width: width,
                        height: height,
                      ),
                    );
                  });
                },
              );
            },
          ),
          ListTile(
            title: const Text('CachedNetworkImage'),
            trailing: const Icon(Icons.image),
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return LayoutBuilder(builder: (_, c) {
                    final maxWidth = c.maxWidth;
                    final width = maxWidth * 0.8;
                    final height = webpImageheight * width / webpImageWidth;

                    return Dialog(
                      child: CachedNetworkImage(
                        imageUrl: webpImageUrl,
                        width: width,
                        height: height,
                        placeholder: (_, __) {
                          return const Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        },
                      ),
                    );
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
