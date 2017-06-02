include <config.scad>;
use <modules.scad>;
use <profile3030.scad>;
use <spool_holder.scad>;


// Chassis XZ profilé 3030
module chassis_xz(x,z){
  
  translate([0,decal,0]){
    color(couleur) copy_mirror([1,0,0]) translate([x/2-30,-15,60]) rotate([90,0,0]) import ("stl/f1_eq_moteur_z_droite.stl");
  color(couleur) copy_mirror([1,0,0]) translate([x/2-30,-15,z-10]) rotate([90,180,0]) import ("stl/support_tige8.stl");  
    color("gray") { 
      // deux barres z
      //echo (str("1x profile 3030 l=", z , "mm"));
      copy_mirror([1,0,0]) translate([-x/2+15+30,0,z/2]) profile3030(z);
      
      // barre x
      //echo (str("1x profile 3030 l=", x-2*30 , "mm"));
      translate([0,0,z-30/2]) rotate([0,90,0]) profile3030(x-4*30);
    
    }
  }
}

// Habillage du chassis
module chassis_xz_equipe(x,z){
  chassis_xz(x,z);
  translate([-50,decal,hauteur]) rotate([90,0,90]) spool_holder(1);
  translate([50,decal,hauteur]) rotate([90,0,90]) spool_holder_sym(1);
}

chassis_xz_equipe(largeur,hauteur);