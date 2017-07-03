// eLKa1
// equerre
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;
use <molette_m5.scad>;

module equerre3(assemblage){
  lar=25;   // largeur
  tri=32;   // triangle, hauteur
  mep=10;   // méplat
  diam=vis5; // diamètre trou
  diam2=17; // diamètre lamage
  ep=5;     // épaisseur
  lan=10;   // longueur de la languette

  vis=vis5;  // diamètre vis de serrage
  pro=30;   // profilé
  tet=10;   // diamètre tête de vis
  
  echo ("equerre3");
  // Liste vitamines
  echo ("├ écrou m5");
  echo ("└ vis H M5 x 25");
  
  color (couleur)
  translate([mep,0,0])
  difference(){
    union(){
      rotate([90,0,0]) linear_extrude(lar, center=true) polygon([[tri,0],[0,tri],[0,0]]);
      translate([-mep,-lar/2,0]) cube([mep,lar,tri]);
      translate([-mep-lan,-lar/2,0]) cube([lan,lar,eq_ec]);
    }
    //vis de fixation
    translate([tet/2,0,-1]) cylinder(h=tri+2, d=diam, $fn=16);
    // lamage
    hull(){
      translate([diam2/2,0,ep]) cylinder(h=tri+2, d=diam2, $fn=32);
      translate([tri,0,ep]) cylinder(h=tri+2, d=diam2, $fn=32);
    }
    // dégagement arrière
    translate([tet/2+diam/2+3,-diam2/2,-1]) cube([tri,diam2,ep+2]);
    // écrou
    hull(){
    translate([-mep+1.5,0,eq_ec+pro/2]) rotate([0,90,0]) ecrou(ec5+jec,ec5h);
    translate([-mep+1.5,0,tri]) rotate([0,90,0]) ecrou(ec5+jec,ec5h);
    }
    // vis de serrage
    translate([-mep-lan-1,0,eq_ec+pro/2]) rotate([0,90,0]) cylinder(h=lan+mep+tri+2, d=vis5, $fn=16);
  }
  if(assemblage==1){
   translate([mep+15,0,eq_ec+30/2]) rotate([0,90,0])  molette_m5();
  }

}

equerre3();