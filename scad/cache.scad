include <config.scad>;

module cache(){

  hauteur=60;
  depasse=25;
  largeur=60;
  retour=15;
  ep=3;

  prise_h=29;
  prise_l=21;
  prise_axe=40;

  inter_d=15.3;
  n1=2;
  n2=1;

  fix1_dext=9;
  ch=10;
  
  echo ("cache");
  
  color (couleur){
    difference(){
      union(){
        cube([largeur,hauteur+depasse,ep]);
        cube([largeur,ep,retour]);
        //fixations bas
        translate([fix1_dext/2,ep,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=3,d=fix1_dext);
        translate([largeur-(fix1_dext/2),ep,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=3,d=fix1_dext);
        //fix prise
        translate([largeur/4,hauteur/2+prise_axe/2,ep]) cylinder(h=3, d=fix1_dext, $fn=12);
        translate([largeur/4,hauteur/2-prise_axe/2,ep]) cylinder(h=3, d=fix1_dext, $fn=12);    
      }
      
      translate([(largeur/2-prise_l)/2,(hauteur-prise_h)/2,-1]) cube([prise_l,prise_h,ep+2]); //trou prise
      translate([largeur/4,hauteur/2+prise_axe/2,-1]) cylinder(h=ep+2, d=3.5, $fn=12);  //fix prise
      translate([largeur/4,hauteur/2-prise_axe/2,-1]) cylinder(h=ep+2, d=3.5, $fn=12);  //fix prise
      translate([largeur/4,hauteur/2+prise_axe/2,ep]) cylinder(h=3+1, d=5.7*2/sqrt(3), $fn=6);  //fix prise ecrou
      translate([largeur/4,hauteur/2-prise_axe/2,ep]) cylinder(h=3+1, d=5.7*2/sqrt(3), $fn=6);  //fix prise ecrou
      
      //Trous interrupteurs
      for(j=[0:1:n1-1]){
        for(i=[0:1:n2-1]){
          translate([largeur/2+(largeur/4/n2)+(largeur/2/n2*i) , (hauteur/2/n1)+(hauteur/n1*j) , -1]) cylinder(d=inter_d, h=ep+2,$fn=32);
        }
      }
      //fixations bas
      translate([fix1_dext/2,-1,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=ep+3+2,d=3.5,$fn=8);
      translate([largeur-(fix1_dext/2),-1,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=ep+3+2,d=3.5,$fn=8);
      translate([fix1_dext/2,ep,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=3+1,d=5.7*2/sqrt(3), $fn=6);
      translate([largeur-(fix1_dext/2),ep,retour-fix1_dext/2]) rotate([-90,0,0]) cylinder(h=3+1,d=5.7*2/sqrt(3), $fn=6);
      
      //fixation haut
      translate([10,hauteur+15,-1]) cylinder(d=5.5,h=ep+2,$fn=12);
      translate([largeur-10,hauteur+15,-1]) cylinder(d=5.5,h=ep+2,$fn=12);
      
      translate([3/4*largeur,hauteur/2,-1]) scale([-1,1,1]) linear_extrude (height=1+1) text("eLKa", halign="center", valign="center", size=9);
      
      //chanfrein
      translate([0,hauteur+depasse-ch,-1]) rotate([0,0,45]) cube([ch*sqrt(2),ch*sqrt(2),ep+2]);
      translate([largeur,hauteur+depasse-ch,-1]) rotate([0,0,45]) cube([ch*sqrt(2),ch*sqrt(2),ep+2]);


    }

    //nervure
    translate([largeur/2,0,0]) rotate([0,-90,0]) linear_extrude(height=1.6, center=true) polygon(points=[[retour,ep],[ep,hauteur+depasse],[ep,ep]]);
  }
}

cache();
