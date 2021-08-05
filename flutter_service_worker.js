'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  ".git/COMMIT_EDITMSG": "dab6e5871491e4627d496fbe08eb93ba",
".git/config": "81fe460df317515976fe3400eb17dff1",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "deb77e4e326952feba37d19be77fd502",
".git/HEAD": "5ab7a4355e4c959b0c5c008f202f51ec",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "ea587b0fae70333bce92257152996e70",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "80855dcb8b3e42ed81e41a18e8e0641f",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "3dea13f52b2d1614e4e802308d64a5e6",
".git/logs/refs/heads/gh-pages": "3dea13f52b2d1614e4e802308d64a5e6",
".git/logs/refs/remotes/origin/gh-pages": "305d2299558ec7a733079fa68b786049",
".git/logs/refs/remotes/origin/master": "d3c6854cf11a93efe00b0148851ca812",
".git/objects/03/6cecd3f5517f47dcbaefdadcc7e79f4608c6a8": "cf9aa9c3f4946f3e6a79adc5fa952e85",
".git/objects/04/e0fc62f7aef4c3ef3b6a2baacaa4925389eef8": "33027b780d31e2160f0ca139ceecce70",
".git/objects/04/e871a9aa7832cd3f354e331e6e346a18e99d1e": "cf8dcfa0cc8b884c58d8f97471b7ee1a",
".git/objects/0e/283c427af1c4b03ca910b27dd7ab3ff15ba39d": "36b3d7d48c7dec15bc98401bbea92987",
".git/objects/0e/bde73df5be7b53ebbe8faf44de9d68ca429fbd": "3b7a982a84e263652d3a82e1491d0bb9",
".git/objects/20/5bb5db271c6d8de8399864c7bb9b917f638893": "c993b22f115d7f3ae6d5b7b212806539",
".git/objects/23/fa1441ceac366b0022a69caec1d15e9217107d": "dc93446af8d694627d39f8282d4aaf4e",
".git/objects/32/46ad559eeae0370195978eaed83f1053ee13fd": "a043dbc0a0bda96ce2127799ccc27506",
".git/objects/32/5136e0ca4be0e209b1a8f1c570fae8e854b0fd": "7fd8431e5e5f876d9266bd61298d1126",
".git/objects/38/1587352327bd67d7d02f5bf5f610fbed96b09c": "7f7c58084d937378e08ee5cd1a8384a5",
".git/objects/3e/fc6a767b95d525a274de7c3dfedbf4b34128b3": "da033f14d393bb5a6624e529baac9e63",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/58/2b2d05104bf6e597647cfc77f127af45d8efa1": "e03bc3ed1ccd99026c3e6fb353102afe",
".git/objects/5d/2ef14f6849c6eaada11736f1f049d1ecdf4c18": "00cbb944e66ec26eec1a87382d749999",
".git/objects/61/8cbf8ee90afa767a929008a28cae94d5efcf3f": "d330a013e028bcc838d2cbdae735a398",
".git/objects/69/10d05bc0685fe87eef81949277ec1ac60c6a56": "9501ac85a013c9a33970833401b44f8c",
".git/objects/74/4ca8d30aa28fb0fc4696fa93657f54716336f7": "ebcaa5f0fc0a8a1337c19a3680450b93",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/84/7a87a8f647db63749206cb24dd375ce6a73190": "54fa3d0cd79afe500286f86f40f02bd1",
".git/objects/88/109c171b2b29fcc3082ab8e3b44267900e6069": "5cb808fedb0acf913eebee837edde5e1",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/a0/776ae7e99e4d51100b765576c103875b7c7059": "4faf411a36cffce44534116c9d500a7f",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a2/2d178f148b56e18669e05913e6440fcb63e04c": "e1dc458e18088a4da9a291924033cbc6",
".git/objects/a2/e2b9e5ad8ca0016eebf283c613e459478ddf6d": "f602227428b6dea586f82b8a926ecbbe",
".git/objects/a8/beffd3ad4fe54d6cabccf83a05477d6a986cd0": "6677888e4a051c7838b5b240c09f0981",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/ad/29af3210aade866b74b4c7c52fb3bc970e0a84": "6c5256569391c6868679e8bc6c8be0b4",
".git/objects/b6/95dae8e791d10d7866bc582e91d6d57de1faa0": "456fd73c478575be1f454636d7de8752",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/c7/27663f9cdb3cd63332e70dc65371d1e2026e86": "63e1c2c09fae02d4ea9fb527651c3e81",
".git/objects/c9/a394ebf080992d14ecb87c961db9d26b594dd1": "40a78ba852c012cc3001c77ecc0782ee",
".git/objects/cd/35c6825492379e174e5534506fc8c243967d9e": "883fd22a095e3460fa1e1ec470420fae",
".git/objects/cf/494ef7f78de36391688b3b3f8ab837097bf865": "2bc3cd7f769279a18be317b460fd292d",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e8/a96a7686626d7d72232077364be0938aeaea48": "0bab6a17726982d62297648c77de32b5",
".git/objects/eb/e69dd169712938dcf8d962c25c056baf80f2e8": "389deee738c47425595374b8652f5bbb",
".git/objects/ec/052ec6bb9c69dc8ea8e65ffc9adacf71eb7452": "7d72bff36ac6834e7ee7add3211b80bf",
".git/objects/ec/a1b02d663df12cf3d1d300b11c4f56e5689f9b": "a7d2342038d61f37ec42013ed8b05d0e",
".git/objects/f8/22b02e73a0db1bd4d9325b15baecb966ec14c7": "0e3b275df9c9166f468609f4e2f5ee0b",
".git/objects/f8/54329e71f37538094aa5e33a673841c54ff53c": "14dc13323d081155c4ece6438770d4ae",
".git/objects/fa/7c6d51cd4f276cb98f82348abb72f2bd2d8dfc": "07630d7a0efb46cce4211629fc291ee8",
".git/objects/pack/pack-339ba80d92f93552a5c1c4b416a2a4a8875fe661.idx": "6e77424d5b62164be2bc2289eea368ac",
".git/objects/pack/pack-339ba80d92f93552a5c1c4b416a2a4a8875fe661.pack": "a65a7d78631e95d5a3419c380a558f4f",
".git/ORIG_HEAD": "42a514e8ae4914fabd8d814169b5b4c4",
".git/refs/heads/gh-pages": "dce597bf98f69029cbde925645dc16a6",
".git/refs/remotes/origin/gh-pages": "dce597bf98f69029cbde925645dc16a6",
".git/refs/remotes/origin/master": "bbd564b0a195124637133fe58f02e4f2",
"assets/AssetManifest.json": "9b7e4924ab7bd014be0ed3fa5899298e",
"assets/assets/fonts/dpcomic.ttf": "a3620c0b63573282ebcccca50fe4c7b0",
"assets/assets/Hacker-Sheet.png": "d0fa603a35333dcddbb3b9c6ca83b88d",
"assets/assets/HackerEnemies-Sheet.png": "ac7325a82d69a4264375054b0f7683e9",
"assets/FontManifest.json": "7ef3383250aded407b91de0ff46a4bda",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "86cf84007ce74f95adf85fc61d6513ec",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "093323c9da6f90f929f0765202f694ab",
"/": "093323c9da6f90f929f0765202f694ab",
"main.dart.js": "5650cd9e3373e38236876f09fe49f2b0",
"manifest.json": "ad9099935e9cc1d505786ed71ca9af44",
"version.json": "07a3ad6430f710a63b56fd90804033eb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
