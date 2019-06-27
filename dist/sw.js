//Make sure to update this everytime there is change in ui
// even better make it auto increment in ci/cd
const CACHE = "page-cache-v1.8";

const filesToCache = [
  //TODO - cache this when most styling is done 'style/main.css',
  'pages/404.html',
  'https://fonts.googleapis.com/css?family=Oxygen+Mono&display=swap&&effect=anaglyph'
];

self.addEventListener('install', event => {
  event.waitUntil(
    caches.open(CACHE)
      .then(cache => {
        return cache.addAll(filesToCache);
      })
  );
});

self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        if (response) {
          return response;
        }
        return fetch(event.request);
          // .then(response => {
          //   // TODO - Respond with custom 404 page
          //   return caches.open(CACHE).then(cache => {
          //     cache.put(event.request.url, response.clone());
          //     return response;
          //   });
          // });
      }).catch(error => {

        // TODO - Respond with custom offline page

      })
  );
});

self.addEventListener('activate', event => {
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

