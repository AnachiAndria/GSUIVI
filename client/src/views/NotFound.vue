<template>
    <div class="not-found">
      <h1>404</h1>
      <p>Page Not Found</p>
      <router-link to="/">Go back to Home</router-link>
    </div>
  </template>
  
  <script>
  export default {
    name: 'NotFound'
  }
  </script>
  
  <style scoped>
  .not-found {
    text-align: center;
    margin-top: 50px;
  }
  
  .not-found h1 {
    font-size: 5rem;
    color: #ff6b6b;
  }
  
  .not-found p {
    font-size: 1.5rem;
  }
  
  a {
    color: #42b983;
    text-decoration: underline;
  }
  </style>
  