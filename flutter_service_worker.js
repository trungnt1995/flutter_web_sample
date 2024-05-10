'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"version.json": "53fb59e54fb87bb44dba7c2200e1dead",
"index.html": "7ce4ed751fc167cc57e516ef972ec9b1",
"/": "7ce4ed751fc167cc57e516ef972ec9b1",
"main.dart.js": "be2d2f21c18fc34246cf1b09d2974ba4",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "ace26d0c71a6ddf01f5f72671a426a89",
".git/config": "327a592fcd02a392a2a580f397c9a639",
".git/objects/0d/100598a549fe252a6991b344da17573e6e14f4": "1387c5355bc734e6a2af1521aaf8e705",
".git/objects/9b/24399b2af54608d571fa5b8f9e0da24099bc78": "9474bb25e1f9ffafedc27c16cf38a4b5",
".git/objects/04/e5efc15dc0c60ea2ffcc37c5bf25e96689f44d": "978222f47488835b92838c74cb5c684c",
".git/objects/3d/2749cafdefd7cec1665b70c0ab7068a7229ae3": "7d1841d7d88c3bb34aafc1815996c9be",
".git/objects/67/1d6085ed2bea642e69d752387336be02575392": "c2defc91acccc00c4919b59d22c212d1",
".git/objects/ac/eebe193f4b885555a6b9a6d85ef1b04747a955": "3cc170ce797e5b637f2ee2b78fcb5f31",
".git/objects/b3/f473f9dddcc0a129d23eca85bf316612610518": "50f122de4bb1c45c8e13671b5cf93d88",
".git/objects/da/701eed506a6dd38c01780b5988513f18dd5bf3": "cefc2ebaecbd9337b369405e2408cf75",
".git/objects/a2/41f7a5794b4115022eeeb4f0ff460448368998": "b798855ae499540d27c357b77cd2c6ba",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/f3/0b66b5fce80c13a81f4a327d9288165c68c4a1": "7ae27e9d330be9cdae6dd1a335942061",
".git/objects/f3/a3089384c0dec6c82cee5b8b0698754f0b015b": "a94963ccfd924c06440cbcf62c0616d7",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/fc/d5ec0303a121407177bc1f5f2413f63e29b3c6": "3a774290d3e0c5951fd0b72b520a74b4",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/c6/0a324123eaaeab58c400c139bcabbc6d0d2a9f": "bcef93963028bd2c2f2a85f2f0411fa6",
".git/objects/c6/ea9fd10da7ec608b4789381aadbdff77be88d1": "187fc98f8cf88b866c1c196722396c7c",
".git/objects/ec/86e9a9b79a403674722b0119ca619516acb2cf": "09df835fd71a425b4792256ccc241e70",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/18/1581ba0b74c02f56a6fac3eecbad7ec12533c5": "45111565a6672ef0e20208900eff33f2",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/45/7d181cc746d65067c245c74006310c8f164d3b": "b4f68d932735abab71400c726c8e23b6",
".git/objects/1f/3acba21d4bf600175add6727e63483fb97a0a8": "1419345a44ca88ad99f3f8561f8635a1",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/28/13301aaace49054a4de315e0f71de208b3f3a1": "aa9347df170e9154115b97b7276a2b3b",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/19/5ef118e7579653694e89ff2d67e09a854e662d": "f1bfe6292cc2011bee4f91674a2ca26a",
".git/objects/26/2f90718d3a8b750f5a89e0eff8fb50933b79b1": "f78ce21cd1cb6ff92ec3522dccd30ed5",
".git/objects/26/e128e62c5f85489b8e686cf97f0ef1e4314c2b": "7a75b60a3d163300c443a23119be447a",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/07/936978aa55a0ed4c4f05806ea7ac5541169894": "5d1a6fb452a9ba66db200155776fdc3e",
".git/objects/38/bb7f6236e7d0704f404b0f79615a3190c9b6ca": "46e7fc29ffb900e3c676be85fef20700",
".git/objects/00/fbff6d3474e2566b4d96a046b14f27370de28f": "8989026e4fed3e38147ef68af44bc1b4",
".git/objects/9a/f4bfde35d436db3b9882431fd178e61ab9e53d": "a01927d5462b6ded9a52011178c707b6",
".git/objects/31/2244ab183667024b1194c881412eb48f218b3c": "743fe6300de8b26936357c6b55acec41",
".git/objects/62/bec2405981e2a70db611cf07c2ae038184b2b0": "80d33993d8c8f20951fd95fe24c4d4ef",
".git/objects/3a/cb35b625143fb3a1dfb17ea8b418bd43991aa4": "0f1299c09442e8dd0f4fafa6ce5b597b",
".git/objects/54/d4b042b52a7bf986feb057eeb06e6eafa8e951": "a476a03b10c8c072511e945eb11fea34",
".git/objects/5b/ae4394b19757aeeba3eda0e9d304409edf4925": "052c83acecfb51c2a97baee9608dc1b0",
".git/objects/08/7a6450acf44369a21337722ae72875e523cb9f": "d51b5e14c3e8b509ae47cb611f569d0c",
".git/objects/39/2f652d4a48dcdd9f47a44bae01f566e7db43b3": "68b9789f8a8c98ced52a944632f75d4c",
".git/objects/55/681e1c0a7bee91496fbeb783eaf1fee0ba39f1": "52e20493267da376404a18a58678fca6",
".git/objects/55/f180d146ab961a4d0d8fd7a7c96ae8e5a96ab2": "ff0f7bbcdee716c816eff385513094d9",
".git/objects/90/5e721eb71698498ccac6c126670d590f5fa3c9": "a27f575b40a3aed96aca931f7af5c87e",
".git/objects/d3/577b960846dd2a9d2cbaceab7b8715b3c5fd54": "2f28755c9f3ad271155661637e054271",
".git/objects/ba/8cb00dd5231f1a55de0205c16445926a696526": "be8592f9341c9b01b70890c8614c6cf7",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/dd/7a8158719a2bb3d016e230d76fb430bdee6c61": "05442db3b8a7e2ae25b4e1c48611b11f",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/a1/1dedd2c60fd1d221c6cdfe9be437fbe8b21508": "bdfd37008c501455f3220d598c60e91f",
".git/objects/f7/da97ec32e1291db4a5067f4e1b3c38833db4ce": "99ddf85091bed4f1d1be60c4a32c6edb",
".git/objects/e8/2c5850db3a3482d0c954a4dc122c02de555ce7": "d357cd906b3805bf81477f5527cca086",
".git/objects/c5/f4bc2a4da91586f3005813077f0d0aa9040f82": "3191028b787554cee4652f5050144bff",
".git/objects/cb/4f644304e0efa6a4725eda3f05018e6ec4dd38": "f92107461d63145da6a5eb8e03cb4ecd",
".git/objects/46/7a32f3eea6ce1ae6a9716685a162eb3a6c9ad7": "c43b450e64e345dc23850b81201eff14",
".git/objects/2d/266fca758e23668eebb5057161b08763105687": "60e6e648c7f34d9adb7bda6bc2c3f90b",
".git/objects/83/ce09b05caede82907f1343e1bbd538451311ed": "7e2ebcf34867b18f5407134bfed7a458",
".git/objects/1e/9ede8a0bb4bf3a0f58bf45d1da7cf925b946ef": "e71933e8b21a9ba4c7ec911c18ad8967",
".git/objects/4a/39079e580dc9be820cba2fae41238c49eaa798": "ada1a19fea32fbb6719120809b9eae60",
".git/objects/4f/a3ea3134b2e3a5028841aa1e5613ce0c46ae3c": "d839b6a7789a2c0862d4e0abc927d37c",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/1d/541ca2f9ff67938594ddb4d683de24fe3199fc": "212e90f15256270ab41aefd7bd17567c",
".git/objects/71/7117947090611c3967f8681ab1ac0f79bca7fc": "ad4e74c0da46020e04043b5cf7f91098",
".git/objects/2b/46599179a195d1a6735012ec3c05798755724c": "376df7571b3fa4ce4feb0dce3affac3d",
".git/objects/78/fbedd93adbaac84e2b4d7d748b479e1b3fac73": "efadecf89251ad523114d66e69798cb0",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "e95b1a723880925732c91d025bbcbf49",
".git/logs/refs/heads/master": "5965f4d29142a7b047d58147b45a33fc",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/master": "6a437765e9d483d22e7d331cbd607ccf",
".git/index": "2220d02d590ec8bcc3121dbb6dac8b8e",
".git/COMMIT_EDITMSG": "a8297d555dd34879e8e48e1cf12acefa",
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
