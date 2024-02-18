# chez_meme

EPSI DevOps 3A - Atelier Dev Mobile


## Groupe

* Antoine LETAILLEUR--CLEMENT
* Jérémie FELIN
* Thibault SCORIELLE
* Yassine ASGHIR
* Dimitri PERREAUX

## L'application

"Chez mémé" permet de proposer une liste d'articles conseillant des remèdes et des mesures hygiéno-diététiques adaptés,
à partir d'une recherche via un symptôme ou des mots clés.

### mockAPI
Nous avons travaillé à partir de deux Schémas de données proposés gratuitement par mockAPI:
[articles](https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/articles)
[Users](https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/users)

Nous avons adapté certains champs pour faciliter la génération aléatoire en fonction des possiblités offertent par mockAPI.
Notamment, les tags correspondant aux symptômes pour retrouver les articles sont remplacés dans cette 
première version par des styles de musique ('Country', 'Rap', 'Metal' etc..).
Cela nous a permis de nous concentrer sur la navigation et les fonctionnalités plutôt que sur le contenu.

### Authentification
Notre application permet à l'utilisateur de s'identifier. Si il est considéré comme admin, il aura
la possibilité de créer des articles.
S'il n'est que simple utilisateur, il ne pourra effectuer qu'une recherche, et sélectionner un des article
proposés en réponse pour afficher son contenu.

Un Provider permet à l'application d'accéder à l'instance du User dans toutes les pages. 
Une page permet de consulter les détails de son compte.

Users de test :
**Darren Thiel // KGgSYLmXmt1371Z (isAdmin : false)** [Darren](https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/users/1)
**Elena Dooley // cZlbWHqkBlkmlMe (isAdmin : true)** [Elena](https://65bca6a6b51f9b29e931f27e.mockapi.io/api/v1/users/2)

### Navigation
La navigation s'effectue essentiellement via une BottomNavigationBar, dont l'index de l'élément sélectionné est 
relié à un tableau de pages générant le body.
En fonction du rôle du user, l'icone de création de page est affichée ou non.

### Recherche d'article
Nous générons dans un premier temps une liste de tous les articles via une factory après un appel à l'API,.
Puis la fonction de recherche affiche tous les articles contenant l'élément de la recherche dans le titre, le tag, ou le description de l'article.

### Lecture d'un article
Il suffit de cliquer sur un des articles correspondant à la recherche pour afficher son contenu dans une nouvelle page.

### Création d'un article
Nous n'avons pas implémenter de route POST pour la création d'un article.
La page vérifie puis collecte les valeurs des inputs, génère une instance d' Article puis l'affiche dans la console.

### Logo
Le logo a été généré via [Stable Diffusion](https://stablediffusionweb.com/fr)
