// Fonctions personnalisées

//http://forum.openscad.org/Wish-mirror-copy-true-td10681.html
module copy_mirror(vec=[0,1,0])
{
    children();
    mirror(vec) children();
}

module ecrou(plat,h){
  cylinder(d=plat*2/sqrt(3), h=h, $fn=6);
}


module courroie(diam,longueur){
  color ("black")
  difference(){
    hull(){
      cylinder(d=diam+1, h=6, $fn=32);
      translate([longueur,0,0]) cylinder(d=diam+1, h=6, $fn=32);
    }
    translate([0,0,-1])
    hull(){
      cylinder(d=diam-1, h=8, $fn=32);
      translate([longueur,0,0]) cylinder(d=diam-1, h=8, $fn=32);
    }
  }
  
  
}