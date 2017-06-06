include <config.scad>;
use <modules.scad>;

module z_motor_l(){
  ep=3;
  color(couleur)
  translate([-42/2+30/2,pos_z,0]){
    difference(){
      // base
      hull(){
        translate([31/2+decalx,31/2,0]) cylinder(d=(42-31), h=ep, $fn=12);
        translate([-31/2,31/2,0]) cylinder(d=(42-31), h=ep, $fn=12);
        translate([-42/2,-pos_z,0]) cube([42+decalx,1,ep]);
      }
      // trou axe moteur
      translate([0,0,-1]) cylinder(d=23, h=ep+2, $fn=32);
      // trous fix moteur
      for (i=[1:4]) rotate ([0,0,90*i]) translate([31/2,31/2,-1]) cylinder(d=4, h=ep+2, $fn=12);
    }
    // fixation face
    difference(){
      translate([-(30-42/2)+decalx,-pos_z,0]) cube([30,ep,hauteur_z]);
      translate([42/2-30/2+decalx, -pos_z-1,hauteur_z/2]) rotate([-90,0,0]) cylinder(h=ep+2, d=vis5, $fn=16);
    }
    // fixation coté
    difference(){
      translate([42/2-30-ep+decalx,-pos_z-30,0]) cube([ep,30,hauteur_z]);
      translate([42/2-30-ep+decalx-1,-pos_z-30/2,hauteur_z/2]) rotate([0,90,0]) cylinder(d=vis5, h=ep+2, $fn=16);}
    // nervure droite
    translate([-42+30+decalx,0,0])
    difference(){
      hull(){
        translate([0,42/2-ep,ep]) rotate([0,90,0]) cylinder(h=ep, d=2*ep, $fn=16);
        translate([0,-pos_z,0]) cube([ep,ep*2,hauteur_z]);
      }
      translate([-1,-pos_z-1,-1.1]) cube([ep+2, 42/2+pos_z+2, ep+1]);
    }
    translate([42/2+decalx-ep,0,0])
    // nervure gauche
    difference(){
      hull(){
        translate([0,-1,ep]) cube([ep,1,7]);
        translate([0,-pos_z,0]) cube([ep,ep*2,hauteur_z]);
      }
      translate([-1,-pos_z-1,-1.1]) cube([ep+2, 42/2+pos_z+2, ep+1]);
      //trou tige
      translate([-4-2+ep,0,ep]) cylinder(d=8+0.2, h=hauteur, $fn=24);
    }
    // tige 8 + ecrou prisonier
    translate([entraxe_z,0,0])
    difference(){
      union(){
        cylinder(d=8+2*2, h=7+ep, $fn=24);
        translate([-4,0,0]) cube([8,ec3h+8/2+3,7+ep]);
      }
      translate([0,0,ep]) cylinder(d=8+0.2, h=7+1, $fn=24);
      hull(){
        translate([0,8/2+1,ep+8/2]) rotate([-90,90,0]) ecrou(5.7,ec3h+0.3);
        translate([0,8/2+1,ep+8]) rotate([-90,90,0]) ecrou(5.7,ec3h+0.3);
      }
      translate([0,0,ep+8/2]) rotate([-90,90,0]) cylinder(d=vis3, h=8+8, $fn=16);
      // trou axe moteur
      translate([-entraxe_z,0,-1]) cylinder(d=23, h=ep+2, $fn=32);
    }
  }
}

z_motor_l();