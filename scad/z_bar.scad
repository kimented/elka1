// eLKa1
// z_bar
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

module z_bar_l(){
  ep=3;
  
  color(couleur) translate([-42/2+30/2,pos_z,0]){
    // fixation face
    difference(){
      translate([-(30-42/2),-pos_z,0]) cube([30,ep,hauteur_z]);
      translate([42/2-30/2, -pos_z-1,hauteur_z/2]) rotate([-90,0,0]) cylinder(h=ep+2, d=vis5, $fn=16);
    }
    // fixation coté
    /*difference(){
      translate([42/2-30,-pos_z-30,0]) cube([ep,30,hauteur_z]);
      translate([42/2-30-1,-pos_z-30/2,hauteur_z/2]) rotate([0,90,0]) cylinder(d=vis5, h=ep+2, $fn=16);}*/
    // nervure
    translate([42/2-ep,0,0])
    difference(){
      hull(){
        translate([0,-1,0]) cube([ep,1,ep+5]);
        translate([0,-pos_z+ep,0]) cube([ep,ep,hauteur_z]);
      }
      translate([-1,-pos_z-1,-1.1]) cube([ep+2, 42/2+pos_z+2, ep+1]);
      // trou tige
      translate([-42/2+ep+entraxe_z-decalx,0,-1]) cylinder(d=8.2, h=hauteur_z+2, $fn=24);
    }
    // tige 8
    translate([entraxe_z,0,0]){
      difference(){
        union(){
          hull(){
            translate([-decalx,0,0]) cylinder(d=8+2*2, h=ep, $fn=24);
            translate([-(30-42/2)-entraxe_z,-pos_z,0]) cube([30,ep,ep]);
          }
          translate([-decalx,0,0]) cylinder(d=8+2*2, h=8, $fn=24);
          translate([-5-decalx,0,0]) cube([8,8/2+8,ep+5],convexity=15);
        }
        // trou tige
        translate([-decalx,0,-1]) cylinder(d=8.2, h=8+2, $fn=24);
        // rainure
        translate([-1-decalx,-1,-1]) cube([2,8/2+8+2,ep+5+2]);
        // vis
        translate([-10-decalx,8,4]) rotate([0,90,0]) cylinder(h=20, d=vis3, $fn=12);
        translate([-5+-1-decalx,8,4]) rotate([0,90,0]) ecrou(5.5, ec3h+1);
      }
    }
  }
}

z_bar_l();