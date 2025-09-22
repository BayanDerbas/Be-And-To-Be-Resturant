importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.22.2/firebase-messaging-compat.js');

firebase.initializeApp({
  apiKey: "AIzaSyCog34CaZqSaXR5OvXFZYrgoYTKX66gMqo",
  authDomain: "be-and-to-be.firebaseapp.com",
  projectId: "be-and-to-be",
  storageBucket: "be-and-to-be.appspot.com",
  messagingSenderId: "260214183612",
  appId: "1:260214183612:web:db9e3dcc8bd66eb79422b9",
  measurementId: "G-KKDRPCN840"
});

const messaging = firebase.messaging();
