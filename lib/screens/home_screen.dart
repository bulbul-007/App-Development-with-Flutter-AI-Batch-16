import 'package:flutter/material.dart';
import 'details_screen.dart';

/// HomeScreen displays the Counter tab using DefaultTabController.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Counter state starting at 0
  int _counter = 0;

  // Called when the screen is first created
  @override
  void initState() {
    super.initState();
  }

  // Called before the widget is removed from memory
  @override
  void dispose() {
    super.dispose();
  }

  // Increments counter value and calls setState to rebuild UI
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  // Navigates to DetailsScreen, passing the current counter value
  void _openDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(counterValue: _counter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: 'Counter'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Counter Tab
            _buildCounterTab(context),
          ],
        ),
      ),
    );
  }

  /// Builds the counter interaction tab view matching the screenshot style
  Widget _buildCounterTab(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Counter value',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$_counter',
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1D1B20), // Soft dark text
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _incrementCounter,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Increment',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () => _openDetails(context),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: BorderSide(color: Colors.grey.shade300),
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  'Open Details',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
