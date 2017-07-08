// eLKa1
// sensor_holder
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;
use <modules.scad>;

module sensor_holder(ep,d){
  echo ("sensor_holder");
  $fn=24;
  ch=3;
  color (couleur)
  difference(){
    union(){
      // Fixations
      hull(){
        translate([0,sen_y/2]) cylinder(d=10,h=sen_ep);
        translate([-5,-sen_y/2-sen_ep-sen_z,0]) cube([10,sen_ep,sen_ep]);
      }
      // Collier
      hull(){
        translate([-5,-sen_y/2-sen_ep-sen_z,0]) cube([10,sen_ep,sen_ep]);
        translate([sen_pos,-sen_y/2-sen_ep-sen_z,sen_d/2+sen_ep+5]) rotate([-90,0,0]) cylinder(d=sen_d+2*sen_ep,h=sen_ep);
      }
      // Renforts
      difference(){
        intersection(){
          translate([sen_d/2+sen_ep+sen_pos,-sen_y/2-sen_z,0])
          rotate([0,-90,0]) linear_extrude(sen_d+2*sen_ep+2*sen_pos) polygon([[0,0],[0,ch],[sen_ep,ch],[ch+sen_ep,0]]);
          hull(){
            translate([-5,-sen_y/2-sen_z,0]) cube([10,ch,sen_ep]);
            translate([sen_pos,-sen_y/2-sen_z,sen_d/2+sen_ep+5]) rotate([-90,0,0]) cylinder(d=sen_d+2*sen_ep,h=ch);
          }
        }
        // Dégagement écrou capteur
        translate([sen_pos,-sen_y/2-sen_z,sen_d/2+sen_ep+5]) rotate([-90,0,0]) cylinder(d=sen_d+2*sen_ep+3,h=ch);
      }
    }
    // Trous de fixation
    copy_mirror([0,1,0])
    translate([0,sen_y/2,-1])
    cylinder(d=vis4, h=sen_ep+2);
    // Trou collier
    translate([sen_pos,-sen_y/2-sen_ep-sen_z-1,sen_d/2+sen_ep+5]) rotate([-90,0,0]) cylinder(d=sen_d,h=sen_ep+2);
    // Découpe quart de cercle
    translate([sen_pos,-sen_y/2-sen_ep-sen_z-1,sen_d/2+sen_ep+5]) rotate([0,-45,0]) cube ([sen_d+sen_ep,sen_ep+2,sen_d+sen_ep]);
  }
  
}

sensor_holder();
//translate([-he_x/2-sen_x,sen_y/2,0])