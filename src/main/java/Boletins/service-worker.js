// Arquivo service-worker.js

// Define uma versão para o Service Worker
const CACHE_VERSION = 'v1';

// Define uma lista de arquivos a serem armazenados em cache
const FILES_TO_CACHE = [

    '/Boletim_war',
    '/index.jsp',
    '/custom.css',
    // Adicione aqui outros arquivos estáticos do seu aplicativo
];

// Evento de instalação do Service Worker
self.addEventListener('install', event => {
    event.waitUntil(
        caches.open(CACHE_VERSION)
            .then(cache => cache.addAll(FILES_TO_CACHE))
            .then(() => self.skipWaiting())
    );
});

// Evento de ativação do Service Worker
self.addEventListener('activate', event => {
    event.waitUntil(
        caches.keys().then(cacheNames => {
            return Promise.all(
                cacheNames.map(cacheName => {
                    if (cacheName !== CACHE_VERSION) {
                        return caches.delete(cacheName);
                    }
                })
            );
        })
    );
});

// Intercepta as solicitações de rede
self.addEventListener('fetch', event => {
    event.respondWith(
        caches.match(event.request)
            .then(response => {
                if (response) {
                    return response;
                }
                return fetch(event.request);
            })
    );
});

// Evento de push para notificações push
self.addEventListener('push', event => {
    // Lógica para manipular notificações push
    // ...
});
