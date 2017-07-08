// eLKa1
// sa_chassis_xz
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;
use <profile3030.scad>;
use <spool_holder.scad>;
use <prusa3-vanilla/x-end-idler.scad>
use <prusa3-vanilla/x-end-motor.scad>
include <mcad/stepper.scad>;
use <z_axis_top.scad>;
use <z_axis_bottom.scad>;
use <x_carriage.scad>;
use <sensor_holder.scad>;

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
  copy_mirror([1,0,0]) translate([-x/2+30+15,+15+decal,z-10]) rotate([0,180,0]) z_axis_top_l();
  copy_mirror([1,0,0])
  translate([x/2-30-15-decalx,15+decal,60])
  z_axis_bottom();
  copy_mirror([1,0,0]) translate([x/2-30-42/2-decalx,decal+pos_z+15,60]) {
    rotate([180,0,0]) color ("lightgrey") motor(Nema17);
    color ("lightgrey") cylinder(h=340, d=5);
    translate([entraxe_z,0,0]) color ("lightgrey") cylinder(h=340, d=8);
  }
  translate([0,0,250]){
    // x_idler et x_motor de Prusa Vanilla
    // x_carriage compatible avec prusa i3 rework
    color("turquoise") translate([-largeur/2+30+6,decal+15+pos_z,0]) rotate([180,0,90]) x_end_idler();
    color("turquoise") translate([largeur/2-30-6,decal+15+pos_z,0]) rotate([180,0,90]) x_end_motor();
    translate([89,decal+pos_z,-29]){
      translate([0,0,0]) rotate([90,0,0]) x_carriage();
      translate([-he_x/2-sen_x,lbd/2+4,0]) rotate([90,0,180]) sensor_holder();
      translate([-220,0,-entraxe_x/2]) rotate([0,90,0]) color ("lightgrey") cylinder(h=265, d=8);
      translate([-220,0,+entraxe_x/2]) rotate([0,90,0]) color ("lightgrey") cylinder(h=265, d=8);
    }
  }
}

chassis_xz_equipe(largeur,hauteur);
