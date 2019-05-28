const CACHE = "page-cache-v1.5";

const filesToCache = [
  '/',
  'style/main.css',
  'index.html',
  'https://fonts.googleapis.com/css?family=Oxygen+Mono&display=swap&&effect=anaglyph'
];

self.addEventListener('install', event => {
  console.log('Attempting to install service worker and cache static assets');
  event.waitUntil(
    caches.open(CACHE)
      .then(cache => {
        return cache.addAll(filesToCache);
      })
  );
});

self.addEventListener('fetch', event => {
  console.log('Fetch event for ', event.request.url);
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        if (response) {
          console.log('Found ', event.request.url, ' in cache');
          return response;
        }
        console.log('Network request for ', event.request.url);
        return fetch(event.request)

          .then(response => {
            // TODO 5 - Respond with custom 404 page
            return caches.open(CACHE).then(cache => {
              cache.put(event.request.url, response.clone());
              return response;
            });
          });


      }).catch(error => {

        // TODO 6 - Respond with custom offline page

      })
  );
});

self.addEventListener('activate', event => {
  console.log('Activating new service worker...');

  const cacheWhitelist = [CACHE];

  event.waitUntil(
    caches.keys().then(cacheNames => {
      return Promise.all(
        cacheNames.map(cacheName => {
          if (cacheWhitelist.indexOf(cacheName) === -1) {
            return caches.delete(cacheName);
          }
        })
      );
    })
  );
});

