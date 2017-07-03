// eLKa1
// Assembly
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

ouvert=0; // 1->ouvert 0->fermé
assemblage=1;
include <config.scad>;
use <modules.scad>;
use <sa_chassis_y.scad>;
use <sa_chassis_xz.scad>;
use <molette_m6.scad>;

if (ouvert==1){
  chassis_y_equipe(largeur,longueur,hauteur_base,decal);
  chassis_xz_equipe(largeur,hauteur);
  copy_mirror([1,0,0]){
    translate([largeur/2,decal,15]) rotate([0,90,0]) molette_m6();
    translate([largeur/2,decal,hauteur_base-15]) rotate([0,90,0]) molette_m6();
  }
}
else {
  chassis_y_equipe(largeur,longueur,hauteur_base,decal);
  translate([hauteur/2,0,decal+15+hauteur_base+eq_ec+30*2]) rotate([90,0,-90]){
    chassis_xz_equipe(largeur,hauteur);
      copy_mirror([1,0,0]){
      translate([largeur/2-30,decal,15]) rotate([0,90,0]) molette_m6();
      translate([largeur/2-30,decal,hauteur_base-15]) rotate([0,90,0]) molette_m6();
    }
  }
}