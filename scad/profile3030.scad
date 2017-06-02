//Profilé 3030

module profile3030(longueur, center){
  r=2;
  fn=12;
  e1=2.3;
  e2=1.3;
  q1=4.3;
 
  difference(){
    // forme extérieure de base
    hull(){
      for (i = [0 : 3]){
          rotate([0,0,i*90]) translate([-30/2+r, -30/2+r]) cylinder(h=longueur,r=r, center=true, $fn=fn);
      }
    }
    // délimitation des quatre carrés
    for (i = [0 : 1]){
        rotate([0,0,i*90]) cube([30-2*e1,30-4*e2-2*q1,longueur+2],center=true);
        rotate([0,0,i*90]) cube([32,8,longueur+2], center=true);
    }
    // trous des carrés
    for (i = [0 : 3]){
        rotate([0,0,i*90]) translate([-30/2+e2,-30/2+e2,-longueur/2-1]) cube([q1,q1,longueur+2]);
    }
  }
  
    
  
  
  difference(){
    union(){
      // ailettes intérieures 
      for (i= [0 : 1]){
        rotate([0,0,90*i]) hull(){
          for (j= [0 : 1]){
            rotate ([0,0,180*j]) translate([-30/2+e2+q1,-30/2+e2+q1,-longueur/2]) cube([e2,e2,longueur]);
          }
        }
      }
      
      // carré central
      cube([10,10,longueur], center=true);
    }
    cylinder(d=7,h=longueur+2,center=true, $fn=fn);
  }
  echo (str("profilé 3030 l=",longueur,"mm"));
}


profile3030(100);