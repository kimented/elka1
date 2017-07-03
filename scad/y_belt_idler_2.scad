// eLKa1
// y_belt_idler_2
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

module y_belt_idler_2(){
  ep=4;
  hauteur=11; //14
  largeur=24; //20
  ecart=14;
  $fn=32;
  vis=vis4;
  ec=ec4;
  ech=ec4h;
  
  
  long=60;
  prof=15;
    
  color (couleur){
    //cylinder(d=largeur, h=ecart);
    //translate([])
    difference(){
      union(){
        cube([long,prof,hauteur+2*ep], center=true);
        translate([-long/2+8,prof/2,0]) cylinder(d=10, h=hauteur+2*ep, center=true);
      }
      // trou roulement
      hull(){
        cylinder(h=hauteur, d=18, center=true);
        translate([0,prof,0]) cylinder(h=hauteur, d=18, center=true);
      }
      cylinder(d=vis4, h=hauteur+2*ep+2, center=true);
      // axe
      translate([long/2-6,0,0]) cylinder(d=vis4, h=hauteur+2*ep+2, center=true);
      // serrage
      hull(){
        rotate([90,0,0]) translate([-long/2+5,0,0]) cylinder(d=vis4, h=prof+10+2, center=true);
        rotate([90,0,0]) translate([-long/2+11,0,0]) cylinder(d=vis4, h=prof+10+2, center=true);
      }
    }
    
  }
}

y_belt_idler_2();