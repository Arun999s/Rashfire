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
        /* Additional Store-Specific Styles */
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
        
        .merch-card {
            position: relative;
            animation: fadeInUp 0.5s ease;
        }
        
        .stock-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.8);
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
        
        .discount-badge {
            background: #ff4444;
            padding: 0.2rem 0.5rem;
            border-radius: 20px;
            font-size: 0.7rem;
            margin-left: 10px;
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
            width: 25px;
            height: 25px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }
        
        .quantity-selector input {
            width: 50px;
            text-align: center;
            background: var(--dark);
            border: none;
            color: white;
            padding: 0.2rem;
            border-radius: 5px;
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
            padding: 0.5rem;
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
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        
        .add-to-cart:active {
            animation: pulse 0.2s ease;
        }
        
        @media (max-width: 768px) {
            .cart-sidebar {
                width: 100%;
                right: -100%;
            }
            
            .filter-group {
                flex-direction: column;
            }
            
            .price-filter {
                margin-left: 0;
            }
        }
        
        .wishlist-btn {
            background: none;
            border: none;
            color: #ff4444;
            cursor: pointer;
            font-size: 1.2rem;
            transition: transform 0.2s;
        }
        
        .wishlist-btn:hover {
            transform: scale(1.1);
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
            <!-- Store Hero Section -->
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

            <!-- Filter Section -->
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
                        <button id="applyPriceFilter" class="btn-primary" style="padding: 0.3rem 1rem;">Apply</button>
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

            <!-- Merchandise Grid -->
            <div class="merch-grid" id="merchGrid">
                <!-- Merchandise loaded via JavaScript -->
            </div>
        </div>
    </main>

    <!-- Cart Sidebar -->
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

    <!-- Wishlist Sidebar -->
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
                <ul>
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
            <p>&copy; 2026 Rashfire  - Demon Slayer Store | All rights reserved | Demon Slacer &copy; Koyoharu Gotouge / Shueisha, Aniplex, ufotable</p>
        </div>
    </footer>

    <script>
        // Enhanced Real-time Merchandise Data with Stock, Ratings, and Discounts
        const merchandise = [
            { 
                id: 1, 
                name: "Tanjiro Kamado DX Figure - Hinokami Kagura Ver.", 
                price: 3499, 
                originalPrice: 4999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300",
                rating: 4.9,
                reviews: 234,
                stock: 45,
                discount: 30,
                limited: false,
                brand: "Bandai"
            },
            { 
                id: 2, 
                name: "Nezuko Kimono Plush - 12 inch", 
                price: 1499, 
                originalPrice: 1999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300",
                rating: 4.8,
                reviews: 567,
                stock: 12,
                discount: 25,
                limited: false,
                brand: "GoodSmile"
            },
            { 
                id: 3, 
                name: "Demon Sl Corps Hoodie - Embroidered Edition", 
                price: 2499, 
                originalPrice: 3999,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300",
                rating: 4.7,
                reviews: 189,
                stock: 28,
                discount: 37,
                limited: false,
                sizes: ["S", "M", "L", "XL", "XXL"]
            },
            { 
                id: 4, 
                name: "Zenitsu Agatsuma Thunder Breathing Necklace", 
                price: 999, 
                originalPrice: 1499,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300",
                rating: 4.6,
                reviews: 892,
                stock: 78,
                discount: 33,
                limited: false,
                brand: "Tamashii Nations"
            },
            { 
                id: 5, 
                name: "Kyojuro Rengoku Flaming Poster Set (3 pcs)", 
                price: 799, 
                originalPrice: 1299,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300",
                rating: 4.9,
                reviews: 445,
                stock: 156,
                discount: 38,
                limited: false
            },
            { 
                id: 6, 
                name: "Hashira Meeting T-Shirt - Premium Cotton", 
                price: 1799, 
                originalPrice: 2499,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300",
                rating: 4.5,
                reviews: 234,
                stock: 92,
                discount: 28,
                limited: false,
                sizes: ["S", "M", "L", "XL"]
            },
            { 
                id: 7, 
                name: "Nichirin Blade Replica - Tanjiro (Metal)", 
                price: 8999, 
                originalPrice: 12999,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300",
                rating: 4.9,
                reviews: 67,
                stock: 3,
                discount: 30,
                limited: true,
                brand: "MiniKatana"
            },
            { 
                id: 8, 
                name: "Muzan Kibutsuji Wall Scroll - Limited", 
                price: 1299, 
                originalPrice: 1999,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300",
                rating: 4.4,
                reviews: 123,
                stock: 0,
                discount: 35,
                limited: true
            },
            { 
                id: 9, 
                name: "Giyu Tomioka Water Breathing Figuarts", 
                price: 3999, 
                originalPrice: 5999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300",
                rating: 4.8,
                reviews: 178,
                stock: 15,
                discount: 33,
                limited: false,
                brand: "SH Figuarts"
            },
            { 
                id: 10, 
                name: "Demon Slayer Face Mask Set (6 Designs)", 
                price: 599, 
                originalPrice: 999,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300",
                rating: 4.3,
                reviews: 1234,
                stock: 200,
                discount: 40,
                limited: false
            },
            { 
                id: 11, 
                name: "Shinobu Kocho Butterfly Jacket", 
                price: 3999, 
                originalPrice: 5999,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300",
                rating: 4.7,
                reviews: 89,
                stock: 7,
                discount: 33,
                limited: true,
                sizes: ["M", "L", "XL"]
            },
            { 
                id: 12, 
                name: "Entertainment District Arc Art Book", 
                price: 2499, 
                originalPrice: 3499,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300",
                rating: 4.9,
                reviews: 456,
                stock: 34,
                discount: 28,
                limited: false
            },
            { 
                id: 13, 
                name: "Inosuke Beast Breathing Keychain", 
                price: 449, 
                originalPrice: 699,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300",
                rating: 4.6,
                reviews: 789,
                stock: 150,
                discount: 35,
                limited: false
            },
            { 
                id: 14, 
                name: "Kokushibo Upper Moon One Statue", 
                price: 7999, 
                originalPrice: 11999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300",
                rating: 4.8,
                reviews: 45,
                stock: 2,
                discount: 33,
                limited: true,
                brand: "Prime 1 Studio"
            },
            { 
                id: 15, 
                name: "Hashira Collection Poster Set (9 posters)", 
                price: 1999, 
                originalPrice: 2999,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300",
                rating: 4.9,
                reviews: 234,
                stock: 56,
                discount: 33,
                limited: false
            }
        ];

        let cart = [];
        let wishlist = [];
        let currentCategory = 'all';
        let currentMinPrice = 0;
        let currentMaxPrice = 50000;
        let currentSort = 'default';

        // Load cart and wishlist from localStorage
        function loadSavedData() {
            const savedCart = localStorage.getItem('rashfire_cart');
            const savedWishlist = localStorage.getItem('rashfire_wishlist');
            if (savedCart) cart = JSON.parse(savedCart);
            if (savedWishlist) wishlist = JSON.parse(savedWishlist);
            updateCartCount();
            updateCartDisplay();
            updateWishlistDisplay();
        }

        // Save data to localStorage
        function saveData() {
            localStorage.setItem('rashfire_cart', JSON.stringify(cart));
            localStorage.setItem('rashfire_wishlist', JSON.stringify(wishlist));
        }

        // Get stock status
        function getStockStatus(stock) {
            if (stock <= 0) return { class: 'out-of-stock', text: ' Out of Stock' };
            if (stock < 10) return { class: 'low-stock', text: ` Only ${stock} left!` };
            return { class: 'in-stock', text: ' In Stock' };
        }

        // Render merchandise with real-time data
        function renderMerchandise() {
            const container = document.getElementById('merchGrid');
            if (!container) return;
            
            let filtered = merchandise.filter(item => {
                const matchesCategory = currentCategory === 'all' || item.category === currentCategory || (currentCategory === 'limited' && item.limited);
                const matchesPrice = item.price >= currentMinPrice && item.price <= currentMaxPrice;
                return matchesCategory && matchesPrice;
            });
            
            // Apply sorting
            switch(currentSort) {
                case 'price-asc':
                    filtered.sort((a, b) => a.price - b.price);
                    break;
                case 'price-desc':
                    filtered.sort((a, b) => b.price - a.price);
                    break;
                case 'rating':
                    filtered.sort((a, b) => b.rating - a.rating);
                    break;
                case 'discount':
                    filtered.sort((a, b) => b.discount - a.discount);
                    break;
                default:
                    filtered.sort((a, b) => a.id - b.id);
            }
            
            document.getElementById('totalProducts').innerText = filtered.length;
            
            if (filtered.length === 0) {
                container.innerHTML = `
                    <div style="grid-column: 1/-1; text-align: center; padding: 4rem;">
                        <i class="fas fa-box-open" style="font-size: 4rem; color: var(--primary);"></i>
                        <h3>No products found</h3>
                        <p>Try adjusting your filters</p>
                    </div>
                `;
                return;
            }
            
            container.innerHTML = filtered.map(item => {
                const stockStatus = getStockStatus(item.stock);
                const savings = item.originalPrice - item.price;
                const isInWishlist = wishlist.some(w => w.id === item.id);
                
                return `
                    <div class="merch-card" data-id="${item.id}">
                        <div class="stock-badge ${stockStatus.class}">${stockStatus.text}</div>
                        ${item.discount > 0 ? `<div class="discount-badge">-${item.discount}%</div>` : ''}
                        <img src="${item.image}" alt="${item.name}" class="merch-image">
                        <div class="merch-info">
                            <div style="display: flex; justify-content: space-between; align-items: start;">
                                <h3 style="flex:1; font-size: 1rem;">${item.name}</h3>
                                <button class="wishlist-btn" onclick="toggleWishlistItem(${item.id})" title="Add to wishlist">
                                    <i class="fas fa-heart" style="color: ${isInWishlist ? '#ff4444' : '#888'}"></i>
                                </button>
                            </div>
                            <div class="rating">
                                ${''.repeat(Math.floor(item.rating))}${item.rating % 1 >= 0.5 ? '' : ''}${''.repeat(5 - Math.ceil(item.rating))}
                                <span>(${item.reviews} reviews)</span>
                            </div>
                            <div>
                                ${item.originalPrice > item.price ? `<span class="original-price">${item.originalPrice.toLocaleString()}</span>` : ''}
                                <span class="merch-price">${item.price.toLocaleString()}</span>
                            </div>
                            ${savings > 0 ? `<small style="color: #4CAF50;">Save ${savings.toLocaleString()}</small>` : ''}
                            
                            <div class="quantity-selector">
                                <button onclick="changeQuantity(${item.id}, -1)"><i class="fas fa-minus"></i></button>
                                <input type="number" id="qty-${item.id}" value="1" min="1" max="${item.stock}" ${item.stock === 0 ? 'disabled' : ''}>
                                <button onclick="changeQuantity(${item.id}, 1)" ${item.stock === 0 ? 'disabled' : ''}><i class="fas fa-plus"></i></button>
                            </div>
                            
                            <button class="add-to-cart" onclick="addToCart(${item.id})" ${item.stock === 0 ? 'disabled style="opacity:0.5;"' : ''}>
                                <i class="fas fa-cart-plus"></i> ${item.stock === 0 ? 'Out of Stock' : 'Add to Cart'}
                            </button>
                        </div>
                    </div>
                `;
            }).join('');
        }

        function changeQuantity(id, delta) {
            const input = document.getElementById(`qty-${id}`);
            if (input) {
                let newVal = parseInt(input.value) + delta;
                const item = merchandise.find(m => m.id === id);
                if (item) {
                    newVal = Math.min(Math.max(1, newVal), item.stock);
                    input.value = newVal;
                }
            }
        }

        function addToCart(id) {
            const quantityInput = document.getElementById(`qty-${id}`);
            const quantity = quantityInput ? parseInt(quantityInput.value) : 1;
            const item = merchandise.find(m => m.id === id);
            
            if (item && item.stock >= quantity) {
                const existingItem = cart.find(c => c.id === id);
                if (existingItem) {
                    existingItem.quantity += quantity;
                } else {
                    cart.push({ ...item, quantity: quantity });
                }
                updateCartCount();
                updateCartDisplay();
                saveData();
                showNotification(` ${item.name} added to cart!`, 'success');
            } else {
                showNotification(` Not enough stock for ${item.name}`, 'error');
            }
        }

        function updateCartCount() {
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
            document.getElementById('cartCount').innerText = totalItems;
        }

        function updateCartDisplay() {
            const cartContainer = document.getElementById('cartItems');
            if (!cartContainer) return;
            
            if (cart.length === 0) {
                cartContainer.innerHTML = '<p style="text-align:center;"><i class="fas fa-shopping-cart"></i><br>Your cart is empty</p>';
                document.getElementById('cartSubtotal').innerText = '0';
                document.getElementById('shippingCost').innerText = '0';
                document.getElementById('cartTotal').innerText = '0';
                return;
            }
            
            cartContainer.innerHTML = cart.map((item, index) => `
                <div class="cart-item">
                    <img src="${item.image}" alt="${item.name}" class="cart-item-img">
                    <div class="cart-item-details">
                        <div class="cart-item-title">${item.name}</div>
                        <div class="cart-item-price">${item.price.toLocaleString()}</div>
                        <div class="cart-item-quantity">
                            <button onclick="updateCartQuantity(${index}, -1)">-</button>
                            <span>${item.quantity}</span>
                            <button onclick="updateCartQuantity(${index}, 1)">+</button>
                            <button onclick="removeFromCart(${index})" style="margin-left: auto; background: none; border: none; color: #ff4444;">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');
            
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            const shipping = subtotal > 999 ? 0 : 99;
            const total = subtotal + shipping;
            
            document.getElementById('cartSubtotal').innerText = subtotal.toLocaleString();
            document.getElementById('shippingCost').innerText = shipping === 0 ? 'Free' : `${shipping}`;
            document.getElementById('cartTotal').innerText = total.toLocaleString();
        }

        function updateCartQuantity(index, delta) {
            const newQty = cart[index].quantity + delta;
            const item = merchandise.find(m => m.id === cart[index].id);
            
            if (newQty > 0 && newQty <= item.stock) {
                cart[index].quantity = newQty;
                updateCartCount();
                updateCartDisplay();
                saveData();
            } else if (newQty > item.stock) {
                showNotification(`Only ${item.stock} items available!`, 'error');
            } else if (newQty === 0) {
                removeFromCart(index);
            }
        }

        function removeFromCart(index) {
            const removedItem = cart[index];
            cart.splice(index, 1);
            updateCartCount();
            updateCartDisplay();
            saveData();
            showNotification(` Removed from cart`, 'info');
        }

        function clearCart() {<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        /* Additional Store-Specific Styles */
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
        
        .merch-card {
            position: relative;
            animation: fadeInUp 0.5s ease;
        }
        
        .stock-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            background: rgba(0,0,0,0.8);
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
        
        .discount-badge {
            background: #ff4444;
            padding: 0.2rem 0.5rem;
            border-radius: 20px;
            font-size: 0.7rem;
            margin-left: 10px;
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
            width: 25px;
            height: 25px;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }
        
        .quantity-selector input {
            width: 50px;
            text-align: center;
            background: var(--dark);
            border: none;
            color: white;
            padding: 0.2rem;
            border-radius: 5px;
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
            padding: 0.5rem;
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
            width: 18px;
            height: 18px;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }
        
        .add-to-cart:active {
            animation: pulse 0.2s ease;
        }
        
        @media (max-width: 768px) {
            .cart-sidebar {
                width: 100%;
                right: -100%;
            }
            
            .filter-group {
                flex-direction: column;
            }
            
            .price-filter {
                margin-left: 0;
            }
        }
        
        .wishlist-btn {
            background: none;
            border: none;
            color: #ff4444;
            cursor: pointer;
            font-size: 1.2rem;
            transition: transform 0.2s;
        }
        
        .wishlist-btn:hover {
            transform: scale(1.1);
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
            <!-- Store Hero Section -->
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

            <!-- Filter Section -->
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
                        <button id="applyPriceFilter" class="btn-primary" style="padding: 0.3rem 1rem;">Apply</button>
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

            <!-- Merchandise Grid -->
            <div class="merch-grid" id="merchGrid">
                <!-- Merchandise loaded via JavaScript -->
            </div>
        </div>
    </main>

    <!-- Cart Sidebar -->
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

    <!-- Wishlist Sidebar -->
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
                <ul>
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
            <p>&copy; 2026 Rashfire  - Demon Slayer Store | All rights reserved | Demon Slacer &copy; Koyoharu Gotouge / Shueisha, Aniplex, ufotable</p>
        </div>
    </footer>

    <script>
        // Enhanced Real-time Merchandise Data with Stock, Ratings, and Discounts
        const merchandise = [
            { 
                id: 1, 
                name: "Tanjiro Kamado DX Figure - Hinokami Kagura Ver.", 
                price: 3499, 
                originalPrice: 4999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300",
                rating: 4.9,
                reviews: 234,
                stock: 45,
                discount: 30,
                limited: false,
                brand: "Bandai"
            },
            { 
                id: 2, 
                name: "Nezuko Kimono Plush - 12 inch", 
                price: 1499, 
                originalPrice: 1999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300",
                rating: 4.8,
                reviews: 567,
                stock: 12,
                discount: 25,
                limited: false,
                brand: "GoodSmile"
            },
            { 
                id: 3, 
                name: "Demon Sl Corps Hoodie - Embroidered Edition", 
                price: 2499, 
                originalPrice: 3999,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300",
                rating: 4.7,
                reviews: 189,
                stock: 28,
                discount: 37,
                limited: false,
                sizes: ["S", "M", "L", "XL", "XXL"]
            },
            { 
                id: 4, 
                name: "Zenitsu Agatsuma Thunder Breathing Necklace", 
                price: 999, 
                originalPrice: 1499,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300",
                rating: 4.6,
                reviews: 892,
                stock: 78,
                discount: 33,
                limited: false,
                brand: "Tamashii Nations"
            },
            { 
                id: 5, 
                name: "Kyojuro Rengoku Flaming Poster Set (3 pcs)", 
                price: 799, 
                originalPrice: 1299,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300",
                rating: 4.9,
                reviews: 445,
                stock: 156,
                discount: 38,
                limited: false
            },
            { 
                id: 6, 
                name: "Hashira Meeting T-Shirt - Premium Cotton", 
                price: 1799, 
                originalPrice: 2499,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300",
                rating: 4.5,
                reviews: 234,
                stock: 92,
                discount: 28,
                limited: false,
                sizes: ["S", "M", "L", "XL"]
            },
            { 
                id: 7, 
                name: "Nichirin Blade Replica - Tanjiro (Metal)", 
                price: 8999, 
                originalPrice: 12999,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300",
                rating: 4.9,
                reviews: 67,
                stock: 3,
                discount: 30,
                limited: true,
                brand: "MiniKatana"
            },
            { 
                id: 8, 
                name: "Muzan Kibutsuji Wall Scroll - Limited", 
                price: 1299, 
                originalPrice: 1999,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300",
                rating: 4.4,
                reviews: 123,
                stock: 0,
                discount: 35,
                limited: true
            },
            { 
                id: 9, 
                name: "Giyu Tomioka Water Breathing Figuarts", 
                price: 3999, 
                originalPrice: 5999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300",
                rating: 4.8,
                reviews: 178,
                stock: 15,
                discount: 33,
                limited: false,
                brand: "SH Figuarts"
            },
            { 
                id: 10, 
                name: "Demon Slayer Face Mask Set (6 Designs)", 
                price: 599, 
                originalPrice: 999,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300",
                rating: 4.3,
                reviews: 1234,
                stock: 200,
                discount: 40,
                limited: false
            },
            { 
                id: 11, 
                name: "Shinobu Kocho Butterfly Jacket", 
                price: 3999, 
                originalPrice: 5999,
                category: "apparel", 
                image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300",
                rating: 4.7,
                reviews: 89,
                stock: 7,
                discount: 33,
                limited: true,
                sizes: ["M", "L", "XL"]
            },
            { 
                id: 12, 
                name: "Entertainment District Arc Art Book", 
                price: 2499, 
                originalPrice: 3499,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300",
                rating: 4.9,
                reviews: 456,
                stock: 34,
                discount: 28,
                limited: false
            },
            { 
                id: 13, 
                name: "Inosuke Beast Breathing Keychain", 
                price: 449, 
                originalPrice: 699,
                category: "accessories", 
                image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300",
                rating: 4.6,
                reviews: 789,
                stock: 150,
                discount: 35,
                limited: false
            },
            { 
                id: 14, 
                name: "Kokushibo Upper Moon One Statue", 
                price: 7999, 
                originalPrice: 11999,
                category: "figures", 
                image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300",
                rating: 4.8,
                reviews: 45,
                stock: 2,
                discount: 33,
                limited: true,
                brand: "Prime 1 Studio"
            },
            { 
                id: 15, 
                name: "Hashira Collection Poster Set (9 posters)", 
                price: 1999, 
                originalPrice: 2999,
                category: "posters", 
                image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300",
                rating: 4.9,
                reviews: 234,
                stock: 56,
                discount: 33,
                limited: false
            }
        ];

        let cart = [];
        let wishlist = [];
        let currentCategory = 'all';
        let currentMinPrice = 0;
        let currentMaxPrice = 50000;
        let currentSort = 'default';

        // Load cart and wishlist from localStorage
        function loadSavedData() {
            const savedCart = localStorage.getItem('rashfire_cart');
            const savedWishlist = localStorage.getItem('rashfire_wishlist');
            if (savedCart) cart = JSON.parse(savedCart);
            if (savedWishlist) wishlist = JSON.parse(savedWishlist);
            updateCartCount();
            updateCartDisplay();
            updateWishlistDisplay();
        }

        // Save data to localStorage
        function saveData() {
            localStorage.setItem('rashfire_cart', JSON.stringify(cart));
            localStorage.setItem('rashfire_wishlist', JSON.stringify(wishlist));
        }

        // Get stock status
        function getStockStatus(stock) {
            if (stock <= 0) return { class: 'out-of-stock', text: ' Out of Stock' };
            if (stock < 10) return { class: 'low-stock', text: ` Only ${stock} left!` };
            return { class: 'in-stock', text: ' In Stock' };
        }

        // Render merchandise with real-time data
        function renderMerchandise() {
            const container = document.getElementById('merchGrid');
            if (!container) return;
            
            let filtered = merchandise.filter(item => {
                const matchesCategory = currentCategory === 'all' || item.category === currentCategory || (currentCategory === 'limited' && item.limited);
                const matchesPrice = item.price >= currentMinPrice && item.price <= currentMaxPrice;
                return matchesCategory && matchesPrice;
            });
            
            // Apply sorting
            switch(currentSort) {
                case 'price-asc':
                    filtered.sort((a, b) => a.price - b.price);
                    break;
                case 'price-desc':
                    filtered.sort((a, b) => b.price - a.price);
                    break;
                case 'rating':
                    filtered.sort((a, b) => b.rating - a.rating);
                    break;
                case 'discount':
                    filtered.sort((a, b) => b.discount - a.discount);
                    break;
                default:
                    filtered.sort((a, b) => a.id - b.id);
            }
            
            document.getElementById('totalProducts').innerText = filtered.length;
            
            if (filtered.length === 0) {
                container.innerHTML = `
                    <div style="grid-column: 1/-1; text-align: center; padding: 4rem;">
                        <i class="fas fa-box-open" style="font-size: 4rem; color: var(--primary);"></i>
                        <h3>No products found</h3>
                        <p>Try adjusting your filters</p>
                    </div>
                `;
                return;
            }
            
            container.innerHTML = filtered.map(item => {
                const stockStatus = getStockStatus(item.stock);
                const savings = item.originalPrice - item.price;
                const isInWishlist = wishlist.some(w => w.id === item.id);
                
                return `
                    <div class="merch-card" data-id="${item.id}">
                        <div class="stock-badge ${stockStatus.class}">${stockStatus.text}</div>
                        ${item.discount > 0 ? `<div class="discount-badge">-${item.discount}%</div>` : ''}
                        <img src="${item.image}" alt="${item.name}" class="merch-image">
                        <div class="merch-info">
                            <div style="display: flex; justify-content: space-between; align-items: start;">
                                <h3 style="flex:1; font-size: 1rem;">${item.name}</h3>
                                <button class="wishlist-btn" onclick="toggleWishlistItem(${item.id})" title="Add to wishlist">
                                    <i class="fas fa-heart" style="color: ${isInWishlist ? '#ff4444' : '#888'}"></i>
                                </button>
                            </div>
                            <div class="rating">
                                ${''.repeat(Math.floor(item.rating))}${item.rating % 1 >= 0.5 ? '' : ''}${''.repeat(5 - Math.ceil(item.rating))}
                                <span>(${item.reviews} reviews)</span>
                            </div>
                            <div>
                                ${item.originalPrice > item.price ? `<span class="original-price">${item.originalPrice.toLocaleString()}</span>` : ''}
                                <span class="merch-price">${item.price.toLocaleString()}</span>
                            </div>
                            ${savings > 0 ? `<small style="color: #4CAF50;">Save ${savings.toLocaleString()}</small>` : ''}
                            
                            <div class="quantity-selector">
                                <button onclick="changeQuantity(${item.id}, -1)"><i class="fas fa-minus"></i></button>
                                <input type="number" id="qty-${item.id}" value="1" min="1" max="${item.stock}" ${item.stock === 0 ? 'disabled' : ''}>
                                <button onclick="changeQuantity(${item.id}, 1)" ${item.stock === 0 ? 'disabled' : ''}><i class="fas fa-plus"></i></button>
                            </div>
                            
                            <button class="add-to-cart" onclick="addToCart(${item.id})" ${item.stock === 0 ? 'disabled style="opacity:0.5;"' : ''}>
                                <i class="fas fa-cart-plus"></i> ${item.stock === 0 ? 'Out of Stock' : 'Add to Cart'}
                            </button>
                        </div>
                    </div>
                `;
            }).join('');
        }

        function changeQuantity(id, delta) {
            const input = document.getElementById(`qty-${id}`);
            if (input) {
                let newVal = parseInt(input.value) + delta;
                const item = merchandise.find(m => m.id === id);
                if (item) {
                    newVal = Math.min(Math.max(1, newVal), item.stock);
                    input.value = newVal;
                }
            }
        }

        function addToCart(id) {
            const quantityInput = document.getElementById(`qty-${id}`);
            const quantity = quantityInput ? parseInt(quantityInput.value) : 1;
            const item = merchandise.find(m => m.id === id);
            
            if (item && item.stock >= quantity) {
                const existingItem = cart.find(c => c.id === id);
                if (existingItem) {
                    existingItem.quantity += quantity;
                } else {
                    cart.push({ ...item, quantity: quantity });
                }
                updateCartCount();
                updateCartDisplay();
                saveData();
                showNotification(` ${item.name} added to cart!`, 'success');
            } else {
                showNotification(` Not enough stock for ${item.name}`, 'error');
            }
        }

        function updateCartCount() {
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
            document.getElementById('cartCount').innerText = totalItems;
        }

        function updateCartDisplay() {
            const cartContainer = document.getElementById('cartItems');
            if (!cartContainer) return;
            
            if (cart.length === 0) {
                cartContainer.innerHTML = '<p style="text-align:center;"><i class="fas fa-shopping-cart"></i><br>Your cart is empty</p>';
                document.getElementById('cartSubtotal').innerText = '0';
                document.getElementById('shippingCost').innerText = '0';
                document.getElementById('cartTotal').innerText = '0';
                return;
            }
            
            cartContainer.innerHTML = cart.map((item, index) => `
                <div class="cart-item">
                    <img src="${item.image}" alt="${item.name}" class="cart-item-img">
                    <div class="cart-item-details">
                        <div class="cart-item-title">${item.name}</div>
                        <div class="cart-item-price">${item.price.toLocaleString()}</div>
                        <div class="cart-item-quantity">
                            <button onclick="updateCartQuantity(${index}, -1)">-</button>
                            <span>${item.quantity}</span>
                            <button onclick="updateCartQuantity(${index}, 1)">+</button>
                            <button onclick="removeFromCart(${index})" style="margin-left: auto; background: none; border: none; color: #ff4444;">
                                <i class="fas fa-trash"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');
            
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);
            const shipping = subtotal > 999 ? 0 : 99;
            const total = subtotal + shipping;
            
            document.getElementById('cartSubtotal').innerText = subtotal.toLocaleString();
            document.getElementById('shippingCost').innerText = shipping === 0 ? 'Free' : `${shipping}`;
            document.getElementById('cartTotal').innerText = total.toLocaleString();
        }

        function updateCartQuantity(index, delta) {
            const newQty = cart[index].quantity + delta;
            const item = merchandise.find(m => m.id === cart[index].id);
            
            if (newQty > 0 && newQty <= item.stock) {
                cart[index].quantity = newQty;
                updateCartCount();
                updateCartDisplay();
                saveData();
            } else if (newQty > item.stock) {
                showNotification(`Only ${item.stock} items available!`, 'error');
            } else if (newQty === 0) {
                removeFromCart(index);
            }
        }

        function removeFromCart(index) {
            const removedItem = cart[index];
            cart.splice(index, 1);
            updateCartCount();
            updateCartDisplay();
            saveData();
            showNotification(` Removed from cart`, 'info');
        }

        function clearCart() {
