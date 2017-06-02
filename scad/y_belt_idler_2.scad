include <config.scad>;
use <modules.scad>;

module y_belt_idler_2(){
  ep=4;
  hauteur=16; //14
  largeur=24; //20
  ecart=14;
  $fn=32;
  vis=vis4;
  ec=ec4;
  ech=ec4h;
    
  color (couleur){
    cylinder(d=largeur, h=ecart);
  }
}

y_belt_idler_2();