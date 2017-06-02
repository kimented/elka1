// Pour courroie GT2
include <config.scad>;
use <modules.scad>;

module y_belt_holder(){
  ep=3;           // épaisseur
  vis=vis4;       // vis de fixation
  entraxe=45;     // entraxe des vis
  rayon=3;        // arrondis
  longueur=35;    // longueur des attaches
  diam=10;        // diamètre des attaches

  largeur=5;      // largeur supplémentaire du corps
  $fn=32;
  
  echo ("y_belt_holder");

  color(couleur){
    difference(){
    // platine
      hull() {
        copy_mirror([1,0,0]) translate([entraxe/2,0,0]) cylinder(d=vis+8,h=ep);
        //#copy_mirror([1,0,0]) translate([longueur/2-diam/2,largeur,0]) cylinder(d=diam,h=ep);
        copy_mirror([1,0,0]) translate([8,largeur,0]) cylinder(d=diam,h=ep);
      }
      // trous des vis
      copy_mirror([1,0,0]) translate([entraxe/2,0,-1]) cylinder(d=vis,h=ep+2);
      copy_mirror([1,0,0]) translate([entraxe/2,0,ep-2]) cylinder(d1=vis, d2=vis+6,h=3);
    }

    // corps
    difference(){
      hull() {
        copy_mirror([1,0,0]) translate([longueur/2-diam/2,0,0]) cylinder(d=diam,h=belt_h+7);
        copy_mirror([1,0,0]) translate([8,largeur,0]) cylinder(d=diam,h=belt_h+7);
      }
      // courroie
      translate([-longueur/2-1,0,belt_h]) cube([longueur+2,1.2,7+1]);
      // dents
      for (i=[0:2:longueur]){
        translate([-longueur/2-1+i,0-1.2,belt_h]) cube([1.2,1.2+1,7+1]);
      }
      translate([-5/2,0,belt_h]) cube([5,largeur+diam/2+1,7+1]);
      
      copy_mirror([1,0,0]){
        translate([-5/2-rayon,rayon+1.2,belt_h])
        rotate([0,0,-90])
        difference(){
          cube([rayon+1,rayon+1,7+1]);
          cylinder(r=rayon,h=7+1);
        }
        translate([-5/2-rayon,diam/2+largeur-rayon,belt_h])
        //rotate([0,0,-90])
        difference(){
          cube([rayon+1,rayon+1,7+1]);
          cylinder(r=rayon,h=7+1);
        }
      }
    }
  }
}

y_belt_holder();