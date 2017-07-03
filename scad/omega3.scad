// eLKa1
// omega
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
module omega3(){

  ep=7;       // épaisseur
  diam=5.5;   // diamètre des trous
  pro=30;     // profilé
  lar=20;     // largeur
  ch=2;       // chanfrein extérieur
  ch2=0.5;    // chanfrein rainure
  ra=7;       // largeur rainure
  ra2=6;      // profondeur rainure
  ob=10;      // entraxe trou oblong
  lar2=12;    // largeur des fixations

  echo ("omega3");
  
  module patte () {
  translate([-pro/2,0,0])
  linear_extrude(height=lar, center=true, convexity=10)
    polygon([[0,0],[0,-ep+pro/2+eq_ec-ra/2-ch2],[0+ch2,-ep+pro/2+eq_ec-ra/2],[ra2-ch2,-ep+pro/2+eq_ec-ra/2],[ra2,-ep+pro/2+eq_ec-ra/2+ch2],[ra2,-ep+pro/2+eq_ec+ra/2-ch2],[ra2-ch2,-ep+pro/2+eq_ec+ra/2],[-ep+ch,-ep+pro/2+eq_ec+ra/2],[-ep,-ep+pro/2+eq_ec+ra/2-ch],[-ep,0+ch],[-ep-ch,0]]);
  }
  color (couleur)
  translate([0,ep,0]){
    difference(){
      union(){
        patte();
        scale([-1,1,1]) patte();
        translate([-pro/2-lar2-ep,-ep,-lar/2]) cube([pro+2*ep+2*lar2, ep, lar]);
      }
      translate([-pro/2-ep-ch-(lar2-ch)/2,1,0]) rotate([90,0,0]) cylinder(h=ep+2,d=diam,$fn=16);
      translate([pro/2+ep+ch+(lar2-ch)/2,1,0]) rotate([90,0,0]) cylinder(h=ep+2,d=diam,$fn=16);
      // chanfreins
      hull(){
        translate([-pro/2,0,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([pro/2,0,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([-pro/2,-ep+pro/2+eq_ec-ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([pro/2,-ep+pro/2+eq_ec-ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
      }
      hull(){
        translate([-pro/2+ra2,eq_ec+pro/2+ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([pro/2-ra2,eq_ec+pro/2+ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([-pro/2+ra2,-ep+pro/2+eq_ec-ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([pro/2-ra2,-ep+pro/2+eq_ec-ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
      }
      hull(){
        translate([-pro/2-ep,-ep+pro/2+eq_ec+ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
        translate([pro/2+ep,-ep+pro/2+eq_ec+ra/2,lar/2-ch]) rotate([0,0,45]) cylinder(d1=0, d2=(ch*2+2)*sqrt(2), h=ch+1, $fn=4);
      }
    }
    translate([0,0,0]) rotate([90,0,180]) linear_extrude(0.6) text("eLKa", halign="center", valign="center",size=9);
  }
}

omega3();