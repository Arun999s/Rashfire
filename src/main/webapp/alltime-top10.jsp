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
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        :root { --primary: #FF6B35; --primary-dark: #E85D2C; --secondary: #FFD700; --dark: #1a1a2e; --darker: #0f0f1a; --light: #f5f5f5; --gray: #2d2d44; }
        body { font-family: 'Poppins', sans-serif; background: linear-gradient(135deg, var(--dark) 0%, var(--darker) 100%); color: var(--light); min-height: 100vh; }
        .navbar { background: rgba(26, 26, 46, 0.95); backdrop-filter: blur(10px); position: sticky; top: 0; z-index: 1000; box-shadow: 0 2px 20px rgba(0,0,0,0.3); }
        .nav-container { max-width: 1400px; margin: 0 auto; padding: 1rem 2rem; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; }
        .logo h1 { font-size: 1.8rem; background: linear-gradient(135deg, var(--secondary), var(--primary)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .tagline { font-size: 0.8rem; color: var(--primary); display: block; }
        .nav-links { display: flex; list-style: none; gap: 2rem; }
        .nav-links a { color: var(--light); text-decoration: none; font-weight: 500; transition: all 0.3s ease; }
        .nav-links a:hover, .nav-links a.active { color: var(--primary); }
        .search-bar { display: flex; gap: 0.5rem; }
        .search-bar input { padding: 0.5rem 1rem; border: none; border-radius: 25px; background: var(--gray); color: white; }
        .search-bar button { padding: 0.5rem 1rem; background: var(--primary); border: none; border-radius: 25px; cursor: pointer; color: white; }
        .container { max-width: 1400px; margin: 0 auto; padding: 0 2rem; }
        .page-header { text-align: center; padding: 3rem 0; background: linear-gradient(135deg, rgba(255,107,53,0.1) 0%, rgba(0,0,0,0) 100%); border-radius: 20px; margin-bottom: 2rem; }
        .page-header h1 { font-size: 3rem; margin-bottom: 1rem; }
        .page-header h1 i { color: #FFD700; margin-right: 10px; }
        .stats-bar { display: flex; justify-content: center; gap: 2rem; margin-top: 2rem; flex-wrap: wrap; }
        .stat-card { background: rgba(255,255,255,0.1); padding: 1rem 2rem; border-radius: 50px; backdrop-filter: blur(10px); }
        .stat-card i { font-size: 1.5rem; margin-right: 10px; color: #FFD700; }
        .anime-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 2rem; padding: 2rem 0; }
        .anime-card { background: linear-gradient(135deg, var(--gray) 0%, #252540 100%); border-radius: 15px; overflow: hidden; transition: all 0.4s ease; cursor: pointer; position: relative; box-shadow: 0 5px 15px rgba(0,0,0,0.3); }
        .anime-card:hover { transform: translateY(-10px) scale(1.02); box-shadow: 0 20px 40px rgba(0,0,0,0.4); }
        .anime-poster-container { position: relative; overflow: hidden; }
        .anime-poster { width: 100%; height: 400px; object-fit: cover; transition: transform 0.4s ease; }
        .anime-card:hover .anime-poster { transform: scale(1.05); }
        .rank-badge { position: absolute; top: 15px; left: 15px; background: linear-gradient(135deg, #FF6B35, #FFD700); width: 50px; height: 50px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 1.5rem; font-weight: bold; color: white; z-index: 2; }
        .play-overlay { position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background: rgba(0,0,0,0.7); width: 60px; height: 60px; border-radius: 50%; display: flex; align-items: center; justify-content: center; opacity: 0; transition: all 0.3s ease; z-index: 2; }
        .anime-poster-container:hover .play-overlay { opacity: 1; }
        .play-overlay i { font-size: 2rem; color: white; }
        .anime-info { padding: 1.5rem; }
        .anime-title { font-size: 1.2rem; font-weight: 600; margin-bottom: 0.5rem; display: flex; justify-content: space-between; align-items: center; }
        .anime-year { font-size: 0.8rem; color: #FFD700; }
        .rating { color: #FFD700; margin: 0.5rem 0; }
        .genre-tags { display: flex; flex-wrap: wrap; gap: 0.5rem; margin: 0.5rem 0; }
        .genre-tag { background: rgba(255,107,53,0.2); padding: 0.2rem 0.6rem; border-radius: 20px; font-size: 0.7rem; color: #FF6B35; }
        .watch-btn { width: 100%; padding: 0.8rem; margin-top: 1rem; background: linear-gradient(135deg, #FF6B35, #FF8C42); border: none; border-radius: 10px; color: white; font-weight: 600; cursor: pointer; transition: all 0.3s ease; }
        .watch-btn:hover { transform: translateY(-2px); }
        .stats-row { display: flex; justify-content: space-between; align-items: center; margin-top: 1rem; padding-top: 0.5rem; border-top: 1px solid rgba(255,255,255,0.1); }
        .stat-item { display: flex; align-items: center; gap: 0.3rem; font-size: 0.8rem; }
        .stat-item i { color: #FFD700; }
        footer { background: var(--darker); padding: 3rem 2rem 1rem; margin-top: 4rem; }
        .footer-content { max-width: 1200px; margin: 0 auto; display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 2rem; }
        .footer-section ul { list-style: none; }
        .footer-section a { color: #ccc; text-decoration: none; }
        .social-icons { display: flex; gap: 1rem; margin-top: 1rem; }
        .social-icons a { color: var(--light); font-size: 1.5rem; transition: color 0.3s ease; }
        .social-icons a:hover { color: var(--primary); }
        .footer-bottom { text-align: center; padding-top: 2rem; margin-top: 2rem; border-top: 1px solid var(--gray); }
        @media (max-width: 768px) { .nav-container { flex-direction: column; gap: 1rem; } .nav-links { flex-wrap: wrap; justify-content: center; } .anime-grid { grid-template-columns: 1fr; } }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        .anime-card { animation: fadeInUp 0.6s ease forwards; opacity: 0; }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo"><h1>Rashfire </h1><span class="tagline">Surf & Binge</span></div>
            <ul class="nav-links">
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="alltime-top10.jsp" class="active"><i class="fas fa-trophy"></i> All-Time Top 10</a></li>
                <li><a href="current-top10.jsp"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
            <div class="search-bar"><input type="text" placeholder="Search anime..." id="searchInput"><button><i class="fas fa-search"></i></button></div>
        </div>
    </nav>

    <main>
        <div class="container">
            <div class="page-header">
                <h1><i class="fas fa-crown"></i> All-Time Top 10 Anime</h1>
                <p>The greatest anime masterpieces of all time, ranked by fans worldwide</p>
                <div class="stats-bar">
                    <div class="stat-card"><i class="fas fa-chart-line"></i><span>10</span> Legendary Series</div>
                    <div class="stat-card"><i class="fas fa-star"></i><span>9.2+</span> Average Rating</div>
                    <div class="stat-card"><i class="fas fa-globe"></i><span>100M+</span> Fans Worldwide</div>
                </div>
            </div>
            <div class="anime-grid" id="animeGrid"></div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="footer-section"><h3>Rashfire </h3><p>Your premium anime streaming platform</p><div class="social-icons"><a href="#"><i class="fab fa-discord"></i></a><a href="#"><i class="fab fa-twitter"></i></a><a href="#"><i class="fab fa-instagram"></i></a></div></div>
            <div class="footer-section"><h4>Quick Links</h4><ul><li><a href="alltime-top10.jsp">All-Time Top 10</a></li><li><a href="current-top10.jsp">Current Top 10</a></li><li><a href="demon-slayer-store.jsp">Merch Store</a></li></ul></div>
            <div class="footer-section"><h4>Contact</h4><p><i class="fas fa-envelope"></i> support@rashfire.com</p><p><i class="fas fa-phone"></i> +91 1800-ANIME-4U</p></div>
        </div>
        <div class="footer-bottom"><p>&copy; 2026 Rashfire  - All rights reserved.</p></div>
    </footer>

    <script>
    var allTimeAnime = [
        {rank:1,title:"Cowboy Bebop",year:"1998",rating:9.5,reviews:125000,genre:["Action","Sci-Fi","Space Western"],image:"https://images.unsplash.com/photo-1578632767115-351597cf2477?w=400",description:"The classic space western following bounty hunter Spike Spiegel.",episodes:26,studio:"Sunrise"},
        {rank:2,title:"Death Note",year:"2006",rating:9.4,reviews:234000,genre:["Psychological","Thriller","Supernatural"],image:"https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400",description:"A genius high school student gains the power to kill anyone.",episodes:37,studio:"Madhouse"},
        {rank:3,title:"Fullmetal Alchemist: Brotherhood",year:"2009",rating:9.8,reviews:345000,genre:["Action","Adventure","Fantasy"],image:"https://images.unsplash.com/photo-1560972550-aba3456b5564?w=400",description:"Two brothers use alchemy to search for the Philosopher's Stone.",episodes:64,studio:"Bones"},
        {rank:4,title:"Neon Genesis Evangelion",year:"1995",rating:9.2,reviews:189000,genre:["Mecha","Psychological","Action"],image:"https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=400",description:"Teenage pilots fight mysterious monsters called Angels.",episodes:26,studio:"Gainax"},
        {rank:5,title:"One Punch Man",year:"2015",rating:9.3,reviews:278000,genre:["Action","Comedy","Superhero"],image:"https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=400",description:"A hero who can defeat any enemy with a single punch.",episodes:24,studio:"Madhouse"},
        {rank:6,title:"Sailor Moon",year:"1992",rating:9.1,reviews:156000,genre:["Magical Girl","Action","Romance"],image:"https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=400",description:"A teenage girl discovers she is a magical princess.",episodes:200,studio:"Toei Animation"},
        {rank:7,title:"Attack on Titan",year:"2013",rating:9.7,reviews:412000,genre:["Dark Fantasy","Action","Post-Apocalyptic"],image:"https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=400",description:"Humanity fights for survival against giant Titans.",episodes:87,studio:"WIT Studio"},
        {rank:8,title:"Spirited Away",year:"2001",rating:9.6,reviews:298000,genre:["Fantasy","Adventure","Family"],image:"https://images.unsplash.com/photo-1578632767115-351597cf2477?w=400",description:"A young girl gets trapped in a mysterious spirit world.",episodes:1,studio:"Studio Ghibli"},
        {rank:9,title:"Steins;Gate",year:"2011",rating:9.4,reviews:167000,genre:["Sci-Fi","Thriller","Psychological"],image:"https://images.unsplash.com/photo-1635805737707-575885ab0820?w=400",description:"A self-proclaimed mad scientist discovers time travel.",episodes:24,studio:"White Fox"},
        {rank:10,title:"The Melancholy of Haruhi Suzumiya",year:"2006",rating:8.9,reviews:123000,genre:["Comedy","Sci-Fi","Slice of Life"],image:"https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=400",description:"A high school boy discovers his classmate may alter reality.",episodes:28,studio:"Kyoto Animation"}
    ];

    function getStars(rating){
        var stars="";
        var full=Math.floor(rating);
        var half=(rating%1)>=0.5;
        for(var i=0;i<full;i++) stars+='<i class="fas fa-star"></i>';
        if(half) stars+='<i class="fas fa-star-half-alt"></i>';
        for(var i=0;i<5-Math.ceil(rating);i++) stars+='<i class="far fa-star"></i>';
        return stars;
    }

    function render(list){
        var container=document.getElementById("animeGrid");
        if(!container) return;
        var html="";
        for(var i=0;i<list.length;i++){
            var a=list[i];
            var genreHtml="";
            for(var g=0;g<a.genre.length;g++) genreHtml+='<span class="genre-tag">'+a.genre[g]+'</span>';
            html+='<div class="anime-card" onclick="watchAnime(\''+a.title.replace(/'/g,"\\'")+'\')">';
            html+='<div class="anime-poster-container"><div class="rank-badge">#'+a.rank+'</div>';
            html+='<img src="'+a.image+'" class="anime-poster" onerror="this.src=\'https://placehold.co/400x400?text='+encodeURIComponent(a.title)+'\'">';
            html+='<div class="play-overlay"><i class="fas fa-play"></i></div></div>';
            html+='<div class="anime-info"><div class="anime-title"><span>'+a.title+'</span><span class="anime-year">'+a.year+'</span></div>';
            html+='<div class="rating">'+getStars(a.rating)+'<span style="color:#ccc;">('+a.reviews.toLocaleString()+' reviews)</span></div>';
            html+='<div class="genre-tags">'+genreHtml+'</div>';
            html+='<p style="font-size:0.85rem;color:#aaa;">'+a.description.substring(0,80)+'...</p>';
            html+='<div class="stats-row"><div class="stat-item"><i class="fas fa-tv"></i> '+a.episodes+' eps</div>';
            html+='<div class="stat-item"><i class="fas fa-building"></i> '+a.studio+'</div></div>';
            html+='<button class="watch-btn" onclick="event.stopPropagation();watchAnime(\''+a.title.replace(/'/g,"\\'")+'\')"><i class="fas fa-play"></i> Watch Now</button>';
            html+='</div></div>';
        }
        container.innerHTML=html;
    }

    function watchAnime(title){
        sessionStorage.setItem("watchingAnime",title);
        window.location.href="watch.jsp";
    }

    document.addEventListener("DOMContentLoaded",function(){
        render(allTimeAnime);
        var search=document.getElementById("searchInput");
        if(search){
            search.addEventListener("input",function(e){
                var q=e.target.value.toLowerCase();
                var filtered=[];
                for(var i=0;i<allTimeAnime.length;i++){
                    var a=allTimeAnime[i];
                    if(a.title.toLowerCase().indexOf(q)!==-1){
                        filtered.push(a);
                    }else{
                        for(var g=0;g<a.genre.length;g++){
                            if(a.genre[g].toLowerCase().indexOf(q)!==-1){
                                filtered.push(a);
                                break;
                            }
                        }
                    }
                }
                if(q.length>0 && filtered.length===0){
                    document.getElementById("animeGrid").innerHTML='<div style="grid-column:1/-1;text-align:center;padding:4rem;"><i class="fas fa-search" style="font-size:3rem;color:#FF6B35;"></i><h3>No results found</h3></div>';
                }else if(q.length>0){
                    render(filtered);
                }else{
                    render(allTimeAnime);
                }
            });
        }
    });
    </script>
</body>
</html>
