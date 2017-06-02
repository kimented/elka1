include <config.scad>;

module molette_m5(){

  n=12;     // nombre de moletages
  lar=1.5;  // largeur des moletages
  h=5;      // hauteur totale
  d=15;     // diamètre extérieur
  ch=3;     // hauteur du chanfrein
  plat=8.2; // sur plats 6 pans
  vis=5.5;  // diamètre de la vis
  plat2=4;  // hauteur des plats de serrage

  echo ("molette_m5");

  color (couleur) {
    difference(){
      union(){
        translate([0,0,ch]) cylinder(h=h-ch, d=d, $fn=n*3);
        cylinder(h=ch, d2=d, d1=d-ch*2, $fn=n*3);
      }
      
      for(i=[0:1:n-1]){
        rotate([0,0,360/n*i]) translate([-lar/2,d/2-1,-1]) cube([lar,5,h+2]);
      }
      translate([0,0,h-plat2]) cylinder(d=plat*2/sqrt(3), h=plat2+1, $fn=6);
      translate([0,0,-1])cylinder(d=vis, h=h+2, $fn=16);
      //cube([30,30,30]); //coupe
    }
  }
}

molette_m5();