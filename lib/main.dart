import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: QuoteList(),
      ),
    );

class Quote {
  final String text;
  final String author;

  Quote({required this.text, required this.author});
}

class QuoteList extends StatelessWidget {
   QuoteList({super.key});

  final List<Quote> quotes = [
    Quote(text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
    Quote(text: "You only live once, but if you do it right, once is enough.", author: "Mae West"),
    Quote(text: "Be the change that you wish to see in the world.", author: "Mahatma Gandhi"),
  ];

  void deleteQuote(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Quote deleted'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: quotes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: ListTile(
              contentPadding: const EdgeInsets.all(20),
              title: Text(
                quotes[index].text,
                style: const TextStyle(fontSize: 18),
              ),
              subtitle: Text(
                '- ${quotes[index].author}',
                style: const TextStyle(fontSize: 14),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  deleteQuote(context, index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
