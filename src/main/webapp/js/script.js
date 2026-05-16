// Data for All-Time Top 10 Anime (including Demon Slayer at #1)
const allTimeAnime = [
    { rank: 1, title: "Demon Slayer: Kimetsu no Yaiba", rating: 9.8, episodes: 55, image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", genre: "Action, Fantasy" },
    { rank: 2, title: "Fullmetal Alchemist: Brotherhood", rating: 9.7, episodes: 64, image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300", genre: "Action, Adventure" },
    { rank: 3, title: "Attack on Titan", rating: 9.6, episodes: 87, image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300", genre: "Dark Fantasy" },
    { rank: 4, title: "One Piece", rating: 9.5, episodes: 1000+, image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300", genre: "Adventure, Shonen" },
    { rank: 5, title: "Naruto: Shippuden", rating: 9.4, episodes: 500, image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300", genre: "Action, Ninja" },
    { rank: 6, title: "Death Note", rating: 9.4, episodes: 37, image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300", genre: "Psychological, Thriller" },
    { rank: 7, title: "Jujutsu Kaisen", rating: 9.3, episodes: 47, image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300", genre: "Action, Supernatural" },
    { rank: 8, title: "My Hero Academia", rating: 9.2, episodes: 138, image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300", genre: "Superhero, Shonen" },
    { rank: 9, title: "Hunter x Hunter", rating: 9.2, episodes: 148, image: "https://images.unsplash.com/photo-1578301978693-85fa9c0320b9?w=300", genre: "Adventure, Shonen" },
    { rank: 10, title: "Spy x Family", rating: 9.1, episodes: 37, image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", genre: "Comedy, Action" }
];

// Data for Current Top 10 (Spring 2026)
const currentAnime = [
    { rank: 1, title: "Witch Hat Atelier", rating: 9.4, episodes: 7, image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", genre: "Fantasy, Adventure" },
    { rank: 2, title: "Re:ZERO Season 4", rating: 9.3, episodes: 6, image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300", genre: "Dark Fantasy, Isekai" },
    { rank: 3, title: "MARRIAGETOXIN", rating: 9.2, episodes: 8, image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300", genre: "Action, Romance" },
    { rank: 4, title: "Wistoria: Wand and Sword S2", rating: 9.1, episodes: 5, image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300", genre: "Fantasy, Action" },
    { rank: 5, title: "I Made Friends with the Second Prettiest Girl", rating: 8.9, episodes: 9, image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300", genre: "Romance, Comedy" },
    { rank: 6, title: "The Ramparts of Ice", rating: 8.8, episodes: 7, image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300", genre: "Drama, Slice of Life" },
    { rank: 7, title: "The Angel Next Door S2", rating: 8.8, episodes: 6, image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300", genre: "Romance" },
    { rank: 8, title: "Daemons of the Shadow Realm", rating: 8.7, episodes: 8, image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300", genre: "Dark Fantasy" },
    { rank: 9, title: "Agents of the Four Seasons", rating: 8.6, episodes: 7, image: "https://images.unsplash.com/photo-1578301978693-85fa9c0320b9?w=300", genre: "Fantasy, Mystery" },
    { rank: 10, title: "Dr. STONE SCIENCE FUTURE P3", rating: 8.6, episodes: 5, image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300", genre: "Sci-Fi" }
];

// Merchandise Data
const merchandise = [
    { id: 1, name: "Tanjiro Kamado DX Figure", price: 3499, category: "figures", image: "https://images.unsplash.com/photo-1578632767115-351597cf2477?w=300" },
    { id: 2, name: "Nezuko Plush Toy", price: 1499, category: "figures", image: "https://images.unsplash.com/photo-1560972550-aba3456b5564?w=300" },
    { id: 3, name: "Demon Slayer Hoodie", price: 2499, category: "apparel", image: "https://images.unsplash.com/photo-1541562232579-426a1ccf7b3c?w=300" },
    { id: 4, name: "Zenitsu Necklace", price: 999, category: "accessories", image: "https://images.unsplash.com/photo-1556306535-0f09a537f0a3?w=300" },
    { id: 5, name: "Rengoku Poster Set", price: 799, category: "posters", image: "https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?w=300" },
    { id: 6, name: "Hashira T-Shirt", price: 1799, category: "apparel", image: "https://images.unsplash.com/photo-1580428182138-9b80fa2a83b9?w=300" },
    { id: 7, name: "Nichirin Sword Replica", price: 8999, category: "accessories", image: "https://images.unsplash.com/photo-1635805737707-575885ab0820?w=300" },
    { id: 8, name: "Muzan Wall Scroll", price: 1299, category: "posters", image: "https://images.unsplash.com/photo-1631175419962-a9ed1c6742bf?w=300" }
];

let cart = [];

// Initialize page based on current location
document.addEventListener('DOMContentLoaded', function() {
    const path = window.location.pathname;
    
    if (path.includes('alltime-top10')) {
        renderAllTimeAnime();
    } else if (path.includes('current-top10')) {
        renderCurrentAnime();
    } else if (path.includes('demon-slayer-store')) {
        renderMerchandise();
        initStoreEvents();
    } else if (path.includes('index') || path === '/' || path === '/rashfire/') {
        renderFeatured();
    }
});

function renderAllTimeAnime() {
    const container = document.getElementById('alltimeAnimeList');
    if (!container) return;
    
    container.innerHTML = allTimeAnime.map(anime => `
        <div class="anime-card" onclick="watchAnime('${anime.title}')">
            <img src="${anime.image}" alt="${anime.title}" class="anime-poster">
            <div class="anime-info">
                <span class="anime-rank">#${anime.rank}</span>
                <h3 class="anime-title">${anime.title}</h3>
                <p> ${anime.rating} |  ${anime.episodes} eps</p>
                <p> ${anime.genre}</p>
            </div>
        </div>
    `).join('');
}

function renderCurrentAnime() {
    const container = document.getElementById('currentAnimeList');
    if (!container) return;
    
    container.innerHTML = currentAnime.map(anime => `
        <div class="anime-card" onclick="watchAnime('${anime.title}')">
            <img src="${anime.image}" alt="${anime.title}" class="anime-poster">
            <div class="anime-info">
                <span class="anime-rank">#${anime.rank}</span>
                <h3 class="anime-title">${anime.title}</h3>
                <p> ${anime.rating} |  ${anime.episodes} eps</p>
                <p> ${anime.genre}</p>
                <span style="color: #FFD700;"> Trending Now</span>
            </div>
        </div>
    `).join('');
}

function renderFeatured() {
    const container = document.getElementById('featuredGrid');
    if (!container) return;
    
    const featured = [...currentAnime.slice(0, 4), ...allTimeAnime.slice(0, 2)];
    container.innerHTML = featured.map(anime => `
        <div class="anime-card" onclick="watchAnime('${anime.title}')">
            <img src="${anime.image}" alt="${anime.title}" class="anime-poster">
            <div class="anime-info">
                <h3 class="anime-title">${anime.title}</h3>
                <p> ${anime.rating}</p>
            </div>
        </div>
    `).join('');
}

function renderMerchandise(category = 'all') {
    const container = document.getElementById('merchGrid');
    if (!container) return;
    
    const filtered = category === 'all' ? merchandise : merchandise.filter(m => m.category === category);
    
    container.innerHTML = filtered.map(item => `
        <div class="merch-card">
            <img src="${item.image}" alt="${item.name}" class="merch-image">
            <div class="merch-info">
                <h3>${item.name}</h3>
                <p class="merch-price">${item.price}</p>
                <button class="add-to-cart" onclick="addToCart(${item.id})">
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </button>
            </div>
        </div>
    `).join('');
}

function initStoreEvents() {
    const buttons = document.querySelectorAll('.cat-btn');
    buttons.forEach(btn => {
        btn.addEventListener('click', function() {
            buttons.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            renderMerchandise(this.dataset.category);
        });
    });
}

function addToCart(id) {
    const item = merchandise.find(m => m.id === id);
    if (item) {
        cart.push(item);
        updateCart();
        showNotification(`${item.name} added to cart! `);
    }
}

function updateCart() {
    const cartContainer = document.getElementById('cartItems');
    const totalSpan = document.getElementById('cartTotal');
    
    if (cartContainer) {
        if (cart.length === 0) {
            cartContainer.innerHTML = '<p>Your cart is empty</p>';
        } else {
            cartContainer.innerHTML = cart.map((item, index) => `
                <div style="display: flex; justify-content: space-between; margin-bottom: 10px;">
                    <span>${item.name}</span>
                    <span>${item.price}</span>
                    <button onclick="removeFromCart(${index})" style="background: none; border: none; color: red; cursor: pointer;"></button>
                </div>
            `).join('');
        }
        
        const total = cart.reduce((sum, item) => sum + item.price, 0);
        if (totalSpan) totalSpan.innerText = total;
    }
}

function removeFromCart(index) {
    cart.splice(index, 1);
    updateCart();
}

function checkout() {
    if (cart.length === 0) {
        showNotification('Your cart is empty! ');
        return;
    }
    alert(`Thank you for your purchase! Total: ${cart.reduce((s,i)=>s+i.price,0)}\nYour Demon Slayer merchandise will be delivered soon! `);
    cart = [];
    updateCart();
}

function watchAnime(title) {
    sessionStorage.setItem('watchingAnime', title);
    window.location.href = 'watch.jsp';
}

function simulatePlayback() {
    const titleSpan = document.getElementById('animeTitle');
    const title = sessionStorage.getItem('watchingAnime') || 'Demon Slayer';
    if (titleSpan) titleSpan.innerText = title;
    showNotification(`Now streaming: ${title}!  Enjoy your binge session!`);
}

function showNotification(message) {
    const notification = document.createElement('div');
    notification.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: var(--primary);
        color: white;
        padding: 1rem 2rem;
        border-radius: 50px;
        z-index: 10000;
        animation: slideIn 0.3s ease;
    `;
    notification.innerText = message;
    document.body.appendChild(notification);
    setTimeout(() => notification.remove(), 3000);
}

// Search functionality
const searchInput = document.getElementById('searchInput');
if (searchInput) {
    searchInput.addEventListener('input', function(e) {
        const query = e.target.value.toLowerCase();
        const allAnime = [...allTimeAnime, ...currentAnime];
        const results = allAnime.filter(a => a.title.toLowerCase().includes(query));
        
        if (query.length > 0 && results.length > 0) {
            showNotification(`Found ${results.length} results for "${query}"`);
        }
    });
}

// Cart toggle
function toggleCart() {
    const cart = document.getElementById('cartSidebar');
    if (cart) cart.classList.toggle('open');
}

// CSS animation
const style = document.createElement('style');
style.textContent = `
    @keyframes slideIn {
        from {
            transform: translateX(100%);
            opacity: 0;
        }
        to {
            transform: translateX(0);
            opacity: 1;
        }
    }
`;
document.head.appendChild(style); 
