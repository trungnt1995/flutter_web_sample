'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "53fb59e54fb87bb44dba7c2200e1dead",
"index.html": "b9d13912b3394998122406d57f113e94",
"/": "b9d13912b3394998122406d57f113e94",
"main.dart.js": "0f9368a24bab91c9c3e3f1b05112ad51",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ace26d0c71a6ddf01f5f72671a426a89",
"assets/AssetManifest.json": "6bb84933832a650fbe7e46c6d5ef7ab1",
"assets/NOTICES": "dfb0ba06a66c6f11cd3662a5658a46d2",
"assets/FontManifest.json": "3af4ebc3c23d7c5f6677ed2266bfc1be",
"assets/AssetManifest.bin.json": "631953c768523bdee245615730aa7313",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/AssetManifest.bin": "36aae929dcd06f46cfdb8906e59e7c86",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/images/medium.svg": "70f2cf31d20dfb7025369f61451d84ed",
"assets/assets/images/small_logo.svg": "2a6ede75906de7dc676345b1990b29f8",
"assets/assets/images/github.svg": "93635c8f0d8f0260a1a09e091ead7061",
"assets/assets/images/instagram.svg": "cba13abe9f7748f17b7a517b87f8bbd8",
"assets/assets/images/hand_phone.png": "5bb77f134c3589c56e42ede924464c65",
"assets/assets/images/chevron_right.svg": "c019c28a909433e4cc526b886d5ad0f7",
"assets/assets/images/arrow_right.svg": "e30af124c620e81aec6c48f805d2f469",
"assets/assets/images/image_2.png": "0bd1e2db21ae6711d513d4489b31f752",
"assets/assets/images/image_1.png": "355cc2dec74b16f6eb2892b0df0726e1",
"assets/assets/images/crown.svg": "4818234c6e2fecf9bcbb773078aa4383",
"assets/assets/images/tele.svg": "f23adb57f9c7b0472a8d5489797b13c5",
"assets/assets/images/star.svg": "823ba531850b2717ca123e6fe16bd009",
"assets/assets/images/footer_bg.png": "fae2f04a1d5b2475e57c1e1afc55a1c3",
"assets/assets/images/reddit.svg": "23d4533da09b88685b730ffdf08426ea",
"assets/assets/images/twitter.svg": "26d371962da2d9f6907c6bb62502fc0e",
"assets/assets/images/logo.svg": "650894c3f1cb0fa88b037bb78e1cc1f6",
"assets/assets/images/phone_bg.png": "8efcf146b73004a687ec7fd4ae9c0235",
"assets/assets/images/mask_bg.png": "3bbd65e3a0321704d3932dcf01ae6c53",
"assets/assets/images/bg.png": "ec54b20128fd618a24e096e8ea09f905",
"assets/assets/fonts/centurygothic.ttf": "cfce6abbbff0099b15691345d8b94dcc",
"assets/assets/fonts/centurygothic_bold.ttf": "bc420c1c2b98e2ee8b2a75c1ce1fe083",
"assets/assets/fonts/gothici.ttf": "87a9215362fd296c0ebe360625353a1a",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "332d455e8263a953c3cc7a9f01e2f157",
"canvaskit/canvaskit.js.symbols": "d9721bc2c5faef25c5d1449c2fa22f00",
"canvaskit/skwasm.wasm": "19a5ceaa7ae75afd6ba2c7c043e70ab2",
"canvaskit/chromium/canvaskit.js.symbols": "d50a5c3c1654f3f75e7692f09120fd79",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.wasm": "7348043121a45ffbedb2eafeadad00a8",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.wasm": "77ba2b938954a72f5f53b0263a603414",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
