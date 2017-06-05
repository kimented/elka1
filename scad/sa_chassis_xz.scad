include <config.scad>;
use <modules.scad>;
use <profile3030.scad>;
use <spool_holder.scad>;
use <prusa3-vanilla/x-end-idler.scad>
use <prusa3-vanilla/x-end-motor.scad>
include <mcad/stepper.scad>;
use <z_bar.scad>;
use <z_motor.scad>;

// Chassis XZ profilé 3030
module chassis_xz(x,z){
  
  translate([0,decal,0]){  
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
  copy_mirror([1,0,0]) translate([x/2-30-15,-15+decal,z-10]) rotate([0,180,180]) z_bar_l();
  copy_mirror([1,0,0])
  translate([-x/2+30+15,-15+decal,60])
  rotate([0,0,180]) z_motor_l();  
  copy_mirror([1,0,0]) translate([x/2-30-42/2,decal-pos_z-15,60]) {
    rotate([180,0,0]) color ("lightgrey") motor(Nema17);
    cylinder(h=340, d=5);
    translate([entraxe_z,0,0]) cylinder(h=340, d=8);
  }
  color("turquoise") translate([largeur/2-30-6,decal-15-pos_z,250]) rotate([180,0,-90]) x_end_idler();

  color("turquoise") translate([-largeur/2+30+6,decal-15-pos_z,250]) rotate([180,0,-90])x_end_motor();
  
}

chassis_xz_equipe(largeur,hauteur);
