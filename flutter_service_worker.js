'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "52fc3fefe951bd0e187514cabbaf338a",
"version.json": "c5f5e9e0f9326bb0d7aa00e2750c1925",
"index.html": "5c96806b4e0ac5064ed777223ab8fafa",
"/": "5c96806b4e0ac5064ed777223ab8fafa",
"main.dart.js": "089b54b31597344a318a85232d82f718",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"favicon.png": "391d8cc806cf884d944cda43f3fc580d",
"main-icon.png": "4f9f5ec4aeae3c9ee04c991c9ca9862e",
"icons/favicon-16x16.png": "1da1ff091bdfec6604990f3da4db5067",
"icons/favicon.ico": "e10db0949ca4d1e8b1d3970a326b67d0",
"icons/apple-icon.png": "a8fedb68ae1f356e856b3380f156d325",
"icons/apple-icon-144x144.png": "0734e3446c550969d069ebdaeaf63c66",
"icons/android-icon-192x192.png": "62de1bfe931542230617803dea95abc3",
"icons/apple-icon-precomposed.png": "a8fedb68ae1f356e856b3380f156d325",
"icons/apple-icon-114x114.png": "54732b455a5d1d5e932df24682cbbb20",
"icons/ms-icon-310x310.png": "f20f45bd0725ab81b2a6fd97faef2c94",
"icons/ms-icon-144x144.png": "0734e3446c550969d069ebdaeaf63c66",
"icons/apple-icon-57x57.png": "1cc051274cfdc01b4b74988cdaca1c98",
"icons/apple-icon-152x152.png": "64b9b2da8746b9b8c4685d8864a8a457",
"icons/ms-icon-150x150.png": "6df004c95c22e0a10384274422b6e0f3",
"icons/android-icon-72x72.png": "51d041c3e717a63f246200a82a86b163",
"icons/android-icon-96x96.png": "5558d4018e6ecfdd076de715dc89a834",
"icons/android-icon-36x36.png": "924ccf66b86949bb58943ef71798477c",
"icons/apple-icon-180x180.png": "34f0d1bb458a0a6fca3b61101262e861",
"icons/favicon-96x96.png": "5558d4018e6ecfdd076de715dc89a834",
"icons/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"icons/android-icon-48x48.png": "76f3166b866172d8a71e85cada2d9b82",
"icons/apple-icon-76x76.png": "37fc5b79bd8b2a0c70cf86327ab10e44",
"icons/apple-icon-60x60.png": "8152ea76bbd486c6175b0dbb1a3d250c",
"icons/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"icons/android-icon-144x144.png": "0734e3446c550969d069ebdaeaf63c66",
"icons/apple-icon-72x72.png": "51d041c3e717a63f246200a82a86b163",
"icons/apple-icon-120x120.png": "6b93b424b78893b8bfef2925fa49f516",
"icons/favicon-32x32.png": "a9d38a837a12a01f34fed0f6a9ad7f15",
"icons/ms-icon-70x70.png": "da7aad62aa51c5d77a40592b24bb7ead",
"manifest.json": "a51234a9c7b5f979e7be407cb753cfb2",
"assets/AssetManifest.json": "e5e2670c328e2f014a539b35d0539ce9",
"assets/NOTICES": "1ebabe3f796a609c5f89f0ebcfd2cf13",
"assets/FontManifest.json": "94aeac1332d1708f89d82fa22f36ee72",
"assets/AssetManifest.bin.json": "e1957228b748af24af0be28b3d00a3d4",
"assets/packages/flutter_map/lib/assets/flutter_map_logo.png": "208d63cc917af9713fc9572bd5c09362",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "122502fb93c5b2ebb15c50fad3204a72",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "76bd55cc08e511bb603cc53003b81051",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "93b16e5632afda27804cb2ecebc30758",
"assets/fonts/MaterialIcons-Regular.otf": "b3a1cbd5ea363905652e6525b1af2a3a",
"assets/assets/images/exemple-logo.png": "a66f91da365f65b4327923f99b1879ef",
"assets/assets/images/visit_morocco.png": "d559aa7300c90264f6ef61b1661b0d0b",
"assets/assets/images/cmm.jpg": "3beb81b930d134799496b0a5bfb30653",
"assets/assets/images/menu.png": "265bbb072edfea430404413b23cebfa0",
"assets/assets/images/ram.jpg": "77db9fd3afac7fd97cc0c0a4cb8dad38",
"assets/assets/images/ministre.png": "235e33a98ac18105a71bad66333509f3",
"assets/assets/images/onmt.jpg": "97928a8f863fb474f00ccfaec4eed0d6",
"assets/assets/images/stars.png": "8f46ba5883318b360d537a50d2cc73ed",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
