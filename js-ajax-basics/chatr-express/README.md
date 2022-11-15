# Chatr in Express

To get started:

```bash
git clone https://github.com/CodeCoreYVR/chatr-express.git
cd chatr-express
nvm install 12.18.4
nvm use 12.18.4
npm install fsevents
npm i
npm install -g json-server
npm run db:setup
npm run db:seed
npm start
```

Go to `http://localhost:3434` to view the app.

Run your server either by using VSCode's Live server, 

or in terminal if you installed json-server:
```bash
json-server data.json
```

Write your client-side JavaScript in `public/javascripts/main.js`!

Also, remember to change the scripts in /views/partials/header.ejs if you are adding jquery.

✨🤓✨
