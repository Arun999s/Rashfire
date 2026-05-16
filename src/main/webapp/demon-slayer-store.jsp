<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demon Slayer Merch Store - Rashfire </title>
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
                <li><a href="demon-slayer-store.jsp" class="active"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
        </div>
    </nav>

    <main class="main-content">
        <div class="container">
            <div class="page-header store-header">
                <h1><i class="fas fa-sword"></i> Demon Slayer Official Merchandise Store</h1>
                <p>Get authentic Demon Slayer: Kimetsu no Yaiba merchandise</p>
                <div class="store-badge">
                    <i class="fas fa-check-circle"></i> 100% Official Merchandise
                </div>
            </div>

            <div class="store-categories">
                <button class="cat-btn active" data-category="all">All Items</button>
                <button class="cat-btn" data-category="figures">Action Figures</button>
                <button class="cat-btn" data-category="apparel">Apparel</button>
                <button class="cat-btn" data-category="accessories">Accessories</button>
                <button class="cat-btn" data-category="posters">Posters & Art</button>
            </div>

            <div class="merch-grid" id="merchGrid">
                <!-- Merchandise loaded via JavaScript -->
            </div>

            <div class="cart-sidebar" id="cartSidebar">
                <h3><i class="fas fa-shopping-cart"></i> Your Cart</h3>
                <div id="cartItems"></div>
                <div class="cart-total">
                    <strong>Total: <span id="cartTotal">0</span></strong>
                </div>
                <button class="checkout-btn" onclick="checkout()">Checkout</button>
            </div>
        </div>
    </main>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Rashfire  Demon Slayer Store</h3>
                <p>Officially licensed merchandise</p>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Rashfire  - Demon Slayer Store | All rights reserved</p>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>
</html>
