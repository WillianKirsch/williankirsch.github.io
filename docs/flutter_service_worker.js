'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "b0a25a5fad6239af060e61f67ffb6a32",
"index.html": "db9538dc7fce8c1d581c3e7041d1adf7",
"/": "db9538dc7fce8c1d581c3e7041d1adf7",
"main.dart.js": "9a12409cff5c8aa2b4e9a22dc598d1a5",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ecfd61e7a3ccf5461eda18542af6f21f",
"assets/AssetManifest.json": "1ff376a8cc944b45e8df48eed7259880",
"assets/NOTICES": "44feb7b7c7e7335441972e2ee0cfb3ca",
"assets/FontManifest.json": "3c3407ed44dc0e094d534dddb9efb6c9",
"assets/AssetManifest.bin.json": "df5fd6bd3450f92b194d0fa8c53a2a0f",
"assets/packages/purple_ds/fonts/AnekLatin-Bold.ttf": "902d407dba14a953e92c36c2d0f8c126",
"assets/packages/purple_ds/fonts/AnekLatin-Regular.ttf": "aa9c5046493db77216096dcdd5b441b2",
"assets/packages/purple_ds/fonts/AnekLatin-Medium.ttf": "85b6d8702561b1bd6ffa8740b2379a67",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "6a4ad82206aaea56d8dd5df8835fa531",
"assets/fonts/MaterialIcons-Regular.otf": "668a8125b3b015f6387f80196c929120",
"assets/assets/terceiros/tdc.jpeg": "965f86c17c89532c1ca7186dee763559",
"assets/assets/terceiros/flutter.png": "365299fb9b81f6cb4eca4c2ba4c8327b",
"assets/assets/terceiros/toro.png": "3611019a967f0774e125535cd22dd7e3",
"assets/assets/terceiros/flutter-capa.png": "acbedd9ab1beef513bdcf90bc7fd05ae",
"assets/assets/images/background.svg": "0042c6fef298175d436ab541ecf70ccd",
"assets/assets/images/flutter_logo.png": "478970b138ad955405d4efda115125bf",
"assets/assets/images/instagram.png": "e5ba7dd76e0bb07430a191da66ab6010",
"assets/assets/images/2.0x/flutter_logo.png": "4efb9624185aff46ca4bf5ab96496736",
"assets/assets/images/android_ios.png": "9221c6cfc59a5642ca5ed9af1bce3d26",
"assets/assets/images/github.png": "6a314787b380f80290e7d79cf46b3d9a",
"assets/assets/images/Kirsch.jpg": "716934c8d3fc68b1ecaac0563171bcff",
"assets/assets/images/3.0x/flutter_logo.png": "b8ead818b15b6518ac627b53376b42f2",
"assets/assets/images/background.png": "1c0ed3713b08a391413aafd1b5e2e606",
"assets/assets/images/Logo.png": "16f11aa819f219b7972da44083373eb3",
"assets/assets/images/linkedin.png": "e6b594c8afb515bcb271a5073d56c836",
"assets/assets/images/hi.gif": "cad5918d86b6a7e83f1fb4acead70e4c",
"assets/assets/images/WillianKirsch.png": "66ce820e0f4524de2ffa1dea52a83713",
"assets/assets/images/google.png": "d45480e1c7342b683bf97167b70de488",
"assets/assets/app-ads.txt": "d834041f775f371e7bc6bbb8288cd6f8",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
