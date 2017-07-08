// Paramètres de la machine

decal=-30;            // décallage du chassis xz
hauteur=400;          // hauteur totale chassis
largeur=400;          // largeur totale chassis
longueur=470;         // longueur totale chassis
hauteur_base=90;      // hauteur de la base
entraxe_y=140;        // distance entre les tiges Ø8 axe Y
entraxe_x=45;         // distance entre les tiges Ø8 axe X

couleur=[1,0.6,0];


// Plats écrous
ec3=5.7;
ec4=7.2;
ec5=8.2;
ec6=10.2;

// Jeu sur plats pour les écrous glissants
jec=0.2;

// hauteur écrous
ec3h=2.4;
ec4h=3.2;
ec5h=4.7;
ec6h=5.2;

// Vis
vis3=3.5;
vis4=4.5;
vis5=5.5;
vis6=6.5;


// Paramètre des pièces et jeux

// écart plateau/courroie
// y_belt_holder
belt_h=13;      // écart entre la courroie et le plateau

// écart plateau/tiges lisses
// y_lm8uu
decal_plateau=12; // Décallage en Y

// décallage des tiges lisses Y
// support_tige8_y
decal_tiges=5;

// décallage moteur Y
// y_motor
decal_motory_z=11;
decal_motory_y=25;

// Equerres de fixation position fermée
eq_ec=10;      // écart entre profilés

// Fixations axe Z
pos_z=26;      // position des axes par rapport au profilé (>= 21)
hauteur_z=20;  // hauteur des fixations
entraxe_z=17;  // distance entre les tiges Ø8 et M5
// est ce que la tige de 8 dépasse du profilé de 30?
// si oui, on décale les fixations
decalx=max(-42/2+entraxe_z+8/2+2, 0);

// Roulements linéaires
lbd = 15; // diamètre ext
lbh = 24; // hauteur

// x_carriage
he_x=23;  // entraxe hotend x
he_y=23;  // entraxe hotend y
sen_x=20; // entraxe capteur x
sen_y=23; // entraxe capteur y

// sensor_holder
sen_ep=3;   // épaisseur
sen_d=12.5; // diamètre du capteur
sen_pos=0;  // décentrage en x du capteur
sen_z=7;    // position Z de la bague

// y_belt_idler
ybi_ep1=4;       // épaisseur de la partie fixe
ybi_ep2=4;       // épaisseur de la partie mobile
ybi_h=16;        // position de l'axe
ybi_ec=11;       // écart pour le passage du ou des roulement
ybi_vis=vis4;    // diamètre passage de vis (axe)
ybi_ecrou=ec4;   // plat écrou
ybi_ecrouh=ec4h; // hauteur écrou
ybi_long=60;     // longueur de la partie mobile entre axes
ybi_prof=15;     // largeur de la partie mobile


// nombre de dents des poulies
poulie=20;

// Pas des courroies
pas=2;

// diamètre des poulies
dpoulie=poulie*pas/3.1416;