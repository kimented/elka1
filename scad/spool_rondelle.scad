// eLKa1
// spool_rondelle
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

module spool_rondelle() {
  $fn=128;
  disque=45;
  droulement=22.3;
  dext=30;
  eroulement=9;
  ep=1.5;
  
  echo ("spool_rondelle");

  difference(){
    union(){
      cylinder(h=ep,d=disque);
      cylinder(h=eroulement+ep, d=dext);
    }
    translate([0,0,-1]) cylinder(h=eroulement+1, d=droulement);
    cylinder(h=eroulement+ep+1, d=droulement-2);
  }
}

spool_rondelle();