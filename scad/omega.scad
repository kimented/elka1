// eLKa1
// omega
// GNU GPL v3
// lkiefer <blog.lkiefer.org> and contributors
// http://www.reprap.org/wiki/ELKa
// https://github.com/kimented/elka1

include <config.scad>;

ep=5;      // épaisseur
pro=30.5;  // taille du profilé
pat=15;    // longueur des pattes
lar=20;    // largeur
diam=6;    // diamètre des trous
cha=2;     // chanfrein
cha2=2;    // chanfrein d'entrée
difference(){

  linear_extrude(height=lar, center=true, convexity=10)
  polygon(points=[
    [pro/2,0],
    [pro/2+ep+pat,0],
    [pro/2+ep+pat,ep],
    [pro/2+ep+cha,ep],
    [pro/2+ep,ep+cha],
    [pro/2+ep,pro+ep-cha],
    [pro/2+ep-cha,pro+ep],
    [-pro/2-ep+cha,pro+ep],
    [-pro/2-ep,pro+ep-cha],
    [-pro/2-ep,ep+cha],
    [-pro/2-ep-cha,ep],
    [-pro/2-ep-pat,ep],
    [-pro/2-ep-pat,0],
    [-pro/2,0],
    [-pro/2,pro],
    [pro/2,pro],
    [pro/2,0]
    ]) ;
  translate([-ep-(pro+pat)/2,-1,0]) rotate([-90,0,0]) cylinder(d=diam, h=ep+2, $fn=16);
  translate([ep+(pro+pat)/2,-1,0]) rotate([-90,0,0]) cylinder(d=diam, h=ep+2, $fn=16);
  translate([0,pro/2,lar/2-cha2]) rotate([0,0,45]) cylinder(d1=pro*sqrt(2),d2=(pro+cha2*2+0.2)*sqrt(2), h=cha2+0.1, $fn=4);
}
