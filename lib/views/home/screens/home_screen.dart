import 'package:flutter/material.dart';
import 'package:quote_generator/model/quote_model.dart';
import 'package:quote_generator/services/quote_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Quote> _quoteList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQuote();
  }

  void _getQuote() async {
    _quoteList = (await QuoteServices().getQuote())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar
      appBar: AppBar(
        title: const Text('Quote Generator'),
      ),
      body: _quoteList == null || _quoteList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _quoteList.length,
              itemBuilder: (context, index) {
                final quote = _quoteList[index];
                return ListTile(
                  title: Text(quote.text),
                  subtitle: Text(
                    quote.author ?? 'Hasina',
                  ),
                );
              },
            ),
    );
  }
}
