const express = require('express');
const router = express.Router();
const db = require('../db'); // Import the MySQL connection

// Login route
router.post('/login', (req, res) => {
  console.log("hell");
  
  // Use 'email' and 'password' instead of 'mail' and 'mdp'
  const { email, password } = req.body;

  if (!email || !password) {
    return res.status(400).json({ message: 'Email and password are required' });
  }

  // Check if the user exists in the database with 'email' and 'password'
  const sql = 'SELECT * FROM utilisateur WHERE mail = ? AND mdp = ?';
  db.query(sql, [email, password], (err, results) => {
    if (err) {
      return res.status(500).json({ message: 'Error checking credentials' });
    }

    if (results.length > 0) {
      const user = results[0];

      try {
        // Generate access token from userTokens
        const accessToken = user.userToken;

        // Filter out sensitive data
        const userData = { ...user };
        const userOutData = Object.fromEntries(
          Object.entries(userData).filter(([key, _]) => !(key === 'mdp' || key === 'abilityRules'))
        );

        // Define ability rules based on the user's role
        let abilityRules;
        if (user.role == 'admin') {
          abilityRules = [
            {
              action: 'manage',
              subject: 'all',
            },
          ];
        } else {
          abilityRules = [
            {
              action: 'read',
              subject: 'AclDemo',
            },
          ];
        }
         console.log(userOutData);
        
        // Send the response
        return res.status(200).json({
          userAbilityRules: abilityRules,
          accessToken,
          userData: userOutData,
        });
      } catch (e) {
        return res.status(500).json({ message: 'Error processing login', error: e.message });
      }
    } else {
      // Invalid credentials
      return res.status(401).json({ message: 'Invalid email or password' });
    }
  });
});


// Logout route
router.post('/logout', (req, res) => {
    // Destroy the session
    req.session.destroy((err) => {
      if (err) {
        return res.status(500).json({ message: 'Logout failed' });
      }
      res.clearCookie('connect.sid'); // Clear the session cookie
      return res.status(200).json({ message: 'Logout successful' });
    });
});
  

module.exports = router;
