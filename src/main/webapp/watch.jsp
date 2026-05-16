<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Now Watching - Rashfire </title>
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
                <li><a href="alltime-top10.jsp"><i class="fas fa-trophy"></i> All-Time Top 10</a></li>
                <li><a href="current-top10.jsp"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
        </div>
    </nav>

    <div class="watch-container">
        <div class="video-player">
            <div class="video-placeholder">
                <i class="fas fa-play-circle"></i>
                <h2>Streaming: <span id="animeTitle">Loading...</span></h2>
                <p>Premium streaming experience with zero buffering</p>
                <button class="btn-primary" onclick="simulatePlayback()">
                    <i class="fas fa-play"></i> Start Streaming
                </button>
            </div>
        </div>
        <div class="episode-list">
            <h3>Episodes</h3>
            <div id="episodeList"></div>
        </div>
    </div>

    <script src="js/script.js"></script>
</body>
</html>
