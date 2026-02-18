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
      colorScheme: const ColorScheme.light(
        primary: Color(0xFFFF6B00), // SmartBear orange
        secondary: Color(0xFF0066B3), // SmartBear blue
        surface: Color(0xFFF6F6F6), // light grey
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: Color(0xFF222222),
      ),
      scaffoldBackgroundColor: Colors.brown.shade50,
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme,),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE1E1E1), width: 2),
        ),
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFF222222),
        centerTitle: true,
        elevation: 4,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color(0xFF222222),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B00),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
        color: Colors.white,
        elevation: 6,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Logo Section
              Container(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Icon(Icons.coffee, color: Colors.white, size: 40),
                    ),
                    const SizedBox(height: 16),
                    Text('Coffee Explorer', style: theme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.onSurface)),
                  ],
                ),
              ),

              // Login Form
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Welcome back!', style: theme.titleLarge?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface)),
                      const SizedBox(height: 24),
                      // Email Field
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          prefixIcon: const Icon(Icons.email),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          prefixIcon: const Icon(Icons.lock),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Forgot Password
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.secondary),
                          child: const Text('Forgot Password?'),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (_) => const HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          textStyle: const TextStyle(fontSize: 18),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),

              // Sign-Up Section (Optional)
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?", style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
                    TextButton(
                      onPressed: () {
                        // Navigate to sign-up page
                      },
                      style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.secondary),
                      child: const Text('Sign up'),
                    ),
                  ],
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Coffee Explorer'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
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
            _HomeCard(title: 'Gesture Demo', icon: Icons.touch_app, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => const GestureDemoPage()));
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
      elevation: 4,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 12),
              Text(title, textAlign: TextAlign.center, style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.onSurface)),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Search Coffee Shops'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                      backgroundColor: Colors.grey.shade200,
                      selectedColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                      checkmarkColor: Theme.of(context).colorScheme.onSecondary,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
                  elevation: 2,
                  shadowColor: Colors.grey.withOpacity(0.2),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Icon(Icons.local_cafe, size: 32, color: Theme.of(context).colorScheme.primary),
                    title: Text(filtered[i]['name'], style: theme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                    subtitle: Text(filtered[i]['desc']),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(shop['name']),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shop['desc'], style: theme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  children: (shop['tags'] as List<String>)
                      .map((tag) => Chip(
                    label: Text(tag),
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.access_time, color: Theme.of(context).colorScheme.primary),
                  title: Text('Hours',  style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                  subtitle: Text(shop['hours'],  style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                ),
                const Divider(),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.menu_book, color: Theme.of(context).colorScheme.primary),
                  title: Text('Popular Menu',  style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
                  subtitle: Text((shop['menu'] as List<String>).join(', '),  style: TextStyle(color: Theme.of(context).colorScheme.onSurface)),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Submit Review'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 2,
          shadowColor: Colors.grey.withOpacity(0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: ListView(children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Name',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  onSaved: (v) => name = v ?? '',
                  validator: (v) => v == null || v.isEmpty ? 'Enter your name' : null,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  value: rating,
                  decoration: InputDecoration(
                    labelText: 'Rating',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  items: ['5', '4', '3', '2', '1']
                      .map((r) => DropdownMenuItem(value: r, child: Text(r)))
                      .toList(),
                  onChanged: (v) => setState(() => rating = v ?? '5'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Your Review',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  ),
                  maxLines: 3,
                  onSaved: (v) => content = v ?? '',
                ),
                const SizedBox(height: 12),
                CheckboxListTile(
                  title: const Text('Would Recommend'),
                  value: recommend,
                  activeColor: Theme.of(context).colorScheme.secondary,
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  side: BorderSide(color: Colors.grey.shade400, width: 1.5),
                  onChanged: (v) => setState(() => recommend = v ?? false),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
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
          TextButton(
            style: TextButton.styleFrom(foregroundColor: Colors.grey),
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );

    return confirmed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Recent Reviews'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: globalReviews.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final r = globalReviews[i];
          return Dismissible(
            key: Key('review_$i'),
            background: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.delete, color: Colors.white),
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
              elevation: 2,
              shadowColor: Colors.grey.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: const Icon(Icons.person, color: Colors.white),
                ),
                title: Text('${r['name']} (${r['rating']}⭐)', style: theme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onSurface)),
                subtitle: Text('${r['content']}\nRecommend: ${r['recommend']}', style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8))),
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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Brewing Tips'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: PageView.builder(
        itemCount: tips.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (_, i) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
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
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Icon(Icons.local_cafe, size: 48, color: Theme.of(context).colorScheme.primary),
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

// Gesture Demo Page
class GestureDemoPage extends StatefulWidget {
  const GestureDemoPage({super.key});

  @override
  State<GestureDemoPage> createState() => _GestureDemoPageState();
}

class _GestureDemoPageState extends State<GestureDemoPage> {
  String message = 'Try the gestures below!';
  int doubleTapCount = 0;
  int longPressCount = 0;
  Color box1Color = Colors.blue.shade300;
  Color box2Color = Colors.green.shade300;

  void _handleDoubleTap() {
    setState(() {
      doubleTapCount++;
      message = 'Double Tap detected! Count: $doubleTapCount';
      box1Color = Colors.primaries[doubleTapCount % Colors.primaries.length].shade300;
    });
  }

  void _handleLongPress() {
    setState(() {
      longPressCount++;
      message = 'Long Press detected! Count: $longPressCount';
      box2Color = Colors.primaries[longPressCount % Colors.primaries.length].shade300;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Gesture Demo'),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.5),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Status Message Card
            Card(
              elevation: 4,
              shadowColor: Colors.grey.withOpacity(0.3),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Icon(Icons.touch_app, size: 48, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 12),
                    Text(
                      message,
                      style: theme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Double Tap Demo
            Text(
              'Double Tap Demo',
              style: theme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Quickly tap twice on the box below',
              style: theme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onDoubleTap: _handleDoubleTap,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 180,
                decoration: BoxDecoration(
                  color: box1Color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, size: 48, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        'Double Tap Me!',
                        style: theme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Count: $doubleTapCount',
                        style: theme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Long Press Demo
            Text(
              'Long Press Demo',
              style: theme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap and hold the box below for 1 second',
              style: theme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onLongPress: _handleLongPress,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 180,
                decoration: BoxDecoration(
                  color: box2Color,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer, size: 48, color: Colors.white),
                      const SizedBox(height: 12),
                      Text(
                        'Hold Me!',
                        style: theme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Count: $longPressCount',
                        style: theme.titleMedium?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Statistics Card
            Card(
              elevation: 2,
              shadowColor: Colors.grey.withOpacity(0.2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gesture Statistics',
                      style: theme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _StatItem(
                          icon: Icons.touch_app,
                          label: 'Double Taps',
                          count: doubleTapCount,
                          color: Colors.blue,
                        ),
                        _StatItem(
                          icon: Icons.timer,
                          label: 'Long Presses',
                          count: longPressCount,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Reset Button
            SizedBox(
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    doubleTapCount = 0;
                    longPressCount = 0;
                    message = 'Counters reset! Try again!';
                    box1Color = Colors.blue.shade300;
                    box2Color = Colors.green.shade300;
                  });
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Reset Counters'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;
  final Color color;

  const _StatItem({
    required this.icon,
    required this.label,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: theme.bodySmall?.copyWith(color: Colors.grey.shade600),
        ),
        Text(
          '$count',
          style: theme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
