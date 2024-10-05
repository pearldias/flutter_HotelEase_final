import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  int _currentImageIndex = 0;
  late PageController _pageController;

  // Rearranged list of images (3, 4, 1, 2)
  final List<String> _images = [
    'assets/about3.jpg',
    'assets/about4.jpg',
    'assets/about1.jpg',
    'assets/about2.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentImageIndex,
      viewportFraction: 0.9,
    );
  }

  // Function to go to the previous image
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

  // Function to go to the next image
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
        child: SingleChildScrollView(
          // Allows scrolling in case of overflow
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back arrow and "About Us" title
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.brown),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.brown[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Text with quotes at the start and end
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '"Experience',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Elegance, Embrace',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Royalty"',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Image slider with navigation buttons
              Stack(
                children: [
                  Container(
                    height: 300, // Adjusted height for images
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: _images.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentImageIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0), // Reduced space between images
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              _images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  // Previous and next buttons
                  Positioned(
                    left: 8,
                    top: 130,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.brown),
                      onPressed: _previousImage,
                    ),
                  ),
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

              // Dots indicator for images
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_images.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: 8.0,
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
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}