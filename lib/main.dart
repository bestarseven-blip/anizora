
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(AnizoraApp());

class AnizoraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anizora',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: LoginScreen(),
    );
  }
}

// =================== LOGIN SCREEN ===================
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  String error = '';

  void login() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() => error = 'يرجى ملء جميع الحقول');
      return;
    }
    if (passwordController.text.length < 6) {
      setState(() => error = 'كلمة المرور يجب أن تكون 6 أحرف على الأقل');
      return;
    }
    setState(() => loading = true);
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ANIZORA', style: TextStyle(color: Colors.red, fontSize: 48, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, letterSpacing: 4)),
              SizedBox(height: 8),
              Text('عالم الأنمي في مكان واحد', style: TextStyle(color: Colors.grey, fontSize: 14)),
              SizedBox(height: 48),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 8),
              if (error.isNotEmpty)
                Text(error, style: TextStyle(color: Colors.red, fontSize: 13)),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loading ? null : login,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: loading ? CircularProgressIndicator(color: Colors.white) : Text('تسجيل الدخول', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen())),
                child: Text('ليس لديك حساب؟ سجل الآن', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =================== REGISTER SCREEN ===================
class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool loading = false;
  String error = '';

  void register() {
    if (nameController.text.isEmpty || emailController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() => error = 'يرجى ملء جميع الحقول');
      return;
    }
    setState(() => loading = true);
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ANIZORA', style: TextStyle(color: Colors.red, fontSize: 48, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic, letterSpacing: 4)),
              SizedBox(height: 8),
              Text('إنشاء حساب جديد', style: TextStyle(color: Colors.grey, fontSize: 14)),
              SizedBox(height: 48),
              TextField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'الاسم',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.person, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.email, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'كلمة المرور',
                  labelStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(Icons.lock, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 8),
              if (error.isNotEmpty)
                Text(error, style: TextStyle(color: Colors.red, fontSize: 13)),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: loading ? null : register,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                  child: loading ? CircularProgressIndicator(color: Colors.white) : Text('إنشاء حساب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('لديك حساب؟ سجل دخولك', style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// =================== MAIN SCREEN ===================
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final screens = [HomeScreen(), SearchScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => currentIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'بحث'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'مفضلة'),
        ],
      ),
    );
  }
}

// =================== HOME SCREEN ===================
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List topAnime = [];
  List seasonAnime = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final r1 = await http.get(Uri.parse('https://api.jikan.moe/v4/top/anime?limit=20'));
      await Future.delayed(Duration(seconds: 1));
      final r2 = await http.get(Uri.parse('https://api.jikan.moe/v4/seasons/now?limit=20'));
      if (r1.statusCode == 200 && r2.statusCode == 200) {
        setState(() {
          topAnime = json.decode(r1.body)['data'];
          seasonAnime = json.decode(r2.body)['data'];
          loading = false;
        });
      }
    } catch (e) {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('ANIZORA', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 26, fontStyle: FontStyle.italic, letterSpacing: 3)),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.grey),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen())),
          ),
        ],
      ),
      body: loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : ListView(children: [
              if (topAnime.isNotEmpty) _buildSection('🔥 الأكثر تقييماً', topAnime),
              if (seasonAnime.isNotEmpty) _buildSection('🌸 موسم هذا العام', seasonAnime),
            ]),
    );
  }

  Widget _buildSection(String title, List list) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
          child: Text(title, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 12),
            itemCount: list.length,
            itemBuilder: (context, index) => AnimeCard(anime: list[index]),
          ),
        ),
      ],
    );
  }
}

// =================== SEARCH SCREEN ===================
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List results = [];
  bool loading = false;

  Future<void> search(String q) async {
    if (q.isEmpty) return;
    setState(() => loading = true);
    final r = await http.get(Uri.parse('https://api.jikan.moe/v4/anime?q=$q&limit=20'));
    if (r.statusCode == 200) {
      setState(() {
        results = json.decode(r.body)['data'];
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'ابحث عن أنمي...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
          ),
          onChanged: (val) { if (val.length > 2) search(val); },
        ),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator(color: Colors.red))
          : results.isEmpty
              ? Center(child: Text('ابحث عن أنمي مفضل لك', style: TextStyle(color: Colors.grey, fontSize: 16)))
              : GridView.builder(
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.6, crossAxisSpacing: 8, mainAxisSpacing: 8),
                  itemCount: results.length,
                  itemBuilder: (context, index) => AnimeCard(anime: results[index]),
                ),
    );
  }
}

// =================== FAVORITE SCREEN ===================
class FavoriteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: Text('المفضلة', style: TextStyle(color: Colors.white))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, color: Colors.grey, size: 80),
            SizedBox(height: 16),
            Text('لا يوجد أنمي في المفضلة بعد', style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// =================== ANIME CARD ===================
class AnimeCard extends StatelessWidget {
  final Map anime;
  const AnimeCard({required this.anime});

  @override
  Widget build(BuildContext context) {
    final image = anime['images']?['jpg']?['image_url'] ?? '';
    final name = anime['title'] ?? '';
    final score = anime['score']?.toString() ?? 'N/A';

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(anime: anime))),
      child: Container(
        width: 130,
        margin: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: image.isNotEmpty
                  ? Image.network(image, height: 170, width: 130, fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(height: 170, color: Colors.grey[900], child: Icon(Icons.image, color: Colors.grey)))
                  : Container(height: 170, color: Colors.grey[900]),
            ),
            SizedBox(height: 5),
            Text(name, style: TextStyle(color: Colors.white, fontSize: 11), maxLines: 1, overflow: TextOverflow.ellipsis),
            Text('⭐ $score', style: TextStyle(color: Colors.amber, fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

// =================== DETAIL SCREEN ===================
class DetailScreen extends StatelessWidget {
  final Map anime;
  const DetailScreen({required this.anime});

  @override
  Widget build(BuildContext context) {
    final image = anime['images']?['jpg']?['large_image_url'] ?? '';
    final name = anime['title'] ?? '';
    final score = anime['score']?.toString() ?? 'N/A';
    final episodes = anime['episodes']?.toString() ?? 'غير معروف';
    final synopsis = anime['synopsis'] ?? 'لا يوجد وصف';
    final genres = (anime['genres'] as List?)?.map((g) => g['name']).join(' • ') ?? '';
    final status = anime['status'] ?? '';

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 350,
            backgroundColor: Colors.black,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: image.isNotEmpty ? Image.network(image, fit: BoxFit.cover) : Container(color: Colors.grey[900]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Row(children: [
                    Icon(Icons.star, color: Colors.amber, size: 18),
                    Text(' $score', style: TextStyle(color: Colors.amber, fontSize: 16)),
                    SizedBox(width: 20),
                    Icon(Icons.movie, color: Colors.grey, size: 18),
                    Text(' $episodes حلقة', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                      child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ]),
                  SizedBox(height: 10),
                  if (genres.isNotEmpty) Text(genres, style: TextStyle(color: Colors.red, fontSize: 13)),
                  SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow, color: Colors.black),
                    label: Text('مشاهدة الآن', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.white, minimumSize: Size(double.infinity, 48)),
                  ),
                  SizedBox(height: 8),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border, color: Colors.white),
                    label: Text('إضافة للمفضلة', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.white), minimumSize: Size(double.infinity, 48)),
                  ),
                  SizedBox(height: 16),
                  Text('القصة', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(synopsis, style: TextStyle(color: Colors.grey[300], fontSize: 14, height: 1.6)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}