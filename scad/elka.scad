assemblage=1;
include <config.scad>;
use <modules.scad>;
use <sa_chassis_y.scad>;
use <sa_chassis_xz.scad>;
use <molette_m6.scad>;
chassis_y_equipe(largeur,longueur,hauteur_base,decal);
chassis_xz_equipe(largeur,hauteur);
copy_mirror([1,0,0]){
  translate([largeur/2,decal,15]) rotate([0,90,0]) molette_m6();
  translate([largeur/2,decal,hauteur_base-15]) rotate([0,90,0]) molette_m6();
}