// eLKa1
// x_carriage
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

//import("stl/support_tige8_y.stl");

module lb_clip(){
  difference([]){
    translate([0,0,0]) rotate([0,90,0]) cylinder(d=lbd+4, h=lbh+4);
    translate([-1,0,0]) rotate([0,90,0]) cylinder(d=lbd, h=lbh+4+2);
    translate([-1,-(lbd+4+2)/2,3]) cube([lbh+4+2,lbd+4+2,lbd]);
  }
  difference(){
    union(){
      translate([0,0,0]) rotate([0,90,0]) cylinder(d=lbd+4, h=1.5);
      translate([lbh+2.5,0,0]) rotate([0,90,0]) cylinder(d=lbd+4, h=1.5);
    }
    translate([-1,-(lbd+4+2)/2, -(lbd)/2+2]) cube([lbh+4+2,lbd+4+2, lbd+4+2]);
  }
}

module hotend_holes(ep,d){
  //Trous hotend et capteur
  translate([sen_x/2,0,0]){
    for (i=[1:4]){
      rotate([0,0,90*i])
      translate([he_x/2,he_y/2,0])
      cylinder(d=d, h=ep);
    }
    copy_mirror([0,1,0])
    translate([-he_x/2-sen_x,sen_y/2,0])
    cylinder(d=d, h=ep);
  }
}

module x_carriage(){
  ep=4;
  $fn=32;
  
  echo ("x_carriage");
  translate([-sen_x/2,0,-lbd/2-ep])
  color (couleur){
    //translate([-55/2,-(lbe+lbd+4)/2,0]) cube([55,lbe+lbd+4,ep+lbd-2]);
    difference(){
      union(){
        // Plateau et zip tie
        difference(){
          hull(){
            translate([-lbh-4,- he_y/2 -2,0]) cube([2*(lbh+4),entraxe_x/2+4 + he_y/2 +2,ep]);
            translate([sen_x/2-(lbh+4)/2,-entraxe_x/2-4,0]) cube([lbh+4,2,ep]);
          }
          translate([sen_x/2-2+he_x/2-8,entraxe_x/2,ep+lbd/2]) rotate([0,90,0]) cylinder(h=4,d=lbd+4+4.5);
          translate([sen_x/2-2,-entraxe_x/2,ep+lbd/2]) rotate([0,90,0]) cylinder(h=4,d=lbd+4+4.5);
        }
        // attaches hotend
        difference(){
          translate([0,0,ep]) hotend_holes(lbd/2+2+1,vis4+6);
          // Dégagement pour roulements linéaires
          //copy_mirror([0,1,0])
          translate([-(lbh+4+2)/2+sen_x/2,-entraxe_x/2,lbd/2+ep]) rotate([0,90,0]) cylinder(d=lbd, h=lbh+4+2);
          translate([-lbh-4,entraxe_x/2,lbd/2+ep]) rotate([0,90,0]) cylinder(d=lbd, h=2*(lbh+4));
          // Dégagement pour courroie
          translate([-lbh-4,0,ep+lbd/2-7/2]) cube([(lbh+4)*2,dpoulie/2+1.5,7+1]);
        }
        
        // attaches pour roulements linéaires
        translate([0,0,lbd/2+ep]){
          translate([0,entraxe_x/2,0]) copy_mirror([1,0,0]) lb_clip();
          translate([-(lbh+4)/2+sen_x/2,-entraxe_x/2,0]) lb_clip();
        }
      }
      // Trous pour hotend et capteur
      translate([0,0,-1])
      hotend_holes(ep+lbd/2+2+1+2,vis4);
      // Trous zip tie
      difference(){
        translate([-he_x/2-2,entraxe_x/2,ep+lbd/2]) rotate([0,90,0]) cylinder(h=4,d=lbd+4+4+0.5);
        translate([-he_x/2-2-1,entraxe_x/2,ep+lbd/2]) rotate([0,90,0]) cylinder(h=4+2,d=lbd+4);
      }
    }
    copy_mirror([1,0,0]){
      difference(){
        hull(){
          translate([6,dpoulie/2-8/2,ep]) cylinder(d=8, h=lbd/2+7/2);
          translate([lbh+4-8/2,dpoulie/2-8/2,ep]) cylinder(d=8, h=lbd/2+7/2);
        }
        for(i=[0:(lbh+4)/pas]){
          translate([i*pas,dpoulie/2-1.5,ep+lbd/2-7/2]) cube([pas/2*1.2,2,7+1]);
        }
      }
      hull(){
        translate([6+1,dpoulie/2-8/2,ep]) cylinder(d=8+2, h=lbd/2-7/2);
        translate([lbh+4-(8+2)/2,dpoulie/2-8/2,ep]) cylinder(d=8+2, h=lbd/2-7/2);
      }
    }
  }
  
}

x_carriage();
//color ("cyan") import ("x_carriage.stl");