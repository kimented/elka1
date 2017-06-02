include <config.scad>;
use <modules.scad>;

//import("stl/support_tige8_y.stl");
module support_tige8_y(){
  ep=4;
  h=12;
  d1=8.2;
  d2=16;
  vis=5.5;
  $fn=32;
  
  echo ("support_tige8_y");

  color (couleur)
  difference(){
    union(){
      translate([0,decal_tiges,0]) cylinder(d=d2, h=h);
      hull(){
        copy_mirror(1,0,0) translate([-15,0,0]) cylinder(d=vis+7, h=ep);
        translate([0,decal_tiges,0]) cylinder(d=d2, h=ep);
      }
    }
    translate([0,decal_tiges,-1]) cylinder(d=d1, h=h+2);
    translate([0,decal_tiges,h-1]) cylinder(d1=d1,, d2=d1+4, h=2);
    copy_mirror(1,0,0) translate([-15,0,-1]) cylinder(d=vis, h=ep+2);
  }
}

support_tige8_y();