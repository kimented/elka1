// eLKa1
// y_lm8uu
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;
//color ("blue", 0.5)
//import ("stl/y_support_plateau.stl");

module y_lm8uu(){
  largeur=35;
  hauteur=24;
  ep=5;
  entraxe=30;
  
  echo ("y_lm8uu");
  
  color (couleur)
  difference(){
    union(){
      // platine de fixation
      hull(){
        translate([-largeur/2,0,-hauteur/2]) cube([largeur,ep,hauteur]);
        copy_mirror([1,0,0]) translate([entraxe/2,0,0]) rotate([-90,90,0]) ecrou(ec3+4, ep);
      }
      // contour lm8uu
      hull(){
        translate([0,decal_plateau,0]) cylinder(d=20,h=hauteur, $fn=32, center=true);
        translate([-20/2,0,-hauteur/2]) cube([20,ep,hauteur]);
      }
      
    }
    // vis et écrous
    copy_mirror([1,0,0]) translate([entraxe/2,-1,0]) rotate([-90,0,0]) cylinder(d=vis3, h=ep+2, $fn=16);
    copy_mirror([1,0,0]) translate([entraxe/2,2,0]) rotate([-90,90,0]) ecrou(ec3,ep);
    
    // passage du lm8uu
    translate([0,decal_plateau,0]) cylinder(d=14.5,h=hauteur+2, $fn=32, center=true);
    translate([-2,decal_plateau,-hauteur/2-1]) cube([4,15,hauteur+2]);
  }
  
  
}

y_lm8uu();
