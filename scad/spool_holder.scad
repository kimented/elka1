include <config.scad>;
use <spool_rondelle.scad>;

module spool_holder(assemblage,sym) {
  
  pro=31;   // profilé
  ra=8;     // largeur rainure
  ra2=3;    // profondeur rainure
  lar=20;   // largeur
  ep=5;     // épaisseur
  pla=8.3;  // plats écrou
  pla2=4;   // épaisseur écrou
  vis=5.5;  // vis de serrage
  rou1=16;  // extérieur roulement
  rou2=8.5; // intérieur roulement
  x=60;     // position roulement
  y=20;     // position roulement
  e=5;      // écart du roulement

  if (sym==1){
    echo ("spool_holder (symétrie)");
  }
  else{
    echo ("spool_holder");
  }
  
  jeu=sqrt(pro*pro+((pro-ra)/2)*((pro-ra)/2))-pro;
  
  color( couleur ) {
    // patte avant
    linear_extrude(lar) polygon([[pro/2,0],[pro/2,-pro/2+ra/2],[pro/2-ra2,-pro/2+ra/2-ra2],[pro/2-ra2,-pro/2-ra/2],[pro/2+ep,-pro/2-ra/2],[pro/2+ep,0]]);

    // arrière
    difference(){
      translate([-ep-pro/2-jeu,-(pro+ra)/2,0]) cube([ep,(pro+ra)/2,lar]);
      translate([-pro/2-jeu-pla2,-pro/2,lar/2]) rotate([0,90,0]) cylinder(d=pla*2/sqrt(3), h=pla2+1, $fn=6);
      translate([-pro/2-jeu-ep-1,-pro/2,lar/2]) rotate([0,90,0]) cylinder(d=vis, h=ep+2, $fn=16);
    }
    // dessus
    translate([-jeu-pro/2-ep,0,0]) cube([2*ep+jeu+pro,ep,lar]);

    difference(){
      union(){
        // Bras droit
        hull(){
          translate([pro/2,0,0]) cylinder(d=rou1, h=ep);
          translate([x,y,0]) cylinder(d=rou1, h=ep);
        }
        // Bras gauche
        hull(){
          translate([-pro/2,0,0]) cylinder(d=rou1, h=ep);
          translate([-x,y,0]) cylinder(d=rou1, h=ep);
        }
        // entretoise pour roulement
        translate([x,y,0]) cylinder(d=rou2+5, h=ep+e, $fn=16);
        translate([-x,y,0]) cylinder(d=rou2+5, h=ep+e, $fn=16);
      }
      translate([-pro/2-jeu,-pro,-1]) cube([pro+2*jeu,pro,lar+2]);
      // trous pour roulements
      translate([x,y,-1]) cylinder(d=rou2, h=ep+e+2, $fn=16);
      translate([-x,y,-1]) cylinder(d=rou2, h=ep+e+2, $fn=16);
    }
    if (assemblage==1){
      translate([x,y,ep+e-2]) spool_rondelle();
      translate([-x,y,ep+e-2]) spool_rondelle();
      //color( "DeepSkyBlue" ) {translate([0,94,15]) cylinder(h=50, d=160, $fn=64);}
      
    }
  }

}

module spool_holder_sym(assemblage) {
  mirror([0,0,1]) spool_holder(assemblage,1);
}

spool_holder();


//translate([x,y,10]) cylinder(h=1, d=30);
