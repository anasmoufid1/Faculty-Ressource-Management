/**
 * 
 */
function updateProfile() {
  var nom = document.getElementById('nom').value;
  var prenom = document.getElementById('prenom').value;
  var address = document.getElementById('address').value;
  var telephone = document.getElementById('telephone').value;

  var data = {
    nom: nom,
    prenom: prenom,
    address: address,
    telephone: telephone
  };

  fetch('/ProfileServlet', { // Assurez-vous de mettre le bon chemin vers votre servlet
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  })
  .then(response => response.json())
  .then(data => {
    // Gérer la réponse du serveur ici (par exemple, afficher un message de confirmation)
    console.log(data);
  })
  .catch(error => {
    console.error('Erreur :', error);
  });
}
