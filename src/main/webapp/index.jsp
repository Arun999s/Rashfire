<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rashfire  - Anime Surfing & Binge-Watch</title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">
                <h1>Rashfire </h1>
                <span class="tagline">Surf & Binge</span>
            </div>
            <ul class="nav-links">
                <li><a href="index.jsp" class="active"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="alltime-top10.jsp"><i class="fas fa-trophy"></i> All-Time Top 10</a></li>
                <li><a href="current-top10.jsp"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" placeholder="Search anime..." id="searchInput">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>
    </nav>

    <header class="hero">
        <div class="hero-content">
            <h1>Welcome to <span class="highlight">Rashfire </span></h1>
            <p>Your ultimate destination for anime surfing and binge-watching experience</p>
            <div class="hero-buttons">
                <a href="current-top10.jsp" class="btn-primary"><i class="fas fa-play"></i> Start Watching</a>
                <a href="#featured" class="btn-secondary"><i class="fas fa-info-circle"></i> Explore</a>
            </div>
        </div>
    </header>

    <section class="featured-section" id="featured">
        <div class="container">
            <h2 class="section-title"> Featured This Week</h2>
            <div class="featured-grid" id="featuredGrid">
                <!-- Featured content will be loaded via JS -->
            </div>
        </div>
    </section>

    <section class="categories">
        <div class="container">
            <h2 class="section-title"> Quick Access</h2>
            <div class="category-cards">
                <div class="category-card" onclick="location.href='alltime-top10.jsp'">
                    <i class="fas fa-crown"></i>
                    <h3>All-Time Greats</h3>
                    <p>The most legendary anime ever created</p>
                </div>
                <div class="category-card" onclick="location.href='current-top10.jsp'">
                    <i class="fas fa-fire"></i>
                    <h3>Trending Now</h3>
                    <p>What everyone's watching this season</p>
                </div>
                <div class="category-card" onclick="location.href='demon-slayer-store.jsp'">
                    <i class="fas fa-sword"></i>
                    <h3>Demon Slayer Store</h3>
                    <p>Official merchandise and collectibles</p>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Rashfire </h3>
                <p>Your premium anime streaming platform</p>
            </div>
            <div class="footer-section">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="alltime-top10.jsp">All-Time Top 10</a></li>
                    <li><a href="current-top10.jsp">Current Top 10</a></li>
                    <li><a href="demon-slayer-store.jsp">Merch Store</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Follow Us</h4>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-discord"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-reddit"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Rashfire  - All rights reserved. Stream responsibly!</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>
