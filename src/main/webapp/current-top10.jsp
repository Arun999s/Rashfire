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
        
        .trending-icon i {
            color: #FF4444;
            margin-right: 5px;
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
        
        .anime-details {
            display: flex;
            gap: 1rem;
            margin: 0.5rem 0;
            font-size: 0.85rem;
            color: #ccc;
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
        
        .anime-card:nth-child(1) { animation-delay: 0.05s; }
        .anime-card:nth-child(2) { animation-delay: 0.1s; }
        .anime-card:nth-child(3) { animation-delay: 0.15s; }
        .anime-card:nth-child(4) { animation-delay: 0.2s; }
        .anime-card:nth-child(5) { animation-delay: 0.25s; }
        .anime-card:nth-child(6) { animation-delay: 0.3s; }
        .anime-card:nth-child(7) { animation-delay: 0.35s; }
        .anime-card:nth-child(8) { animation-delay: 0.4s; }
        .anime-card:nth-child(9) { animation-delay: 0.45s; }
        .anime-card:nth-child(10) { animation-delay: 0.5s; }
        
        .week-rank {
            background: rgba(0,0,0,0.6);
            padding: 0.2rem 0.5rem;
            border-radius: 5px;
            font-size: 0.7rem;
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
                <div class="stats-bar" style="margin-top: 2rem;">
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
        // Current Top 10 Anime Data (Spring 2026 Rankings)
        const currentAnime = [
            {
                rank: 1,
                title: "Jujutsu Kaisen",
                year: "2020-2026",
                rating: 9.6,
                reviews: 234000,
                genre: ["Action", "Supernatural", "Dark Fantasy"],
                image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400",
                description: "Curses and sorcerers collide in this action-packed supernatural thriller. Season 3 is breaking all records!",
                episodes: 62,
                studio: "MAPPA",
                trend: "+45% this week",
                watchCount: "2.3M"
            },
            {
                rank: 2,
                title: "Attack on Titan",
                year: "2013-2026",
                rating: 9.7,
                reviews: 412000,
                genre: ["Dark Fantasy", "Action", "Post-Apocalyptic"],
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400",
                description: "The epic conclusion continues to dominate charts worldwide. A must-watch masterpiece.",
                episodes: 94,
                studio: "MAPPA",
                trend: "+32% this week",
                watchCount: "1.9M"
            },
            {
                rank: 3,
                title: "Frieren: Beyond Journey's End",
                year: "2023-2026",
                rating: 9.5,
                reviews: 178000,
                genre: ["Fantasy", "Slice of Life", "Adventure"],
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=400",
                description: "A heartfelt journey of an elf mage learning to understand human emotions after defeating the Demon King.",
                episodes: 34,
                studio: "Madhouse",
                trend: "+28% this week",
                watchCount: "1.6M"
            },
            {
                rank: 4,
                title: "Demon Slayer: Kimetsu no Yaiba",
                year: "2019-2026",
                rating: 9.6,
                reviews: 345000,
                genre: ["Action", "Historical", "Supernatural"],
                image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=400",
                description: "The Infinity Castle arc is captivating audiences with stunning animation and emotional storytelling.",
                episodes: 63,
                studio: "ufotable",
                trend: "+41% this week",
                watchCount: "3.1M"
            },
            {
                rank: 5,
                title: "Oshi no Ko",
                year: "2023-2026",
                rating: 9.4,
                reviews: 156000,
                genre: ["Drama", "Supernatural", "Showbiz"],
                image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=400",
                description: "The dark side of the entertainment industry revealed through reincarnated idols and their secrets.",
                episodes: 30,
                studio: "Doga Kobo",
                trend: "+25% this week",
                watchCount: "1.4M"
            },
            {
                rank: 6,
                title: "My Hero Academia",
                year: "2016-2026",
                rating: 9.3,
                reviews: 289000,
                genre: ["Action", "Superhero", "School"],
                image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=400",
                description: "The final war arc is reaching its climax with epic battles and emotional moments.",
                episodes: 152,
                studio: "Bones",
                trend: "+19% this week",
                watchCount: "1.8M"
            },
            {
                rank: 7,
                title: "Spy x Family",
                year: "2022-2026",
                rating: 9.2,
                reviews: 198000,
                genre: ["Comedy", "Action", "Slice of Life"],
                image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=400",
                description: "The Forger family continues to charm audiences with their hilarious spy adventures.",
                episodes: 50,
                studio: "WIT Studio / CloverWorks",
                trend: "+15% this week",
                watchCount: "2.0M"
            },
            {
                rank: 8,
                title: "The Apothecary Diaries",
                year: "2023-2026",
                rating: 9.1,
                reviews: 123000,
                genre: ["Mystery", "Historical", "Drama"],
                image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=400",
                description: "A brilliant apothecary solves mysteries in the imperial court with her unique skills.",
                episodes: 36,
                studio: "TOHO animation",
                trend: "+22% this week",
                watchCount: "1.1M"
            },
            {
                rank: 9,
                title: "Death Note",
                year: "2006-2026 (Re-run)",
                rating: 9.4,
                reviews: 234000,
                genre: ["Psychological", "Thriller", "Supernatural"],
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400",
                description: "The timeless classic is experiencing a massive resurgence in popularity!",
                episodes: 37,
                studio: "Madhouse",
                trend: "+50% this week",
                watchCount: "987K"
            },
            {
                rank: 10,
                title: "Fullmetal Alchemist: Brotherhood",
                year: "2009-2026 (Re-run)",
                rating: 9.8,
                reviews: 345000,
                genre: ["Action", "Adventure", "Fantasy"],
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=400",
                description: "The perfect anime experiencing renewed love from new generation fans.",
                episodes: 64,
                studio: "Bones",
                trend: "+38% this week",
                watchCount: "876K"
            }
        ];

        function renderAnime() {
            const container = document.getElementById('animeGrid');
            if (!container) return;
            
            let html = '';
            for (let i = 0; i < currentAnime.length; i++) {
                const anime = currentAnime[i];
                const ratingStars = getRatingStars(anime.rating);
                const trendIcon = anime.trend.includes('+') ? '' : '';
                const trendColor = anime.trend.includes('+') ? '#FF4444' : '#4CAF50';
                
                html += `
                    <div class="anime-card" onclick="watchAnime('${anime.title}')">
                        <div class="anime-poster-container">
                            <div class="rank-badge">#${anime.rank}</div>
                            <div class="trending-icon">
                                <i class="fas fa-chart-line" style="color: ${trendColor}"></i> ${anime.trend}
                            </div>
                            <img src="${anime.image}" alt="${anime.title}" class="anime-poster" onerror="this.src='https://via.placeholder.com/400x420?text=${encodeURIComponent(anime.title)}'">
                            <div class="play-overlay">
                                <i class="fas fa-play"></i>
                            </div>
                            <div class="hot-badge">
                                <i class="fas fa-eye"></i> ${anime.watchCount} watching
                            </div>
                        </div>
                        <div class="anime-info">
                            <div class="anime-title">
                                <span>${anime.title}</span>
                                <span class="week-rank"><i class="fas fa-calendar-week"></i> ${anime.year}</span>
                            </div>
                            <div class="rating">
                                ${ratingStars}
                                <span style="color: #ccc; margin-left: 5px;">(${anime.reviews.toLocaleString()} reviews)</span>
                            </div>
                            <div class="genre-tags">
                                ${anime.genre.map(g => `<span class="genre-tag">${g}</span>`).join('')}
                            </div>
                            <p style="font-size: 0.85rem; color: #aaa; margin: 0.5rem 0;">${anime.description.substring(0, 100)}...</p>
                            <div class="stats-row">
                                <div class="stat-item">
                                    <i class="fas fa-tv"></i>
                                    <span>${anime.episodes} eps</span>
                                </div>
                                <div class="stat-item">
                                    <i class="fas fa-building"></i>
                                    <span>${anime.studio}</span>
                                </div>
                                <div class="stat-item">
                                    <i class="fas ${trendIcon}" style="color: ${trendColor}"></i>
                                    <span>Trending</span>
                                </div>
                            </div>
                            <button class="watch-btn" onclick="event.stopPropagation(); watchAnime('${anime.title}')">
                                <i class="fas fa-play"></i> Watch Now
                            </button>
                        </div>
                    </div>
                `;
            }
            container.innerHTML = html;
        }

        function getRatingStars(rating) {
            let stars = '';
            const fullStars = Math.floor(rating);
            const hasHalfStar = (rating % 1) >= 0.5;
            
            for (let i = 0; i < fullStars; i++) stars += '<i class="fas fa-star"></i>';
            if (hasHalfStar) stars += '<i class="fas fa-star-half-alt"></i>';
            const emptyStars = 5 - Math.ceil(rating);
            for (let i = 0; i < emptyStars; i++) stars += '<i class="far fa-star"></i>';
            
            return stars;
        }

        function watchAnime(title) {
            sessionStorage.setItem('watchingAnime', title);
            window.location.href = 'watch.jsp';
        }

        // Search functionality
        document.addEventListener('DOMContentLoaded', function() {
            renderAnime();
            
            const searchInput = document.getElementById('searchInput');
            if (searchInput) {
                searchInput.addEventListener('input', function(e) {
                    const query = e.target.value.toLowerCase();
                    const filtered = currentAnime.filter(anime => 
                        anime.title.toLowerCase().includes(query) ||
                        anime.genre.some(g => g.toLowerCase().includes(query)) ||
                        anime.studio.toLowerCase().includes(query)
                    );
                    
                    const container = document.getElementById('animeGrid');
                    if (query.length > 0) {
                        if (filtered.length === 0) {
                            container.innerHTML = '<div style="grid-column: 1/-1; text-align: center; padding: 4rem;"><i class="fas fa-search" style="font-size: 3rem; color: #FF6B35;"></i><h3>No results found for "' + query + '"</h3><p>Try searching for another anime title or genre</p></div>';
                        } else {
                            let html = '';
                            for (let i = 0; i < filtered.length; i++) {
                                const anime = filtered[i];
                                const ratingStars = getRatingStars(anime.rating);
                                const trendIcon = anime.trend.includes('+') ? '' : '';
                                const trendColor = anime.trend.includes('+') ? '#FF4444' : '#4CAF50';
                                
                                html += `
                                    <div class="anime-card" onclick="watchAnime('${anime.title}')">
                                        <div class="anime-poster-container">
                                            <div class="rank-badge">#${anime.rank}</div>
                                            <div class="trending-icon"><i class="fas fa-chart-line" style="color: ${trendColor}"></i> ${anime.trend}</div>
                                            <img src="${anime.image}" class="anime-poster" onerror="this.src='https://via.placeholder.com/400x420?text=${encodeURIComponent(anime.title)}'">
                                            <div class="play-overlay"><i class="fas fa-play"></i></div>
                                            <div class="hot-badge"><i class="fas fa-eye"></i> ${anime.watchCount} watching</div>
                                        </div>
                                        <div class="anime-info">
                                            <div class="anime-title"><span>${anime.title}</span><span class="week-rank"><i class="fas fa-calendar-week"></i> ${anime.year}</span></div>
                                            <div class="rating">${ratingStars}<span style="color: #ccc;"> (${anime.reviews.toLocaleString()} reviews)</span></div>
                                            <div class="genre-tags">${anime.genre.map(g => `<span class="genre-tag">${g}</span>`).join('')}</div>
                                            <button class="watch-btn" onclick="event.stopPropagation(); watchAnime('${anime.title}')"><i class="fas fa-play"></i> Watch Now</button>
                                        </div>
                                    </div>
                                `;
                            }
                            container.innerHTML = html;
                        }
                    } else {
                        renderAnime();
                    }
                });
            }
        });
    </script>
</body>
</html>
