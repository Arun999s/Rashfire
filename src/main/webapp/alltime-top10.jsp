<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All-Time Top 10 Anime - Rashfire </title>
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
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="alltime-top10.jsp" class="active"><i class="fas fa-trophy"></i> All-Time Top 10</a></li>
                <li><a href="current-top10.jsp"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
        </div>
    </nav>

    <main class="main-content">
        <div class="container">
            <div class="page-header">
                <h1><i class="fas fa-crown"></i> All-Time Top 10 Anime</h1>
                <p>The greatest anime masterpieces of all time, ranked by fans worldwide</p>
            </div>
            
            <div class="anime-grid" id="alltimeAnimeList">
                <!-- Loaded via JavaScript -->
            </div>
        </div>
    </main>

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
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Rashfire  - All rights reserved.</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>
