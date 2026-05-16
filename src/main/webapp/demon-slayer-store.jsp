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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        :root {
            --primary: #FF6B35;
            --primary-dark: #E85D2C;
            --secondary: #FFD700;
            --dark: #1a1a2e;
            --darker: #0f0f1a;
            --light: #f5f5f5;
            --gray: #2d2d44;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, var(--dark) 0%, var(--darker) 100%);
            color: var(--light);
            min-height: 100vh;
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
            background: linear-gradient(135deg, var(--secondary), var(--primary));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }
        
        .tagline {
            font-size: 0.8rem;
            color: var(--primary);
            display: block;
        }
        
        .nav-links {
            display: flex;
            list-style: none;
            gap: 2rem;
        }
        
        .nav-links a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .nav-links a:hover, .nav-links a.active {
            color: var(--primary);
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        
        .store-hero {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 100%);
            border-radius: 20px;
            padding: 3rem 2rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .store-hero::before {
            content: '';
            position: absolute;
            font-size: 200px;
            opacity: 0.05;
            bottom: -50px;
            right: -50px;
            pointer-events: none;
        }
        
        .store-hero h1 {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }
        
        .store-hero h1 i {
            color: #FF6B35;
            margin-right: 10px;
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
        
        .filter-section {
            background: var(--gray);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .filter-group {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
            align-items: center;
        }
        
        .filter-group label {
            font-weight: 600;
        }
        
        .price-filter {
            display: flex;
            gap: 1rem;
            align-items: center;
            margin-left: auto;
        }
        
        .price-filter input {
            padding: 0.5rem;
            border-radius: 8px;
            border: none;
            background: var(--dark);
            color: white;
            width: 100px;
        }
        
        .sort-select {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            background: var(--dark);
            color: white;
            border: none;
            cursor: pointer;
        }
        
        .merch-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
            padding: 2rem 0;
        }
        
        .merch-card {
            background: var(--gray);
            border-radius: 15px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            position: relative;
            cursor: pointer;
        }
        
        .merch-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.4);
        }
        
        .merch-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
        }
        
        .merch-info {
            padding: 1rem;
        }
        
        .merch-price {
            color: var(--secondary);
            font-size: 1.3rem;
            font-weight: bold;
            margin: 0.5rem 0;
        }
        
        .stock-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.7rem;
            font-weight: 600;
            z-index: 1;
        }
        
        .stock-badge.in-stock {
            background: #4CAF50;
        }
        
        .stock-badge.low-stock {
            background: #FF9800;
        }
        
        .stock-badge.out-of-stock {
            background: #f44336;
        }
        
        .discount-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: #ff4444;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.7rem;
            font-weight: 600;
            z-index: 1;
        }
        
        .rating {
            color: #FFD700;
            margin: 0.5rem 0;
        }
        
        .rating span {
            color: var(--light);
            margin-left: 5px;
        }
        
        .original-price {
            text-decoration: line-through;
            color: #888;
            font-size: 0.9rem;
            margin-right: 10px;
        }
        
        .quantity-selector {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin: 0.5rem 0;
        }
        
        .quantity-selector button {
            background: var(--dark);
            border: none;
            width: 30px;
            height: 30px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
            transition: all 0.2s;
        }
        
        .quantity-selector button:hover {
            background: var(--primary);
        }
        
        .quantity-selector input {
            width: 60px;
            text-align: center;
            background: var(--dark);
            border: none;
            color: white;
            padding: 0.3rem;
            border-radius: 5px;
        }
        
        .add-to-cart {
            width: 100%;
            padding: 0.7rem;
            background: var(--primary);
            border: none;
            border-radius: 10px;
            color: white;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        
        .add-to-cart:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }
        
        .add-to-cart:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }
        
        .cart-sidebar {
            position: fixed;
            right: -450px;
            top: 0;
            width: 400px;
            height: 100vh;
            background: linear-gradient(135deg, var(--gray) 0%, var(--darker) 100%);
            padding: 2rem;
            transition: right 0.3s ease;
            z-index: 1001;
            overflow-y: auto;
            box-shadow: -5px 0 30px rgba(0,0,0,0.5);
        }
        
        .cart-sidebar.open {
            right: 0;
        }
        
        .cart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid var(--primary);
        }
        
        .cart-item {
            display: flex;
            gap: 1rem;
            margin-bottom: 1rem;
            padding: 0.8rem;
            background: rgba(255,255,255,0.05);
            border-radius: 10px;
        }
        
        .cart-item-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
        }
        
        .cart-item-details {
            flex: 1;
        }
        
        .cart-item-title {
            font-weight: 600;
            font-size: 0.9rem;
        }
        
        .cart-item-price {
            color: var(--secondary);
        }
        
        .cart-item-quantity {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            margin-top: 0.3rem;
        }
        
        .cart-item-quantity button {
            background: var(--dark);
            border: none;
            width: 25px;
            height: 25px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }
        
        .cart-total {
            margin-top: 2rem;
            padding-top: 1rem;
            border-top: 2px solid var(--primary);
            font-size: 1.2rem;
        }
        
        .checkout-btn {
            width: 100%;
            padding: 1rem;
            margin-top: 1rem;
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.2s;
        }
        
        .checkout-btn:hover {
            transform: translateY(-2px);
        }
        
        .cart-icon {
            position: relative;
            cursor: pointer;
        }
        
        .cart-count {
            position: absolute;
            top: -8px;
            right: -8px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            width: 20px;
            height: 20px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .wishlist-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
            transition: transform 0.2s;
        }
        
        .wishlist-btn:hover {
            transform: scale(1.1);
        }
        
        .store-badge {
            display: inline-block;
            background: rgba(255,215,0,0.2);
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }
        
        .btn-primary {
            padding: 0.5rem 1rem;
            background: var(--primary);
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
        }
        
        .cat-btn {
            padding: 0.5rem 1rem;
            background: var(--dark);
            border: none;
            border-radius: 8px;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .cat-btn.active, .cat-btn:hover {
            background: var(--primary);
        }
        
        footer {
            background: var(--darker);
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
        
        .social-icons {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }
        
        .social-icons a {
            color: var(--light);
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }
        
        .social-icons a:hover {
            color: var(--primary);
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 2rem;
            margin-top: 2rem;
            border-top: 1px solid var(--gray);
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
            
            .store-hero h1 {
                font-size: 1.5rem;
            }
            
            .cart-sidebar {
                width: 100%;
                right: -100%;
            }
        }
        
        .toast-notification {
            position: fixed;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: var(--primary);
            color: white;
            padding: 1rem 2rem;
            border-radius: 50px;
            z-index: 10000;
            animation: slideUp 0.3s ease;
        }
        
        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateX(-50%) translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }
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
                <li><a href="current-top10.jsp"><i class="fas fa-chart-line"></i> Current Top 10</a></li>
                <li><a href="demon-slayer-store.jsp" class="active"><i class="fas fa-store"></i> Demon Slayer Store</a></li>
            </ul>
            <div class="cart-icon" onclick="toggleCart()">
                <i class="fas fa-shopping-cart fa-2x"></i>
                <span class="cart-count" id="cartCount">0</span>
            </div>
        </div>
    </nav>

    <main class="main-content">
        <div class="container">
            <div class="store-hero">
                <h1><i class="fas fa-sword"></i> Demon Slayer Official Merchandise Store</h1>
                <p>Get authentic Demon Slayer: Kimetsu no Yaiba merchandise with exclusive discounts!</p>
                <div class="store-badge">
                    <i class="fas fa-check-circle"></i> 100% Official Merchandise
                    <i class="fas fa-truck" style="margin-left: 15px;"></i> Free Shipping on orders above 999
                    <i class="fas fa-shield-alt" style="margin-left: 15px;"></i> 7-Day Return Policy
                </div>
                
                <div class="stats-bar">
                    <div class="stat-card">
                        <i class="fas fa-box"></i>
                        <span id="totalProducts">0</span> Products
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-users"></i>
                        <span>10k+</span> Happy Customers
                    </div>
                    <div class="stat-card">
                        <i class="fas fa-star"></i>
                        <span>4.9</span> Rating
                    </div>
                </div>
            </div>

            <div class="filter-section">
                <div class="filter-group">
                    <label><i class="fas fa-filter"></i> Category:</label>
                    <button class="cat-btn active" data-category="all">All Items</button>
                    <button class="cat-btn" data-category="figures"><i class="fas fa-user-ninja"></i> Action Figures</button>
                    <button class="cat-btn" data-category="apparel"><i class="fas fa-tshirt"></i> Apparel</button>
                    <button class="cat-btn" data-category="accessories"><i class="fas fa-gem"></i> Accessories</button>
                    <button class="cat-btn" data-category="posters"><i class="fas fa-image"></i> Posters & Art</button>
                    <button class="cat-btn" data-category="limited"><i class="fas fa-fire"></i> Limited Edition</button>
                    
                    <div class="price-filter">
                        <label>Price Range:</label>
                        <input type="number" id="minPrice" placeholder="Min " value="0">
                        <span>-</span>
                        <input type="number" id="maxPrice" placeholder="Max " value="50000">
                        <button id="applyPriceFilter" class="btn-primary">Apply</button>
                    </div>
                    
                    <select id="sortBy" class="sort-select">
                        <option value="default">Sort by: Default</option>
                        <option value="price-asc">Price: Low to High</option>
                        <option value="price-desc">Price: High to Low</option>
                        <option value="rating">Rating: High to Low</option>
                        <option value="discount">Discount: High to Low</option>
                    </select>
                </div>
            </div>

            <div class="merch-grid" id="merchGrid"></div>
        </div>
    </main>

    <div class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h3><i class="fas fa-shopping-cart"></i> Your Cart</h3>
            <i class="fas fa-times" style="cursor: pointer; font-size: 1.5rem;" onclick="toggleCart()"></i>
        </div>
        <div id="cartItems"></div>
        <div class="cart-total">
            <strong>Subtotal: <span id="cartSubtotal">0</span></strong><br>
            <small>Shipping: <span id="shippingCost">0</span></small><br>
            <strong style="font-size: 1.3rem;">Total: <span id="cartTotal">0</span></strong>
        </div>
        <button class="checkout-btn" onclick="checkout()">
            <i class="fas fa-credit-card"></i> Proceed to Checkout
        </button>
        <button class="checkout-btn" onclick="clearCart()" style="background: #666; margin-top: 0.5rem;">
            <i class="fas fa-trash"></i> Clear Cart
        </button>
    </div>

    <div class="cart-sidebar" id="wishlistSidebar" style="right: -450px;">
        <div class="cart-header">
            <h3><i class="fas fa-heart"></i> Your Wishlist</h3>
            <i class="fas fa-times" style="cursor: pointer; font-size: 1.5rem;" onclick="toggleWishlist()"></i>
        </div>
        <div id="wishlistItems"></div>
    </div>

    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>Rashfire  Demon Slayer Store</h3>
                <p>Officially licensed merchandise from Demon Slayer: Kimetsu no Yaiba</p>
                <div class="social-icons">
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-discord"></i></a>
                </div>
            </div>
            <div class="footer-section">
                <h4>Customer Service</h4>
                <ul style="list-style: none;">
                    <li><i class="fas fa-envelope"></i> support@rashfire.com</li>
                    <li><i class="fas fa-phone"></i> +91 1800-ANIME-4U</li>
                    <li><i class="fas fa-clock"></i> 24/7 Support</li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Secure Payments</h4>
                <i class="fab fa-cc-visa fa-2x"></i>
                <i class="fab fa-cc-mastercard fa-2x"></i>
                <i class="fab fa-cc-paypal fa-2x"></i>
                <i class="fab fa-google-pay fa-2x"></i>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2026 Rashfire  - Demon Slayer Store | All rights reserved</p>
        </div>
    </footer>

    <script>
        // Merchandise Data
        const merchandise = [
            { id: 1, name: "Tanjiro Kamado DX Figure", price: 3499, originalPrice: 4999, category: "figures", image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", rating: 4.9, reviews: 234, stock: 45, discount: 30, limited: false },
            { id: 2, name: "Nezuko Plush Toy", price: 1499, originalPrice: 1999, category: "figures", image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300", rating: 4.8, reviews: 567, stock: 12, discount: 25, limited: false },
            { id: 3, name: "Demon Slayer Hoodie", price: 2499, originalPrice: 3999, category: "apparel", image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300", rating: 4.7, reviews: 189, stock: 28, discount: 37, limited: false },
            { id: 4, name: "Zenitsu Necklace", price: 999, originalPrice: 1499, category: "accessories", image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300", rating: 4.6, reviews: 892, stock: 78, discount: 33, limited: false },
            { id: 5, name: "Rengoku Poster Set", price: 799, originalPrice: 1299, category: "posters", image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300", rating: 4.9, reviews: 445, stock: 156, discount: 38, limited: false },
            { id: 6, name: "Hashira T-Shirt", price: 1799, originalPrice: 2499, category: "apparel", image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300", rating: 4.5, reviews: 234, stock: 92, discount: 28, limited: false },
            { id: 7, name: "Nichirin Sword Replica", price: 8999, originalPrice: 12999, category: "accessories", image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300", rating: 4.9, reviews: 67, stock: 3, discount: 30, limited: true },
            { id: 8, name: "Muzan Wall Scroll", price: 1299, originalPrice: 1999, category: "posters", image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300", rating: 4.4, reviews: 123, stock: 0, discount: 35, limited: true },
            { id: 9, name: "Giyu Tomioka Figure", price: 3999, originalPrice: 5999, category: "figures", image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", rating: 4.8, reviews: 178, stock: 15, discount: 33, limited: false },
            { id: 10, name: "Face Mask Set", price: 599, originalPrice: 999, category: "accessories", image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300", rating: 4.3, reviews: 1234, stock: 200, discount: 40, limited: false },
            { id: 11, name: "Shinobu Jacket", price: 3999, originalPrice: 5999, category: "apparel", image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300", rating: 4.7, reviews: 89, stock: 7, discount: 33, limited: true },
            { id: 12, name: "Art Book", price: 2499, originalPrice: 3499, category: "posters", image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300", rating: 4.9, reviews: 456, stock: 34, discount: 28, limited: false },
            { id: 13, name: "Inosuke Keychain", price: 449, originalPrice: 699, category: "accessories", image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300", rating: 4.6, reviews: 789, stock: 150, discount: 35, limited: false },
            { id: 14, name: "Kokushibo Statue", price: 7999, originalPrice: 11999, category: "figures", image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300", rating: 4.8, reviews: 45, stock: 2, discount: 33, limited: true },
            { id: 15, name: "Hashira Poster Set", price: 1999, originalPrice: 2999, category: "posters", image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300", rating: 4.9, reviews: 234, stock: 56, discount: 33, limited: false }
        ];

        let cart = [];
        let wishlist = [];
        let currentCategory = 'all';
        let currentMinPrice = 0;
        let currentMaxPrice = 50000;
        let currentSort = 'default';

        function loadSavedData() {
            const savedCart = localStorage.getItem('rashfire_cart');
            const savedWishlist = localStorage.getItem('rashfire_wishlist');
            if (savedCart) cart = JSON.parse(savedCart);
            if (savedWishlist) wishlist = JSON.parse(savedWishlist);
            updateCartCount();
            updateCartDisplay();
            updateWishlistDisplay();
        }

        function saveData() {
            localStorage.setItem('rashfire_cart', JSON.stringify(cart));
            localStorage.setItem('rashfire_wishlist', JSON.stringify(wishlist));
        }

        function getStockStatus(stock) {
            if (stock <= 0) return { statusClass: 'out-of-stock', text: 'Out of Stock', icon: 'fa-ban' };
            if (stock < 10) return { statusClass: 'low-stock', text: 'Only ' + stock + ' left!', icon: 'fa-exclamation-triangle' };
            return { statusClass: 'in-stock', text: 'In Stock', icon: 'fa-check-circle' };
        }

        function renderMerchandise() {
            const container = document.getElementById('merchGrid');
            if (!container) return;
            
            let filtered = merchandise.filter(function(item) {
                var matchesCategory = currentCategory === 'all' || item.category === currentCategory || (currentCategory === 'limited' && item.limited);
                var matchesPrice = item.price >= currentMinPrice && item.price <= currentMaxPrice;
                return matchesCategory && matchesPrice;
            });
            
            if (currentSort === 'price-asc') {
                filtered.sort(function(a, b) { return a.price - b.price; });
            } else if (currentSort === 'price-desc') {
                filtered.sort(function(a, b) { return b.price - a.price; });
            } else if (currentSort === 'rating') {
                filtered.sort(function(a, b) { return b.rating - a.rating; });
            } else if (currentSort === 'discount') {
                filtered.sort(function(a, b) { return b.discount - a.discount; });
            }
            
            document.getElementById('totalProducts').innerText = filtered.length;
            
            if (filtered.length === 0) {
                container.innerHTML = '<div style="grid-column: 1/-1; text-align: center; padding: 4rem;"><i class="fas fa-box-open" style="font-size: 4rem; color: #FF6B35;"></i><h3>No products found</h3><p>Try adjusting your filters</p></div>';
                return;
            }
            
            var html = '';
            for (var i = 0; i < filtered.length; i++) {
                var item = filtered[i];
                var stockStatus = getStockStatus(item.stock);
                var savings = item.originalPrice - item.price;
                var isInWishlist = false;
                for (var j = 0; j < wishlist.length; j++) {
                    if (wishlist[j].id === item.id) {
                        isInWishlist = true;
                        break;
                    }
                }
                
                var stars = '';
                var fullStars = Math.floor(item.rating);
                var hasHalfStar = (item.rating % 1) >= 0.5;
                for (var s = 0; s < fullStars; s++) stars += '';
                if (hasHalfStar) stars += '';
                var emptyStars = 5 - Math.ceil(item.rating);
                for (var e = 0; e < emptyStars; e++) stars += '';
                
                html += '<div class="merch-card">';
                html += '<div class="stock-badge ' + stockStatus.statusClass + '"><i class="fas ' + stockStatus.icon + '"></i> ' + stockStatus.text + '</div>';
                if (item.discount > 0) {
                    html += '<div class="discount-badge"><i class="fas fa-tag"></i> -' + item.discount + '%</div>';
                }
                html += '<img src="' + item.image + '" alt="' + item.name + '" class="merch-image">';
                html += '<div class="merch-info">';
                html += '<div style="display: flex; justify-content: space-between; align-items: start;">';
                html += '<h3 style="flex:1; font-size: 1rem;">' + item.name + '</h3>';
                html += '<button class="wishlist-btn" onclick="toggleWishlistItem(' + item.id + ')"><i class="fas fa-heart" style="color: ' + (isInWishlist ? '#ff4444' : '#888') + ';"></i></button>';
                html += '</div>';
                html += '<div class="rating">' + stars + '<span>(' + item.reviews + ' reviews)</span></div>';
                html += '<div>';
                if (item.originalPrice > item.price) {
                    html += '<span class="original-price">' + item.originalPrice.toLocaleString() + '</span>';
                }
                html += '<span class="merch-price">' + item.price.toLocaleString() + '</span>';
                html += '</div>';
                if (savings > 0) {
                    html += '<small style="color: #4CAF50;"><i class="fas fa-save"></i> Save ' + savings.toLocaleString() + '</small>';
                }
                html += '<div class="quantity-selector">';
                html += '<button onclick="changeQuantity(' + item.id + ', -1)"><i class="fas fa-minus"></i></button>';
                html += '<input type="number" id="qty-' + item.id + '" value="1" min="1" max="' + item.stock + '"' + (item.stock === 0 ? ' disabled' : '') + '>';
                html += '<button onclick="changeQuantity(' + item.id + ', 1)"' + (item.stock === 0 ? ' disabled' : '') + '><i class="fas fa-plus"></i></button>';
                html += '</div>';
                html += '<button class="add-to-cart" onclick="addToCart(' + item.id + ')"' + (item.stock === 0 ? ' disabled style="opacity:0.5;"' : '') + '>';
                html += '<i class="fas fa-cart-plus"></i> ' + (item.stock === 0 ? 'Out of Stock' : 'Add to Cart');
                html += '</button>';
                html += '</div></div>';
            }
            container.innerHTML = html;
        }

        function changeQuantity(id, delta) {
            var input = document.getElementById('qty-' + id);
            if (input) {
                var newVal = parseInt(input.value) + delta;
                for (var i = 0; i < merchandise.length; i++) {
                    if (merchandise[i].id === id) {
                        newVal = Math.min(Math.max(1, newVal), merchandise[i].stock);
                        break;
                    }
                }
                input.value = newVal;
            }
        }

        function addToCart(id) {
            var quantityInput = document.getElementById('qty-' + id);
            var quantity = quantityInput ? parseInt(quantityInput.value) : 1;
            var item = null;
            for (var i = 0; i < merchandise.length; i++) {
                if (merchandise[i].id === id) {
                    item = merchandise[i];
                    break;
                }
            }
            
            if (item && item.stock >= quantity) {
                var existingItem = null;
                for (var j = 0; j < cart.length; j++) {
                    if (cart[j].id === id) {
                        existingItem = cart[j];
                        break;
                    }
                }
                if (existingItem) {
                    existingItem.quantity += quantity;
                } else {
                    cart.push({ id: item.id, name: item.name, price: item.price, image: item.image, quantity: quantity });
                }
                updateCartCount();
                updateCartDisplay();
                saveData();
                showNotification(item.name + ' added to cart!');
            } else if (item) {
                showNotification('Not enough stock for ' + item.name);
            }
        }

        function updateCartCount() {
            var totalItems = 0;
            for (var i = 0; i < cart.length; i++) {
                totalItems += cart[i].quantity;
            }
            document.getElementById('cartCount').innerText = totalItems;
        }

        function updateCartDisplay() {
            var cartContainer = document.getElementById('cartItems');
            if (!cartContainer) return;
            
            if (cart.length === 0) {
                cartContainer.innerHTML = '<p style="text-align:center;"><i class="fas fa-shopping-cart"></i><br>Your cart is empty</p>';
                document.getElementById('cartSubtotal').innerText = '0';
                document.getElementById('shippingCost').innerText = '0';
                document.getElementById('cartTotal').innerText = '0';
                return;
            }
            
            var html = '';
            for (var i = 0; i < cart.length; i++) {
                var item = cart[i];
                html += '<div class="cart-item">';
                html += '<img src="' + item.image + '" alt="' + item.name + '" class="cart-item-img">';
                html += '<div class="cart-item-details">';
                html += '<div class="cart-item-title">' + item.name + '</div>';
                html += '<div class="cart-item-price">' + item.price.toLocaleString() + '</div>';
                html += '<div class="cart-item-quantity">';
                html += '<button onclick="updateCartQuantity(' + i + ', -1)">-</button>';
                html += '<span>' + item.quantity + '</span>';
                html += '<button onclick="updateCartQuantity(' + i + ', 1)">+</button>';
                html += '<button onclick="removeFromCart(' + i + ')" style="margin-left: auto; background: none; border: none; color: #ff4444;"><i class="fas fa-trash"></i></button>';
                html += '</div></div></div>';
            }
            cartContainer.innerHTML = html;
            
            var subtotal = 0;
            for (var i = 0; i < cart.length; i++) {
                subtotal += cart[i].price * cart[i].quantity;
            }
            var shipping = subtotal > 999 ? 0 : 99;
            var total = subtotal + shipping;
            
            document.getElementById('cartSubtotal').innerText = subtotal.toLocaleString();
            document.getElementById('shippingCost').innerText = shipping === 0 ? 'Free' : '' + shipping;
            document.getElementById('cartTotal').innerText = total.toLocaleString();
        }

        function updateCartQuantity(index, delta) {
            var newQty = cart[index].quantity + delta;
            var itemStock = 0;
            for (var i = 0; i < merchandise.length; i++) {
                if (merchandise[i].id === cart[index].id) {
                    itemStock = merchandise[i].stock;
                    break;
                }
            }
            
            if (newQty > 0 && newQty <= itemStock) {
                cart[index].quantity = newQty;
                updateCartCount();
                updateCartDisplay();
                saveData();
            } else if (newQty > itemStock) {
                showNotification('Only ' + itemStock + ' items available!');
            } else if (newQty === 0) {
                removeFromCart(index);
            }
        }

        function removeFromCart(index) {
            cart.splice(index, 1);
            updateCartCount();
            updateCartDisplay();
            saveData();
            showNotification('Removed from cart');
        }

        function clearCart() {
            if (cart.length > 0) {
                cart = [];
                updateCartCount();
                updateCartDisplay();
                saveData();
                showNotification('Cart cleared!');
            }
        }

        function toggleWishlistItem(id) {
            var exists = false;
            for (var i = 0; i < wishlist.length; i++) {
                if (wishlist[i].id === id) {
                    exists = true;
                    wishlist.splice(i, 1);
                    break;
                }
            }
            if (!exists) {
                var item = null;
                for (var i = 0; i < merchandise.length; i++) {
                    if (merchandise[i].id === id) {
                        item = merchandise[i];
                        break;
                    }
                }
                if (item) {
                    wishlist.push({ id: item.id, name: item.name, price: item.price, image: item.image });
                }
            }
            updateWishlistDisplay();
            renderMerchandise();
            saveData();
            showNotification(exists ? 'Removed from wishlist' : 'Added to wishlist');
        }

        function updateWishlistDisplay() {
            var wishlistContainer = document.getElementById('wishlistItems');
            if (!wishlistContainer) return;
            
            if (wishlist.length === 0) {
                wishlistContainer.innerHTML = '<p style="text-align:center;"><i class="fas fa-heart"></i><br>Your wishlist is empty</p>';
                return;
            }
            
            var html = '';
            for (var i = 0; i < wishlist.length; i++) {
                var item = wishlist[i];
                html += '<div class="cart-item">';
                html += '<img src="' + item.image + '" alt="' + item.name + '" class="cart-item-img">';
                html += '<div class="cart-item-details">';
                html += '<div class="cart-item-title">' + item.name + '</div>';
                html += '<div class="cart-item-price">' + item.price.toLocaleString() + '</div>';
                html += '<button onclick="toggleWishlistItem(' + item.id + ')" style="background: none; border: none; color: #ff4444; cursor: pointer; margin-top: 5px;">Remove</button>';
                html += '</div></div>';
            }
            wishlistContainer.innerHTML = html;
        }

        function toggleCart() {
            var cartSidebar = document.getElementById('cartSidebar');
            if (cartSidebar) cartSidebar.classList.toggle('open');
        }

        function toggleWishlist() {
            var wishlistSidebar = document.getElementById('wishlistSidebar');
            if (wishlistSidebar) wishlistSidebar.classList.toggle('open');
        }

        function checkout() {
            if (cart.length === 0) {
                showNotification('Your cart is empty!');
                return;
            }
            var total = 0;
            for (var i = 0; i < cart.length; i++) {
                total += cart[i].price * cart[i].quantity;
            }
            var shipping = total > 999 ? 0 : 99;
            total += shipping;
            alert('Thank you for your purchase! Total: ' + total.toLocaleString() + '\nYour Demon Slayer merchandise will be delivered soon!');
            cart = [];
            updateCartCount();
            updateCartDisplay();
            saveData();
            toggleCart();
        }

        function showNotification(message) {
            var notification = document.createElement('div');
            notification.className = 'toast-notification';
            notification.innerHTML = '<i class="fas fa-bell"></i> ' + message;
            document.body.appendChild(notification);
            setTimeout(function() { notification.remove(); }, 3000);
        }

        document.addEventListener('DOMContentLoaded', function() {
            loadSavedData();
            renderMerchandise();
            
            var catBtns = document.querySelectorAll('.cat-btn');
            for (var i = 0; i < catBtns.length; i++) {
                catBtns[i].addEventListener('click', function() {
                    for (var j = 0; j < catBtns.length; j++) {
                        catBtns[j].classList.remove('active');
                    }
                    this.classList.add('active');
                    currentCategory = this.getAttribute('data-category');
                    renderMerchandise();
                });
            }
            
            document.getElementById('applyPriceFilter').addEventListener('click', function() {
                var min = parseInt(document.getElementById('minPrice').value);
                var max = parseInt(document.getElementById('maxPrice').value);
                if (!isNaN(min)) currentMinPrice = min;
                if (!isNaN(max)) currentMaxPrice = max;
                renderMerchandise();
            });
            
            document.getElementById('sortBy').addEventListener('change', function() {
                currentSort = this.value;
                renderMerchandise();
            });
        });
    </script>
</body>
</html>
