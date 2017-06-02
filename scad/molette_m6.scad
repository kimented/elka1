include <config.scad>;
use <modules.scad>;

module molette_m6(){

  n=18;     // nombre de moletages
  lar=1.5;  // largeur des moletages
  h=7;      // hauteur totale sans alonge
  d=20;     // diamètre extérieur
  ch=3.5;     // hauteur du chanfrein
  alonge=5; // hauteur supplémentaire



  echo ("molette_m6");
  translate([0,0,alonge])
  color (couleur) {
    difference(){
      union(){
        translate([0,0,ch]) cylinder(h=h-ch, d=d, $fn=n*3);
        cylinder(h=ch, d2=d, d1=d-ch*2, $fn=n*3);
      }
      
      for(i=[0:1:n-1]){
        rotate([0,0,360/n*i]) translate([-lar/2,d/2-1,-1]) cube([lar,5,h+2]);
      }
      translate([0,0,h-ec6h]) ecrou(ec6,ec6h+1);
      translate([0,0,-1]) cylinder(d=vis6, h=h+2, $fn=16);
      //cube([30,30,30]); //coupe
    }
    if (alonge != 0){
      difference(){
        translate([0,0,-alonge]) cylinder(d=20-2*ch, h=alonge, $fn=n*3);
        translate([0,0,-alonge-1]) cylinder(d=vis6, h=alonge+2, $fn=16);
      }
    }
  }
}

molette_m6();