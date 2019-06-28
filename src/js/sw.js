const routesMap = new Map([
  ["\/", "\/index.html"],
  ["\/home", "\/index.html"],
]);
const pageRouteMatcher = ({ url, event }) => { return routesMap.has(url.pathname); Î };
const pageRouteHandler = async ({ url, event, params }) => { return fetch(routesMap.get(url.pathname) + url.search); };
const router = workbox.routing;
router.registerRoute(pageRouteMatcher, pageRouteHandler);
router.setDefaultHandler(({ url, event, params }) => {
  return fetch(event.request);
});
workbox.googleAnalytics.initialize();
workbox.core.skipWaiting();
workbox.core.clientsClaim();
workbox.precaching.precacheAndRoute(self.__precacheManifest);