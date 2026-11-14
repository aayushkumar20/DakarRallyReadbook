const CACHE_NAME = 'dakar-roadbook-v2';
const ASSETS = [
  './',
  'index.html',
  'style.css',
  'app.js',
  'strings.json',
  'favicon.png',
  'icon-192.png',
  'icon-512.png',
  'manifest.json'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => cache.addAll(ASSETS))
  );
  self.skipWaiting();
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.filter((k) => k !== CACHE_NAME).map((k) => caches.delete(k))
      );
    })
  );
  self.clients.claim();
});

self.addEventListener('fetch', (e) => {
  if (e.request.method !== 'GET') return;
  e.respondWith(
    caches.match(e.request).then((cached) => {
      return (
        cached ||
        fetch(e.request).catch(() => {
          return caches.match('index.html');
        })
      );
    })
  );
});
