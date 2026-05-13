const admin = require('firebase-admin');
const fs = require('fs');
const path = require('path');

const serviceAccount = require('./serviceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  storageBucket: 'tilqui.appspot.com'
});

const bucket = admin.storage().bucket();
const baseDir = './assets/images/Animé pictures';

async function uploadAll() {
  const animes = fs.readdirSync(baseDir);
  for (const anime of animes) {
    const animePath = path.join(baseDir, anime);
    if (!fs.statSync(animePath).isDirectory()) continue;
    const characters = fs.readdirSync(animePath);
    for (const character of characters) {
      const charPath = path.join(animePath, character);
      if (!fs.statSync(charPath).isDirectory()) continue;
      const images = fs.readdirSync(charPath)
        .filter(f => f.match(/\.(jpg|jpeg|png)$/i));
      for (const image of images) {
        const localPath = path.join(charPath, image);
        const cleanAnime = anime.replace(/[^a-zA-Z0-9]/g, '_');
        const cleanChar = character.replace(/[^a-zA-Z0-9]/g, '_');
        const cleanImg = image.replace(/[^a-zA-Z0-9.]/g, '_');
        const storagePath =
          `characters/${cleanAnime}/${cleanChar}/${cleanImg}`;
        try {
          await bucket.upload(localPath, {
            destination: storagePath,
            metadata: { contentType: 'image/jpeg' },
            public: true,
          });
          console.log(`✅ ${storagePath}`);
        } catch (e) {
          console.log(`❌ ${storagePath} — ${e.message}`);
        }
      }
    }
  }
  console.log('Upload terminé !');
}

uploadAll();
