import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Elements/CustomTextWidget.dart';

import '../Elements/CustomContainerWidget.dart';
import '../Provider/QuoteProvider.dart';
import '../Widgets/AppBarWidget.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  void initState() {
    super.initState();
    // ✅ Fetch quotes automatically when screen loads
    Future.microtask(() =>
        Provider.of<QuotesProvider>(context, listen: false).fetchAllQuotes());
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuotesProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: MyContainer(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0f0c29), Color(0xFF302b63), Color(0xFF24243e)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              AppBarWidget(
                title: "Quotes",
                searchIcon: false,
                profileIcon: true,
              ),
              const SizedBox(height: 10),
              MyText(
                text: "Daily Quotes",
                size: 30,
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.quotes.length,
                  itemBuilder: (context, index) {
                    final q = provider.quotes[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: MyContainer(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(width: 0, color: Colors.blue),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: MyText(
                                  text: "\" ${q.quote} \"",
                                  size: 16,
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: MyText(
                                  text: q.author,
                                  size: 15,
                                  color: Colors.deepPurple,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
