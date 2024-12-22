import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ui/homepage.dart';
import 'package:ui/profile_page.dart';

class ArticlesPage extends StatefulWidget {
  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  int _currentIndex = 1;
  List<Article> articles = [];

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  // Fungsi untuk mengambil data artikel dari Firestore (hanya metadata)
  Future<void> fetchArticles() async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('articles').get();

      final List<Article> fetchedArticles = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Article(
          id: doc.id,
          title: data['title'],
          description: data['description'],
          imagePath: data['imagePath'],
        );
      }).toList();

      setState(() {
        articles = fetchedArticles;
      });
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching articles: $e')),
      );
    }
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProgramHomepage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Artikel Yoga Wajah',
              style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 190, 231),
      body: articles.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return ArticleItem(
                  title: article.title,
                  description: article.description,
                  imagePath: article.imagePath,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetailPage(articleId: article.id),
                      ),
                    );
                  },
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.purple[100],
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: 'Articles',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ArticleItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final VoidCallback onTap;

  ArticleItem({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color:Color.fromARGB(255, 143, 78, 155)
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailPage extends StatefulWidget {
  final String articleId;

  ArticleDetailPage({required this.articleId});

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  Article? article;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchArticleDetail();
  }

  // Fungsi untuk mengambil detail artikel dari Firestore
  Future<void> fetchArticleDetail() async {
    try {
      final DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('articles')
          .doc(widget.articleId)
          .get();

      if (doc.exists) {
        setState(() {
          article = Article.fromJson(doc.data() as Map<String, dynamic>);
          isLoading = false;
        });
      } else {
        throw Exception("Article not found");
      }
    } catch (e) {
      print("Error fetching article detail: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading article details: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(article?.title ?? "Loading...",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 143, 78, 155),
      ),
      backgroundColor: const Color.fromARGB(255, 225, 190, 231),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article!.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 20),
                    Text(
                      article!.content,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class Article {
  final String id;
  final String title;
  final String description;
  final String imagePath;
  final String content;

  Article({
    required this.id,
    required this.title,
    required this.description,
    required this.imagePath,
    this.content = "",
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] ?? "",
      title: json['title'],
      description: json['description'],
      imagePath: json['imagePath'],
      content: json['content'] ?? "",
    );
  }
}
