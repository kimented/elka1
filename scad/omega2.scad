ep=8;       // épaisseur
diam=5.5;   // diamètre des trous
pro=30;     // profilé
lar=20;     // largeur
ch=2;       // chanfrein
ch2=1;      // chanfrein pointe
ra=7;       // largeur rainure
ra2=6;      // profondeur rainure
ob=10;      // entraxe trou oblong
ec=10;      // ecart entre les profilés

module patte () {
translate([-pro/2,0,0])
linear_extrude(height=lar, center=true, convexity=10)
  polygon([[0,-pro],[0,pro/2+ec-ra/2-ch2],[0+ch2,pro/2+ec-ra/2],[ra2-ch2,pro/2+ec-ra/2],[ra2,pro/2+ec-ra/2+ch2],[ra2,pro/2+ec+ra/2-ch2],[ra2-ch2,pro/2+ec+ra/2],[-ep+ch,pro/2+ec+ra/2],[-ep,pro/2+ec+ra/2-ch],[-ep,-pro/2+ch],[-ep+ch,-pro]]);
}

difference(){
  union(){
    patte();
    scale([-1,1,1]) patte();
    translate([-pro/2,-pro,-lar/2]) cube([pro, pro, ep]);
  }
  hull(){
    translate([ob/2,-pro/2,-lar/2-1]) cylinder(d=diam, h=lar+2, $fn=16);
    translate([-ob/2,-pro/2,-lar/2-1]) cylinder(d=diam, h=lar+2, $fn=16);
}
}