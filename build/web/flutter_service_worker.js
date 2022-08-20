'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "-%20Copy.last_build_id": "410380678f72637c2ef57aded9ae70f7",
".git/COMMIT_EDITMSG": "63fe655b3fbcb83814063e914965df22",
".git/config": "0c54c0ca87a269168a417a588913c177",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "e944c406cfd40fdb29aa3856cd7d87bd",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
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
".git/index": "633d3dba99c6b2d4e10d3d12477c90ba",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "dc873a1f264873fab8c1fb8eced1c52f",
".git/logs/refs/heads/master": "dc873a1f264873fab8c1fb8eced1c52f",
".git/logs/refs/remotes/origin/master": "2b9db1903528eea1c13a1b9901822d8f",
".git/objects/00/c14fbfb04f4171cbfad615669e343c34fee2fe": "0a629200d88d53feaa1c17b4d855e8a9",
".git/objects/03/69b47d58a0ec78f44e51c498520de26d8563e2": "e0a69c144e09ef6012e365b7b2424ea2",
".git/objects/06/67c42f17dbaae35333aa9e3d9d8d4c17311a59": "2ffc4035ccf821dab97189fad05a6099",
".git/objects/0d/0df08f7c3e147a8ae36017cf81a96e35b73717": "106e868f28a72727fb6fb0fa71123633",
".git/objects/0f/0fd1d55b3e9e32ac0f1b1ecdbc59612ca88bf5": "da56b49c0d29942dacc901c812ccaaef",
".git/objects/17/7e8dff9ebe54e82d739c8c9112720911c205ed": "de7af31a194461343b89893a0ec4704b",
".git/objects/1c/d025961bc821fcbc63005dca001a4a963afb56": "b7fda456806e25d4174210cc5f964d5d",
".git/objects/1d/381a65e9e2c19d8e73e349563b80ce2e5413e9": "d62679fbb7a3a8bd8f26ac68f55354e1",
".git/objects/23/d4a4c6cc22d6c405b24138ef21996ae40178fe": "fab8eb19fdb09dd397cbede0b2005e61",
".git/objects/24/b1f14dd348b07c9b8373758bde9ac14d16fd92": "dbf45d6c044044561758a334420e9569",
".git/objects/29/2214367c0af9a2eee8f873b2944224e2fe3f0c": "902d6cf3d5ea70392a74bfc9ded583bb",
".git/objects/2b/8318559062626e0f4ffe02a52004d0f32d421c": "a314c936bca64b9b38363fd646d8140f",
".git/objects/2d/cf3542c874e33cd8ab86ceb6f0ec444228aa78": "66baad0ae5d874f09b6eee790095bc65",
".git/objects/3b/08951b7c31fdda6494916bdff1baeb808eb780": "bc55cbaaa65780df52728cb354a42780",
".git/objects/42/3022dd973610a7e65546132baebf60c4ca4a89": "eb1e059f123984350b56bfcf85813999",
".git/objects/42/976e8b4ddf213dd25d7e86560365a55a832a2c": "a3c975fc3627e9ac93d49a1021923721",
".git/objects/43/8e6856def9cb9047aa4768482cd27cffca97b8": "5ad4c5ba98f56d726e68ae4884d8aafb",
".git/objects/48/41a58d7ce75d9a694b0b385b3e7cce97da1f1f": "6b2a04292750d433eca2cec84c2acffe",
".git/objects/4e/89617a3696bd10c155ec378f4a65a9f89e9e3a": "d8056e20bae90d092b619c895129e982",
".git/objects/51/9cfacd7c1a4924f4d0c6dc3ed2e2e800f9610d": "395b0ceafdd1df251693b74b8e7144ed",
".git/objects/65/63dcdf4bda680cdd898542b2b9fb5bf80b124a": "631a7f57bf65d6eca32574b9cdc44056",
".git/objects/68/d66288e45834ffb411f3583a7eb5fdd578fcdb": "b32606b3dd2794304038f088b5f4de37",
".git/objects/6e/e17b0e7ef9f59be90b1a2d275cc328ed697d32": "3dea7fcb904a17e890f227e6a7cfedca",
".git/objects/75/f99f97d1713389f4cfc8db342e963e318980f2": "2b44400297e850e73fa0bae2359b31ae",
".git/objects/76/8651b2e249c2517c7b37bdbeea0a5d8bfbb707": "495b1c4fefa633f6afe4dc5840ebe18f",
".git/objects/79/ba7ea0836b93b3f178067bcd0a0945dbc26b3f": "f3e31aec622d6cf63f619aa3a6023103",
".git/objects/7b/7f73a553d6fee0a2613b64793a2609687ea800": "8d08b6493868f336d56d28d0d22dc1bb",
".git/objects/81/cd125cff333ad41b182d8db2671ea332fb6e71": "684fdba085e5ba7ac02bb1c9f26190a3",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/98/a2700e52337dde7938a8ca3330658a3d127b9e": "d9fee7d81fbe21f20f5a21167273b554",
".git/objects/9c/1ebd68eb9cbeebfafe9c43c8fdd77652ecd2b2": "e936693101e79c6dcf83fa5ae4a08a7c",
".git/objects/9c/c47a86b37a0c6f729e6ada0424eab597bd95dd": "88951fa6625a6f635eab4b2f738606ea",
".git/objects/9d/bd3332d05f1607b49b4ab0ecf4cd3bea2813ae": "66509cae1b175c3f0fcd423338ee8a8a",
".git/objects/9f/68a490dcb8c5dc75e71ef92451e673786cc5a3": "ec5dc7d191eeb9e475133a0319aa59f7",
".git/objects/9f/713ab9c3f470fd3861e56d6e78fb02493357b4": "70e13c6fb217dd89a5424eeb31c9bde5",
".git/objects/a1/3837a12450aceaa5c8e807c32e781831d67a8f": "bfe4910ea01eb3d69e9520c3b42a0adf",
".git/objects/a7/cecde2b23539f510af5e5ebddace26216752a4": "b57a0fe33bb623e909ea233c488f1a2e",
".git/objects/ab/0e98497a51ead7821d1da35a24968ff314e50f": "557c35fe3928eb2af403d1b3926bb9ba",
".git/objects/b4/d6ba6b1382ddb992f77c03fc1fdb59195b24df": "151ad9ee6536b0cdb2c0faa2b721d6a4",
".git/objects/bb/9486766c01b12078e46310718e7b2a30b493c6": "c1a74f9166b4daa6e8534e5f53ddff67",
".git/objects/bf/41505e806779aad5bccbd5c48d3ce661100814": "2f12c3f648e938c2812eb909090f6c47",
".git/objects/cd/22076013ce8b84475eae9bb4cd6c60b5460fbe": "81c620e2d6cbe5638d6c90ee25886389",
".git/objects/d2/173752776ca5a02fcb0164a8f02d7dd9715ccc": "29326027592131f633b371a4abcb4396",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/de/28db843d7df6ed23b8a7526f6b6b4a83425fe7": "797e4f7b3d8dced098c51679ff33e848",
".git/objects/de/6f655b503a1a685c94f65de51fb75b2de4a073": "d58d6cdcef24b821a0229be7a56fbb08",
".git/objects/e5/951dfb943474a56e611d9923405cd06c2dd28d": "c6fa51103d8db5478e1a43a661f6c68d",
".git/objects/e9/e575d0b36ebd696294496017834c26b62e1505": "8eca52e53d59927cc7c00a13888ea67b",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/3bb12d04ce4429bacda2637ae523e525b2907e": "e510c0fc521e2306819d67fa5c830114",
".git/objects/ee/a00f090afb1e9371b5593b1c170b297a1f8fcf": "518cb7fc1a49d36a3a5461f5d265b0ab",
".git/objects/ef/a84b0b45ca2fdcf94a8b009ad3ff2f9574353c": "3d7e855ae6bf18b431c9be967bdf8cfd",
".git/objects/fc/3507b734a63099d6a5194251271ceef0d94ea3": "5d5f5712fd9c7f0340887f87ff0a7d8a",
".git/objects/ff/972d6d93ce3a22899fe04db2d990dc9c72f509": "0099353200f2a49fb06e75d0670337b6",
".git/objects/pack/pack-4345d2d1762746db4452880667743f4e9077cfad.idx": "a17bdb95d104070a62943a6a12e34a1f",
".git/objects/pack/pack-4345d2d1762746db4452880667743f4e9077cfad.pack": "32bfc7599130348478c0228c14a08fe8",
".git/ORIG_HEAD": "e8a706009257c3a0d3946657479bff4c",
".git/refs/heads/master": "8ff1b19bb71342e5eb6ae4dab260b144",
".git/refs/remotes/origin/master": "1e7f57e435cfeea606d6871ea99fcbb2",
"assets/AssetManifest.json": "1b2662a43fd79b533098ca7cdf9eafce",
"assets/assets/fonts/Montserrat-Medium.ttf": "aca6287f22eef510c1e622c97bb1e1e1",
"assets/assets/fonts/Montserrat-Regular.ttf": "34de1239b12123b85ff1a68b58835a1f",
"assets/assets/fonts/Nunito-Regular.ttf": "5f444b61c541a4b329d8b16841b4de96",
"assets/assets/icons/add_icon.png": "6e123fa5b6ca6c8cb0b92ceec26438d0",
"assets/assets/icons/assigned_icon.png": "e799758eb20ab3f6e5488324d1a5aafa",
"assets/assets/icons/avataricon.png": "a5e81f19cf2c587876fd1bb08ae0249f",
"assets/assets/icons/completed_icon.png": "cc0d1fd6a191fd34d508b6e40aaaacf3",
"assets/assets/icons/imaicon.png": "eab49ffe08be94d9fb2d81dde809f384",
"assets/assets/icons/menu.png": "abba6ad6a8140c7e84734108e7e911e1",
"assets/assets/icons/pending_icon.png": "1e5b06621882ade8dc33e1d5342847c2",
"assets/assets/icons/processing_icon.png": "98fe0977dd8df56e7030d96d53a528df",
"assets/assets/images/customer.jpg": "fc1181b083f9553031f7c042453229a4",
"assets/assets/images/customer_icon.jpg": "2a6c222b873de16da100a5fc60a820b1",
"assets/assets/images/register.jpg": "b02f4284ff7e9ab2be03fa838ad8f3b4",
"assets/FontManifest.json": "10dfdbfa73b84c88390ed6e2d1e6d823",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/NOTICES": "53e836cf5ae3843b18b92e717ef792d7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.ico": "29e761a7476828edbcb2d5f3e4d75b39",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "eb2682e33f25cd8f1fc59011497c35f8",
"icons/Icon-192.png": "4c7b4315ef28ef0b316a1eaec1b117b6",
"icons/Icon-512.png": "a6fd18ddc579590009e31b64f3603d19",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "f010b718d37f79a0edc46b583dacecea",
"/": "f010b718d37f79a0edc46b583dacecea",
"main.dart.js": "6ee0daf2b1efe037299cd0945b40c946",
"manifest.json": "1ac927b562d7625aa65d1f36f0e0ef73",
"version.json": "7e16d4ebb19a0059b34f89f12465db4f"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
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
