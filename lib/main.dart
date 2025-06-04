import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const CoffeeExplorerApp());
}

class CoffeeExplorerApp extends StatelessWidget {
  const CoffeeExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.brown,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: Colors.brown.shade50,
      textTheme: GoogleFonts.poppinsTextTheme(),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.brown.shade100,
        foregroundColor: Colors.brown.shade900,
        centerTitle: true,
        titleTextStyle: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.brown.shade700,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
      ),
      chipTheme: ChipThemeData.fromDefaults(
        secondaryColor: Colors.brown.shade400,
        labelStyle: GoogleFonts.poppins(),
        brightness: Brightness.light,
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Coffee Explorer',
      theme: baseTheme,
      home: const LoginPage(),
    );
  }
}

// Dummy global reviews
final List<Map<String, String>> globalReviews = [
  {'name': 'Alice', 'rating': '5', 'recommend': 'Yes', 'content': 'Amazing coffee and great vibe!'},
  {'name': 'Bob', 'rating': '4', 'recommend': 'No', 'content': 'Nice place, but a bit noisy.'},
  {'name': 'Charlie', 'rating': '5', 'recommend': 'Yes', 'content': 'The best coffee I\'ve ever had!'},
  {'name': 'Diana', 'rating': '4', 'recommend': 'Yes', 'content': 'Great place, great coffee!'},
  {'name': 'Evan', 'rating': '3', 'recommend': 'No', 'content': 'Decent enough, but could use some improvement.'},
];

// Part 2: Login Page
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.brown,
                child: Icon(Icons.coffee, color: Colors.white, size: 36),
              ),
              const SizedBox(height: 24),
              Text('Coffee Explorer', style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 32),
              Card(
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => const HomePage()));
                        },
                        child: const Text('Login'),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Part 3: Home Page & Navigation Cards
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Explorer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (_) => false,
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _HomeCard(title: 'Search Shops', icon: Icons.search, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SearchPage()));
            }),
            _HomeCard(title: 'Submit Review', icon: Icons.rate_review, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const SubmitReviewPage()));
            }),
            _HomeCard(title: 'Recent Reviews', icon: Icons.comment, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const ReviewsPage()));
            }),
            _HomeCard(title: 'Brewing Tips', icon: Icons.local_cafe, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const TipsPage()));
            }),
          ],
        ),
      ),
    );
  }
}

class _HomeCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const _HomeCard({required this.title, required this.icon, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.brown.shade700),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}

// Part 4: Search, Detail, Review, Tips Pages
// (For brevity, I will include these in the next message.)
// Part 4 (continued): Search Page
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Map<String, dynamic>> allShops = [
    {
      'name': 'Brew Haven',
      'tags': ['wifi', 'outdoors'],
      'desc': 'Chic and comfy',
      'hours': '8am - 8pm',
      'menu': ['Cappuccino', 'Cold Brew', 'Pastries']
    },
    {
      'name': 'Latte Land',
      'tags': ['quiet'],
      'desc': 'Perfect for remote work',
      'hours': '7am - 6pm',
      'menu': ['Latte', 'Espresso', 'Avocado Toast']
    },
    {
      'name': 'Espresso Express',
      'tags': ['wifi'],
      'desc': 'Fast service and good coffee',
      'hours': '6am - 4pm',
      'menu': ['Espresso', 'Americano', 'Bagels']
    },
    {
      'name': 'Café Zen',
      'tags': ['outdoors', 'quiet'],
      'desc': 'Tranquil atmosphere',
      'hours': '9am - 9pm',
      'menu': ['Herbal Tea', 'Pour Over', 'Croissants']
    },
    {
      'name': 'Coffee Haven',
      'tags': ['wifi', 'outdoors'],
      'desc': 'Cozy spot with great coffee and plant-based options',
      'hours': '8am - 7pm',
      'menu': ['Cold Latte', 'Golden Latte', 'Vegan Treats']
    },
    {
      'name': 'Bean & Brew',
      'tags': ['quiet'],
      'desc': 'Relax with a book and a cup of coffee',
      'hours': '7am - 8pm',
      'menu': ['Ethiopian Coffee Ceremony', 'Dark Roast', 'Light Roast']
    },
    {
      'name': 'Java Junction',
      'tags': ['outdoors', 'dairy-free'],
      'desc': 'Specializes in unique coffee blends and non-dairy options',
      'hours': '7:30am - 6:30pm',
      'menu': ['Nitro Cold Brew', 'Matcha Latte', 'Almond Milk Cappuccino']
    },
  ];

  final Set<String> selectedTags = {};
  String query = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    final allTags = {
      for (final shop in allShops) ...shop['tags'] as List<String>
    }.toList()
      ..sort();

    final filtered = allShops.where((shop) {
      final matchesText = shop['name'].toLowerCase().contains(query.toLowerCase()) ||
          shop['desc'].toLowerCase().contains(query.toLowerCase());
      final matchesTags = selectedTags.isEmpty ||
          selectedTags.every((tag) => shop['tags'].contains(tag));
      return matchesText && matchesTags;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Coffee Shops')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) => setState(() => query = value),
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: allTags.map((tag) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      label: Text(tag),
                      selected: selectedTags.contains(tag),
                      onSelected: (sel) {
                        setState(() {
                          sel ? selectedTags.add(tag) : selectedTags.remove(tag);
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const Icon(Icons.local_cafe, size: 32, color: Colors.brown),
                    title: Text(filtered[i]['name'], style: theme.titleMedium),
                    subtitle: Text(filtered[i]['desc']),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CoffeeShopDetailPage(shop: filtered[i]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Coffee Shop Detail Page
class CoffeeShopDetailPage extends StatelessWidget {
  final Map<String, dynamic> shop;

  const CoffeeShopDetailPage({super.key, required this.shop});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(shop['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop['desc'], style: theme.titleMedium),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: (shop['tags'] as List<String>)
                      .map((tag) => Chip(label: Text(tag)))
                      .toList(),
                ),
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.access_time, color: Colors.brown),
                  title: const Text('Hours'),
                  subtitle: Text(shop['hours']),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.menu_book, color: Colors.brown),
                  title: const Text('Popular Menu'),
                  subtitle: Text((shop['menu'] as List<String>).join(', ')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Submit Review Page
class SubmitReviewPage extends StatefulWidget {
  const SubmitReviewPage({super.key});

  @override
  State<SubmitReviewPage> createState() => _SubmitReviewPageState();
}

class _SubmitReviewPageState extends State<SubmitReviewPage> {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String rating = '5';
  bool recommend = false;
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Submit Review')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: ListView(children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Your Name'),
                  onSaved: (v) => name = v ?? '',
                  validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: rating,
                  decoration: const InputDecoration(labelText: 'Rating'),
                  items: ['5', '4', '3', '2', '1']
                      .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                      .toList(),
                  onChanged: (v) => setState(() => rating = v ?? '5'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Your Review'),
                  maxLines: 3,
                  onSaved: (v) => content = v ?? '',
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  title: const Text('Would Recommend'),
                  value: recommend,
                  onChanged: (v) => setState(() => recommend = v ?? false),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        globalReviews.insert(0, {
                          'name': name,
                          'rating': rating,
                          'recommend': recommend ? 'Yes' : 'No',
                          'content': content
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const ReviewsPage()),
                        );
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

// Reviews Page
class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  Future<bool> _showDeleteConfirmation(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Review'),
        content: const Text('Are you sure you want to delete this review?'),
        actions: [
          FilledButton.tonal(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
      ),
    );

    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Recent Reviews')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: globalReviews.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final r = globalReviews[i];
          return Dismissible(
            key: Key('review_$i'),
            background: Container(
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    flex: 2,
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  Text('Delete', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)),
                ],
              ),
            ),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              return await _showDeleteConfirmation(context);
            },
            onDismissed: (direction) {
              globalReviews.removeAt(i);
            },
            child: Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text('${r['name']} (${r['rating']}⭐)', style: theme.titleSmall),
                subtitle: Text('${r['content']}\nRecommend: ${r['recommend']}'),
                isThreeLine: true,
              ),
            ),
          );
        },
      ),
    );
  }
}


// Tips Page
class TipsPage extends StatelessWidget {
  const TipsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tips = [
      'Use fresh beans for better flavor.',
      'Grind size matters — match it to your method.',
      'Use filtered water at 195–205°F.',
      'Don’t skimp on cleaning your gear.',
    ];

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Brewing Tips')),
      body: PageView.builder(
        itemCount: tips.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.brown.shade100,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tips[i],
                      style: theme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.brown.shade900,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Icon(Icons.local_cafe, size: 48, color: Colors.brown.shade700),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


