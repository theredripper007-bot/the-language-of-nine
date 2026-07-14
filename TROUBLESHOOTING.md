# Troubleshooting — Products / Cards / Carousel

## Good news

The **folder structure and relative links are correct**:

```
number-medicine/
├── index.html
├── products/
│   ├── index.html
│   ├── meditation_cards.html
│   ├── social_carousel.html
│   └── ...
├── artworks/
└── system/
```

Links from the homepage:

- `products/index.html`
- `products/meditation_cards.html`
- `products/social_carousel.html`

Verified with a local HTTP server: all return **200**.

---

## Most common issue: `file://` instead of `http://`

If the address bar looks like:

```
file:///Users/.../number-medicine/index.html
```

some browsers limit navigation, modules, or caching in odd ways—especially with large JS and overlays.

### Fix — run a local server from the project root

```bash
cd number-medicine
./serve.sh
```

Or:

```bash
cd number-medicine
python3 -m http.server 8765
```

Then open:

| Page | URL |
|------|-----|
| Home | http://127.0.0.1:8765/ |
| Products | http://127.0.0.1:8765/products/ |
| Cards | http://127.0.0.1:8765/products/meditation_cards.html |
| Carousel | http://127.0.0.1:8765/products/social_carousel.html |

**Do not open only a nested file path as the “site root.”**  
The server working directory must be the folder that **contains** `index.html` and `products/`.

---

## Cinema overlay on the homepage

The homepage opens with a full-screen **cinema gate**.

1. Click **Enter** (or scroll) once.  
2. After that, top links **Products / Cards / Carousel** should navigate away.  
3. If the gate never dismisses, press **F12 → Console** and note any red errors.

The gate now fully disables click interception after enter (`display: none` after fade).

---

## GitHub Pages project site

If the site is:

```
https://USERNAME.github.io/number-medicine/
```

set at the top of the main script (already supported):

```js
window.SITE_BASE = '/number-medicine/';
```

For a root user site (`username.github.io`) leave:

```js
window.SITE_BASE = '';
```

---

## Capitalization

Linux and GitHub Pages are case-sensitive. Filenames must match exactly:

- `meditation_cards.html`  
- `social_carousel.html`  
- `index.html`  

Not `Meditation_Cards.html`, etc.

---

## If a product page is blank

1. Open the product URL **directly** (from table above).  
2. F12 → **Console** for `Uncaught …`  
3. F12 → **Network** for **404** on images (`../artworks/0x_….jpg`)  
4. Confirm images exist under `artworks/` and paths in the product JS use `../artworks/...`

---

## Quick health check

| Check | Expected |
|-------|----------|
| `index.html` at root | Yes |
| `products/*.html` exist | Yes |
| `artworks/01_LOVE.jpg` … `09_…` | Yes |
| Link from home to cards | `products/meditation_cards.html` |
| Local server from root | `python3 -m http.server` in `number-medicine/` |

---

## Navigation map (simplified)

**On homepage (after Enter):**

- Exhibition dots → chapters 1–9 (same page)  
- Reflect / Ecosystem → sections on homepage  
- **Products / Cards / Carousel** → real pages under `/products/`

**On product pages:**

- Main site → `../index.html`  
- Products → `index.html`  
- Cards / Carousel / Next → sibling HTML files  

---

*If something still fails, note: browser, exact URL in the address bar, and any Console error text.*
