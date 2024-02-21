[Rapport projet](https://github.com/ayoubtrabelsitr/FALG-SIMULATION/blob/main/AYOUB_FABRICE.pdf)

# Projet 2 : Animation d’un drapeau sous l’action du vent

## Réalisé par :
- TURIKUMWE Fabrice
- TRABELSI Ayoub

## Année :
2023-2024

## 1. Introduction
L’animation basée sur la physique utilise les lois de la physique mécanique classique afin de générer des animations adaptées au contexte et à l’environnement dans lequel elles se produisent. Cela aide à rendre les choses comme les drapeaux qui volent ou les objets qui tombent plus réels. Dans ce projet, on a fait l’animation d’un drapeau sous l’action du vent.

## 2. Système masse-ressort dans la simulation de drapeau
Dans la simulation de drapeau, un système masse-ressort est utilisé pour modéliser le tissu du drapeau. Ce système est constitué de particules (les masses) reliées entre elles par des ressorts et des forces d’atténuation (amortisseurs).

### Ressorts :
Les ressorts interconnectent les particules du maillage du drapeau. Ces ressorts sont caractérisés par une constante de résistance ”k”, représentant la rigidité du matériau du drapeau. La force appliquée par ces ressorts est proportionnelle à la déformation du drapeau, calculée par la différence entre la longueur actuelle des ressorts et leur longueur de repos.

### Amortisseurs :
Les amortisseurs, des éléments qui atténuent les oscillations et aident à dissiper l’énergie du mouvement du drapeau.

### Gestion des déformations et des déplacements :
Grâce à ce système masse-ressort, la simulation du drapeau peut gérer les déformations et les déplacements d’une manière réaliste, reflétant la réponse du tissu aux forces du vent. Les mouvements résultants sont une combinaison des forces de résistance des ressorts et des interactions dynamiques entre les particules, permettant ainsi des animations fluides et réalistes du drapeau.

## 3. Forces appliquées sur le drapeau
La simulation du drapeau utilise un système de forces pour imiter le mouvement réaliste du tissu sous l’effet du vent.

Dans notre code, plusieurs forces sont appliquées pour simuler ce comportement dynamique :
- Force du ressort
- Force du vent

## 4. Notre implémentation
Notre implémentation est une animation de drapeau sous l’effet du vent en utilisant un maillage déformable élastique.

Voici une explication détaillée des principales parties de notre code :
- Structure du maillage et des particules
- Classe Grid pour la simulation
- Simulation de forces et de vent
- Rendu graphique
- Interaction utilisateur

## 5. Conclusion
Ce projet de simulation d’animation d’un drapeau, effectué en binôme, a été une expérience enrichissante. Nous avons réussi à créer une représentation réaliste d’un drapeau animé par le vent. Nous avons appris à modéliser un maillage déformable utilisant des particules et des ressorts, ainsi qu’à appliquer des forces de vent simulées pour générer un mouvement réaliste du drapeau. Même si des défis ont été rencontrés, cette expérience nous a permis de renforcer nos compétences en programmation et en simulation physique.
