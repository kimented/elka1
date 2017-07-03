// eLKa1
// y_motor
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>

module y_motor(){
  largeur=44;
  ep=4;
  entraxe=31;
  
  decaly=decal_motory_y-ep;
  decalz=decal_motory_z-ep;
  profondeur=decaly+entraxe/2+5;
  $fn=32;
  echo ("motor_y");
  
  color(couleur)
  translate([0,ep,-decalz])
  difference(){
    union(){
      translate([-largeur/2-ep,-ep,-ep]) cube([largeur+2*ep,profondeur+ep,ep]);
      translate([-largeur/2-ep,-ep,0]) cube([largeur+2*ep,ep,decalz+13]);
      copy_mirror([1,0,0]) translate([-largeur/2,0,0]) rotate([0,-90,0]) linear_extrude(ep) polygon([[0,0],[decalz+13,0],[0,profondeur]]);
      copy_mirror([1,0,0]) translate([largeur/2+ep,-ep,decalz-6/2]) rotate([90,0,-90]) linear_extrude(8) polygon([[0,0],[0,6],[1,6],[1,1]]);
    }
    translate([0,decaly,-ep-1]) cylinder(d=25, h=ep+2);
    translate([0,decaly,-ep-1])
    for (i=[0:3]){
      rotate([0,0,90*i]) translate([entraxe/2,entraxe/2,0]) cylinder(d=vis3, h=ep+2);
    }
    translate([0,-ep-1,decalz]) rotate([-90,0,0]) cylinder(d=vis5, h=ep+2);
    translate([0,-2,decalz]) rotate([-90,0,0]) cylinder(d1=vis5, d2=vis5+6, h=3);
    
  }
}

y_motor();