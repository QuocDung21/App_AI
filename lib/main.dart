import 'package:flutter/material.dart';
import 'controllers/home_controller.dart';
import 'models/BenhModel.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _controller = HomeController();
  int _selectedIndex = 0;
  final List<Benh> _benhList = [];
  Benh? _selectedBenh;
  String? _selectedDropdownValue;

  @override
  void initState() {
    super.initState();
    _selectedDropdownValue = 'Blast';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        actions: [
          DropdownButton<String>(
            value: _selectedDropdownValue,
            onChanged: (String? newValue) {
              setState(() {
                _selectedDropdownValue = newValue;
                // Add any additional logic you want to perform on selection
                print('Selected value: $_selectedDropdownValue');
              });
            },
            items: <String>['Blast', 'Bacterialblight', 'Brownspot', 'Tungro']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: FutureBuilder<List<Benh>>(
        future: _controller.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final benh = snapshot.data![index];
                return Card(
                  child: ListTile(
                    title: Text(benh.tenBenh),
                    subtitle: Text(benh.trieuChung),
                    onTap: () {},
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _controller.fetchData();
        }),
        backgroundColor: Colors.amberAccent,
        child: const Icon(Icons.refresh),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _controller.onItemTapped(index, context);
        },
        indicatorColor: Colors.amber,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_sharp),
            label: 'Notifications',
          ),
          NavigationDestination(
            icon: Icon(Icons.messenger_sharp),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}
// Ba Tung was here
