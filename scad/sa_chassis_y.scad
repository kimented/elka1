// eLKa1
// sa_chassis_y
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;
use <profile3030.scad>;
use <equerre3.scad>;
use <equerre4.scad>;
use <omega3.scad>;
use <cache.scad>;
use <support_tige8_y.scad>;
use <y_lm8uu.scad>;
use <y_belt_holder.scad>;
use <y_motor.scad>;
use <y_belt_idler_1.scad>;
use <y_belt_idler_2.scad>;
include <mcad/stepper.scad>;


module chassis_y(x,y,z,decalage){
  color("gray") { 
    // quatre pieds
    //echo (str("6x profiles 3030 l=", z-30 , "mm"));
    copy_mirror([1,0,0]) copy_mirror([0,1,0]) translate([x/2-30/2,y/2-30/2,(z-30)/2]) profile3030(z-30);
    
    // deux pieds
    copy_mirror([1,0,0]) translate([x/2-30/2,decalage,(z-30)/2]) profile3030(z-30);
    
    // deux barres y
    //echo (str("2x profiles 3030 l=", y-2*30 , "mm"));
    copy_mirror([1,0,0]) translate([-x/2+15,0,z-30/2]) rotate([90,0,0]) profile3030(y-2*30);
    
    // deux barres x
    //echo (str("2x profiles 3030 l=", x , "mm"));
    copy_mirror([0,1,0]) translate([0,-y/2+15,z-30/2]) rotate([0,90,0]) profile3030(x);

  }
}

module chassis_y_equipe(largeur,longueur,hauteur_base,decal){
  chassis_y(largeur,longueur,hauteur_base,decal);
  color([0.2,0.2,0.2]) translate([-largeur/2,-longueur/2,-6]) cube([largeur,longueur,6]);
  copy_mirror([1,0,0]) color("lightgray") translate([-entraxe_y/2,0,hauteur_base-30/2+5]) rotate([90,0,0]) cylinder(d=8,h=longueur-30*2, center=true);
  
  
  translate([-largeur/2+30/2,largeur/2-30,hauteur_base]) rotate([0,0,90]) equerre3(1);
  translate([-largeur/2+30/2,-largeur/2+30,hauteur_base]) rotate([0,0,-90]) equerre4();
  translate([largeur/2-30/2,largeur/2-30-15,hauteur_base]) rotate([90,0,-90]) omega3();
  translate([largeur/2-30/2,-largeur/2+30+15,hauteur_base]) rotate([90,0,-90]) omega3();
  translate([largeur/2-30,longueur/2-30,0]) rotate([90,0,-90]) cache();
  copy_mirror([0,1,0]) copy_mirror([1,0,0]) translate([entraxe_y/2,longueur/2-30,hauteur_base-30/2]) rotate([90,0,0]) support_tige8_y();
  copy_mirror([0,1,0]) copy_mirror([1,0,0]) translate([entraxe_y/2,80,hauteur_base-30/2+decal_plateau+decal_tiges]) rotate([-90,0,0]) y_lm8uu();
  
  color ([0.2,0.2,0.2]) translate([-110,-110,hauteur_base-15+decal_tiges+decal_plateau]) cube([220,220,6]);
  color ([1,0.2,0.2]) translate([-110,-110,hauteur_base-15+decal_tiges+decal_plateau+6+10]) cube([220,220,2]);
  translate([poulie/3.1416,0,hauteur_base-30/2+decal_plateau+decal_tiges]) rotate([180,0,90]) y_belt_holder();
  
  // Moteur Y
  translate([0,-longueur/2+30,hauteur_base-30/2]) rotate([180,180,180]) y_motor();
  translate([0,-longueur/2+30+decal_motory_y,hauteur_base-30/2-decal_motory_z]) rotate([180,0,0]) color("lightgrey") motor(Nema17);
  // Tendeur Y
translate([0,-longueur/2+30,hauteur_base-30/2]) rotate([180,180,180]) y_motor();
  
  // Courroie Y
  translate([0,-longueur/2+30+decal_motory_y,hauteur_base-30/2-3]) rotate([0,0,90]) courroie(2*poulie/3.1416,longueur-90);
  // Tendeur Y
  translate([-25,longueur/2-30,hauteur_base-30/2]) rotate([-90,0,180]) y_belt_idler_1();
  translate([0,longueur/2-30-16,hauteur_base-30/2]) rotate([0,0,180]) y_belt_idler_2();
  
}

chassis_y_equipe (largeur,longueur,hauteur_base,decal);