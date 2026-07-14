#!/usr/bin/env bash
# Local server for The Language of Nine / Number Medicine
# Usage: ./serve.sh
# Then open: http://127.0.0.1:8765/
set -e
cd "$(dirname "$0")"
PORT="${1:-8765}"
echo ""
echo "  Language of Nine — local server"
echo "  Root: $(pwd)"
echo "  Open: http://127.0.0.1:${PORT}/"
echo "  Products: http://127.0.0.1:${PORT}/products/"
echo "  Cards:    http://127.0.0.1:${PORT}/products/meditation_cards.html"
echo "  Carousel: http://127.0.0.1:${PORT}/products/social_carousel.html"
echo "  Stop:     Ctrl+C"
echo ""
python3 -m http.server "$PORT"
