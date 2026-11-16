
import 'package:flutter/material.dart';

void main() {
  runApp(const KalaghApp());
}

const Color teal = Color(0xFF13A89E);
const Color navy = Color(0xFF142331);

class KalaghApp extends StatelessWidget {
  const KalaghApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'کلاغ',
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F8F8),
        colorScheme: ColorScheme.fromSeed(seedColor: teal),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTab = 0;

  final List<Map<String, dynamic>> chats = [
    {'name': 'علی', 'message': 'سلام، خوبی؟', 'time': '۱۲:۳۰', 'color': 0xFF13A89E},
    {'name': 'گروه دوستان', 'message': 'امشب برنامه چیه؟', 'time': '۱۱:۴۵', 'color': 0xFF5476A8},
    {'name': 'محمد', 'message': 'عکس‌ها رو فرستادم', 'time': '۱۰:۲۰', 'color': 0xFFB98255},
    {'name': 'سارا', 'message': 'ممنون ازت 🌹', 'time': 'دیروز', 'color': 0xFF9975B8},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: navy,
          foregroundColor: Colors.white,
          title: const Row(
            children: [
              Icon(Icons.chat_bubble, color: teal),
              SizedBox(width: 10),
              Text('کلاغ', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: selectedTab == 0
            ? chatList()
            : Center(
                child: Text(
                  ['چت‌ها', 'مخاطبین', 'تماس‌ها', 'تنظیمات'][selectedTab],
                  style: const TextStyle(fontSize: 22),
                ),
              ),
        floatingActionButton: selectedTab == 0
            ? FloatingActionButton(
                backgroundColor: teal,
                foregroundColor: Colors.white,
                onPressed: () {},
                child: const Icon(Icons.edit),
              )
            : null,
        bottomNavigationBar: NavigationBar(
          selectedIndex: selectedTab,
          onDestinationSelected: (index) {
            setState(() => selectedTab = index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.chat_bubble_outline),
              selectedIcon: Icon(Icons.chat_bubble),
              label: 'چت‌ها',
            ),
            NavigationDestination(
              icon: Icon(Icons.people_outline),
              label: 'مخاطبین',
            ),
            NavigationDestination(
              icon: Icon(Icons.call_outlined),
              label: 'تماس‌ها',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'تنظیمات',
            ),
          ],
        ),
      ),
    );
  }

  Widget chatList() {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          color: Colors.white,
          child: const Text(
            'پیام‌های شما',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
        ),
        for (final chat in chats)
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 7,
            ),
            leading: CircleAvatar(
              radius: 27,
              backgroundColor: Color(chat['color']),
              child: Text(
                chat['name'].toString().substring(0, 1),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(chat['message']),
            trailing: Text(
              chat['time'],
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
            onTap: () {},
          ),
        const Divider(),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              'به کلاغ خوش آمدید',
              style: TextStyle(color: teal),
            ),
          ),
        ),
      ],
    );
  }
}
