<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Current Top 10 Anime - Rashfire </title>
    <link rel="stylesheet" href="css/styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .page-header {
            text-align: center;
            padding: 3rem 0;
            background: linear-gradient(135deg, rgba(255,107,53,0.1) 0%, rgba(0,0,0,0) 100%);
            border-radius: 20px;
            margin-bottom: 2rem;
        }
        
        .page-header h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        
        .page-header h1 i {
            color: #FF4444;
            margin-right: 10px;
        }
        
        .trending-badge {
            display: inline-block;
            background: linear-gradient(135deg, #FF4444, #FF6B35);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }
        
        .anime-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 2rem;
            padding: 2rem 0;
        }
        
        .anime-card {
            background: linear-gradient(135deg, var(--gray) 0%, #252540 100%);
            border-radius: 15px;
            overflow: hidden;
            transition: all 0.4s ease;
            cursor: pointer;
            position: relative;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        
        .anime-card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
        }
        
        .anime-poster-container {
            position: relative;
            overflow: hidden;
        }
        
        .anime-poster {
            width: 100%;
            height: 420px;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        
        .anime-card:hover .anime-poster {
            transform: scale(1.05);
        }
        
        .rank-badge {
            position: absolute;
            top: 15px;
            left: 15px;
            background: linear-gradient(135deg, #FF4444, #FF6B35);
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            font-weight: bold;
            color: white;
            z-index: 2;
            box-shadow: 0 3px 10px rgba(0,0,0,0.3);
        }
        
        .trending-icon {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(0,0,0,0.7);
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.7rem;
            z-index: 2;
        }
        
        .play-overlay {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(0,0,0,0.7);
            width: 60px;
            height: 60px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: all 0.3s ease;
            cursor: pointer;
            z-index: 2;
        }
        
        .anime-poster-container:hover .play-overlay {
            opacity: 1;
        }
        
        .play-overlay i {
            font-size: 2rem;
            color: white;
        }
        
        .anime-info {
            padding: 1.5rem;
        }
        
        .anime-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .rating {
            color: #FFD700;
            margin: 0.5rem 0;
        }
        
        .genre-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
            margin: 0.5rem 0;
        }
        
        .genre-tag {
            background: rgba(255,107,53,0.2);
            padding: 0.2rem 0.6rem;
            border-radius: 20px;
            font-size: 0.7rem;
            color: #FF6B35;
        }
        
        .watch-btn {
            width: 100%;
            padding: 0.8rem;
            margin-top: 1rem;
            background: linear-gradient(135deg, #FF4444, #FF6B35);
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .watch-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(255,68,68,0.4);
        }
        
        .stats-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
            padding-top: 0.5rem;
            border-top: 1px solid rgba(255,255,255,0.1);
        }
        
        .stat-item {
            display: flex;
            align-items: center;
            gap: 0.3rem;
            font-size: 0.8rem;
        }
        
        .stat-item i {
            color: #FFD700;
        }
        
        .hot-badge {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: rgba(0,0,0,0.7);
            padding: 0.2rem 0.5rem;
            border-radius: 20px;
            font-size: 0.7rem;
            z-index: 2;
        }
        
        .stats-bar {
            display: flex;
            justify-content: center;
            gap: 2rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }
        
        .stat-card {
            background: rgba(255,255,255,0.1);
            padding: 1rem 2rem;
            border-radius: 50px;
            backdrop-filter: blur(10px);
        }
        
        .stat-card i {
            font-size: 1.5rem;
            margin-right: 10px;
            color: #FFD700;
        }
        
        .week-rank {
            background: rgba(0,0,0,0.6);
            padding: 0.2rem 0.5rem;
            border-radius: 5px;
            font-size: 0.7rem;
        }
        
        .navbar {
            background: rgba(26, 26, 46, 0.95);
            backdrop-filter: blur(10px);
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 20px rgba(0,0,0,0.3);
        }
        
        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }
        
        .logo h1 {
            font-size: 1.8rem;
            background: linear-gradient(135deg, #FFD700, #FF6B35);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .tagline {
            font-size: 0.8rem;
            color: #FF6B35;
            display: block;
        }
        
        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }
        
        .nav-links a {
            color: #f5f5f5;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover, .nav-links a.active {
            color: #FF6B35;
        }
        
        .search-bar {
            display: flex;
            gap: 0.5rem;
        }
        
        .search-bar input {
            padding: 0.5rem 1rem;
            border: none;
            border-radius: 25px;
            background: #2d2d44;
            color: white;
        }
        
        .search-bar button {
            padding: 0.5rem 1rem;
            background: #FF6B35;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            color: white;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        footer {
            background: #0f0f1a;
            padding: 3rem 2rem 1rem;
            margin-top: 4rem;
        }
        
        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }
        
        .footer-section ul {
            list-style: none;
        }
        
        .footer-section a {
            color: #ccc;
            text-decoration: none;
        }
        
        .social-icons {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .social-icons a {
            color: #f5f5f5;
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }
        
        .social-icons a:hover {
            color: #FF6B35;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid #2d2d44;
        }
        
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }
            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
            }
            .anime-grid {
                grid-template-columns: 1fr;
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .anime-card {
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }
    </style>
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
                <li><a href="alltime-top10.jsp"><i class="fas fa-trophy"></i> All-Time Top 10</a></li>
                <li><a href="current-top10.jsp" class="active"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" placeholder="Search trending anime..." id="searchInput">
                <button><i class="fas fa-search"></i></button>
            </div>
        </div>
    </nav>

    <main class="main-content">
        <div class="container">
            <div class="page-header">
                <div class="trending-badge">
                    <i class="fas fa-fire"></i> Spring 2026 Season Rankings
                </div>
                <h1><i class="fas fa-chart-line"></i> Current Top 10 Anime</h1>
                <p>Based on weekly rankings from Japanese polls and streaming platforms (May 2026)</p>
                <div class="stats-bar">
                    <div class="stat-card">
                        <i class="fas fa-fire"></i>
                        <span> Trending Now</span>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-chart-simple"></i>
                        <span>Updated Weekly</span>
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-users"></i>
                        <span>50M+ Weekly Viewers</span>
                    </div>
                </div>
            </div>

            <div class="anime-grid" id="animeGrid">
                <!-- Current anime cards will be loaded here -->
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Rashfire </h3>
                <p>Your premium anime streaming platform</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-discord"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-tiktok"></i></a>
                </div>
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
                <h4>Trending Now</h4>
                <p><i class="fas fa-fire"></i> Jujutsu Kaisen</p>
                <p><i class="fas fa-fire"></i> Demon Slayer</p>
                <p><i class="fas fa-fire"></i> Frieren</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Rashfire  - All rights reserved. Stay tuned for weekly updates!</p>
        </div>
    </footer>

    <script>
        // Current Top 10 Anime Data - Spring 2026
        var currentAnime = [
            { rank: 1, title: "Jujutsu Kaisen", year: "2020-2026", rating: 9.6, reviews: 234000, genre: ["Action", "Supernatural", "Dark Fantasy"], image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400", description: "Curses and sorcerers collide in this action-packed supernatural thriller.", episodes: 62, studio: "MAPPA", trend: "+45% this week", watchCount: "2.3M" },
            { rank: 2, title: "Attack on Titan", year: "2013-2026", rating: 9.7, reviews: 412000, genre: ["Dark Fantasy", "Action", "Post-Apocalyptic"], image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400", description: "The epic conclusion continues to dominate charts worldwide.", episodes: 94, studio: "MAPPA", trend: "+32% this week", watchCount: "1.9M" },
            { rank: 3, title: "Frieren: Beyond Journey's End", year: "2023-2026", rating: 9.5, reviews: 178000, genre: ["Fantasy", "Slice of Life", "Adventure"], image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=400", description: "A heartfelt journey of an elf mage learning to understand human emotions.", episodes: 34, studio: "Madhouse", trend: "+28% this week", watchCount: "1.6M" },
            { rank: 4, title: "Demon Slayer: Kimetsu no Yaiba", year: "2019-2026", rating: 9.6, reviews: 345000, genre: ["Action", "Historical", "Supernatural"], image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=400", description: "The Infinity Castle arc is captivating audiences with stunning animation.", episodes: 63, studio: "ufotable", trend: "+41% this week", watchCount: "3.1M" },
            { rank: 5, title: "Oshi no Ko", year: "2023-2026", rating: 9.4, reviews: 156000, genre: ["Drama", "Supernatural", "Showbiz"], image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=400", description: "The dark side of the entertainment industry revealed.", episodes: 30, studio: "Doga Kobo", trend: "+25% this week", watchCount: "1.4M" },
            { rank: 6, title: "My Hero Academia", year: "2016-2026", rating: 9.3, reviews: 289000, genre: ["Action", "Superhero", "School"], image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=400", description: "The final war arc is reaching its climax with epic battles.", episodes: 152, studio: "Bones", trend: "+19% this week", watchCount: "1.8M" },
            { rank: 7, title: "Spy x Family", year: "2022-2026", rating: 9.2, reviews: 198000, genre: ["Comedy", "Action", "Slice of Life"], image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=400", description: "The Forger family continues to charm audiences.", episodes: 50, studio: "WIT Studio / CloverWorks", trend: "+15% this week", watchCount: "2.0M" },
            { rank: 8, title: "The Apothecary Diaries", year: "2023-2026", rating: 9.1, reviews: 123000, genre: ["Mystery", "Historical", "Drama"], image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=400", description: "A brilliant apothecary solves mysteries in the imperial court.", episodes: 36, studio: "TOHO animation", trend: "+22% this week", watchCount: "1.1M" },
            { rank: 9, title: "Death Note", year: "2006-2026 (Re-run)", rating: 9.4, reviews: 234000, genre: ["Psychological", "Thriller", "Supernatural"], image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400", description: "The timeless classic is experiencing a massive resurgence!", episodes: 37, studio: "Madhouse", trend: "+50% this week", watchCount: "987K" },
            { rank: 10, title: "Fullmetal Alchemist: Brotherhood", year: "2009-2026 (Re-run)", rating: 9.8, reviews: 345000, genre: ["Action", "Adventure", "Fantasy"], image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=400", description: "The perfect anime experiencing renewed love.", episodes: 64, studio: "Bones", trend: "+38% this week", watchCount: "876K" }
        ];

        function getRatingStars(rating) {
            var stars = '';
            var fullStars = Math.floor(rating);
            var hasHalfStar = (rating % 1) >= 0.5;
            
            for (var i = 0; i < fullStars; i++) stars += '<i class="fas fa-star"></i>';
            if (hasHalfStar) stars += '<i class="fas fa-star-half-alt"></i>';
            var emptyStars = 5 - Math.ceil(rating);
            for (var i = 0; i < emptyStars; i++) stars += '<i class="far fa-star"></i>';
            
            return stars;
        }

        function renderAnime(animeList) {
            var container = document.getElementById('animeGrid');
            if (!container) return;
            
            var html = '';
            for (var i = 0; i < animeList.length; i++) {
                var anime = animeList[i];
                var ratingStars = getRatingStars(anime.rating);
                var trendColor = (anime.trend.indexOf('+') !== -1) ? '#FF4444' : '#4CAF50';
                var trendIcon = (anime.trend.indexOf('+') !== -1) ? '' : '';
                
                // Build genre tags
                var genreHtml = '';
                for (var g = 0; g < anime.genre.length; g++) {
                    genreHtml += '<span class="genre-tag">' + anime.genre[g] + '</span>';
                }
                
                html += '<div class="anime-card" onclick="watchAnime(\'' + anime.title.replace(/'/g, "\\'") + '\')">';
                html += '<div class="anime-poster-container">';
                html += '<div class="rank-badge">#' + anime.rank + '</div>';
                html += '<div class="trending-icon"><i class="fas fa-chart-line" style="color: ' + trendColor + '"></i> ' + anime.trend + '</div>';
                html += '<img src="' + anime.image + '" alt="' + anime.title + '" class="anime-poster" onerror="this.src=\'https://via.placeholder.com/400x420?text=' + encodeURIComponent(anime.title) + '\'">';
                html += '<div class="play-overlay"><i class="fas fa-play"></i></div>';
                html += '<div class="hot-badge"><i class="fas fa-eye"></i> ' + anime.watchCount + ' watching</div>';
                html += '</div>';
                html += '<div class="anime-info">';
                html += '<div class="anime-title">' + anime.title + '</div>';
                html += '<div class="rating">' + ratingStars + '<span style="color: #ccc; margin-left: 5px;">(' + anime.reviews.toLocaleString() + ' reviews)</span></div>';
                html += '<div class="genre-tags">' + genreHtml + '</div>';
                html += '<p style="font-size: 0.85rem; color: #aaa; margin: 0.5rem 0;">' + anime.description.substring(0, 100) + '...</p>';
                html += '<div class="stats-row">';
                html += '<div class="stat-item"><i class="fas fa-tv"></i><span>' + anime.episodes + ' eps</span></div>';
                html += '<div class="stat-item"><i class="fas fa-building"></i><span>' + anime.studio + '</span></div>';
                html += '<div class="stat-item"><i class="fas ' + trendIcon + '" style="color: ' + trendColor + '"></i><span>Trending</span></div>';
                html += '</div>';
                html += '<button class="watch-btn" onclick="event.stopPropagation(); watchAnime(\'' + anime.title.replace(/'/g, "\\'") + '\')"><i class="fas fa-play"></i> Watch Now</button>';
                html += '</div></div>';
            }
            container.innerHTML = html;
        }

        function watchAnime(title) {
            sessionStorage.setItem('watchingAnime', title);
            window.location.href = 'watch.jsp';
        }

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            renderAnime(currentAnime);
            
            var searchInput = document.getElementById('searchInput');
            if (searchInput) {
                searchInput.addEventListener('input', function(e) {
                    var query = e.target.value.toLowerCase();
                    var filtered = [];
                    
                    for (var i = 0; i < currentAnime.length; i++) {
                        var anime = currentAnime[i];
                        var titleMatch = anime.title.toLowerCase().indexOf(query) !== -1;
                        var genreMatch = false;
                        for (var g = 0; g < anime.genre.length; g++) {
                            if (anime.genre[g].toLowerCase().indexOf(query) !== -1) {
                                genreMatch = true;
                                break;
                            }
                        }
                        var studioMatch = anime.studio.toLowerCase().indexOf(query) !== -1;
                        if (titleMatch || genreMatch || studioMatch) {
                            filtered.push(anime);
                        }
                    }
                    
                    if (query.length > 0 && filtered.length === 0) {
                        var container = document.getElementById('animeGrid');
                        container.innerHTML = '<div style="grid-column: 1/-1; text-align: center; padding: 4rem;"><i class="fas fa-search" style="font-size: 3rem; color: #FF6B35;"></i><h3>No results found for "' + query + '"</h3><p>Try searching for another anime title or genre</p></div>';
                    } else if (query.length > 0) {
                        renderAnime(filtered);
                    } else {
                        renderAnime(currentAnime);
                    }
                });
            }
        });
    </script>
</body>
</html>
