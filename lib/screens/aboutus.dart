import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}
class _AboutUsState extends State<AboutUs> with SingleTickerProviderStateMixin {
  int _currentImageIndex = 0;
  late PageController _pageController;
  late AnimationController _textAnimationController;
  late Animation<double> _fadeAnimation;
  final List<String> _images = [
    'assets/a33.jpg',
    'assets/a44.jpg',
    'assets/a3.jpg',
    'assets/a22.jpg',
    'assets/a11.jpg',
    'assets/a55.jpg',
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentImageIndex,
      viewportFraction: 0.85,
    );
    _images.shuffle(); // Shuffle the images
    // Animation setup
    _textAnimationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_textAnimationController);

    _textAnimationController.forward();
  }
  @override
  void dispose() {
    _pageController.dispose();
    _textAnimationController.dispose();
    super.dispose();
  }
  void _previousImage() {
    if (_currentImageIndex > 0) {
      _currentImageIndex--;
      _pageController.animateToPage(
        _currentImageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  void _nextImage() {
    if (_currentImageIndex < _images.length - 1) {
      _currentImageIndex++;
      _pageController.animateToPage(
        _currentImageIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // Subtle gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.brown.shade100, Colors.brown.shade50],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Black back button only
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20),
                      // Tagline and description with fade-in effect
                      FadeTransition(
                        opacity: _fadeAnimation,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '"Your Escape Awaits"',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.brown.shade700,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Welcome to our haven of elegance and tranquility. At our hotel, every stay is crafted to offer an unforgettable experience of luxury, comfort, and personalized service.',
                                style: GoogleFonts.lora(
                                  fontSize: 18,
                                  color: Colors.brown.shade700,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      // Image slider with enhanced animation
                      Stack(
                        children: [
                          Container(
                            height: 300,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: _images.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentImageIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                return AnimatedContainer(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  transform: Matrix4.identity()
                                    ..scale(_currentImageIndex == index ? 1.0 : 0.9),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.2),
                                            blurRadius: 8.0,
                                            offset: Offset(0, 4),
                                          ),
                                          // Animated border glow for current image
                                          if (_currentImageIndex == index)
                                            BoxShadow(
                                              color: Colors.brown.shade400,
                                              blurRadius: 20.0,
                                              spreadRadius: 2.0,
                                            ),
                                        ],
                                      ),
                                      child: Image.asset(
                                        _images[index],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          // Previous button
                          Positioned(
                            left: 8,
                            top: 130,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
                              onPressed: _previousImage,
                            ),
                          ),
                          // Next button
                          Positioned(
                            right: 8,
                            top: 130,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.brown),
                              onPressed: _nextImage,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      // Dots indicator with animation
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_images.length, (index) {
                          return AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            width: _currentImageIndex == index ? 12.0 : 8.0,
                            height: 8.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentImageIndex == index
                                  ? Colors.brown
                                  : Colors.grey,
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}