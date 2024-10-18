const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');

const authRoutes = require('./routes/auth');
const utilisateur = require('./routes/utilisateur');
const professors = require('./routes/prof')
const mention = require('./routes/mentions');

const app = express();
app.use(bodyParser.json());

// Permettre les requêtes CORS provenant de localhost:4001
app.use(cors({
  origin: 'http://localhost:5173',  // L'origine autorisée
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],  // Méthodes HTTP autorisées
  allowedHeaders: ['Content-Type', 'Authorization', 'Access-Control-Allow-Headers'],  // En-têtes autorisés
  credentials: true  // Autoriser les cookies et autres credentials
}));


// Gérer les requêtes preflight (OPTIONS)
app.options('*', cors());  // Répondre aux requêtes OPTIONS

/*
app.use((req, res, next) => {
  console.log('Received body:', req.body);  // Voir ce qui est envoyé
  next();
});
*/

// Routes
app.use('/api/auth', authRoutes);
app.use('/api/user', utilisateur);
app.use('/api/professors',professors);
app.use('/api/mention',mention);

// Démarrer le serveur
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
