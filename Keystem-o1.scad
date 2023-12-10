$fn=32;

key_rim_diameter=12;
key_well_diameter=9;
key_well_depth=9;
key_well_scale=(key_well_diameter/key_rim_diameter);
key_wall_thick=1.5;
key_wall_height=key_well_depth-4;
key_well_origin=-1;
key_mount_diameter=7.5;
key_mount_height=key_well_depth-0.5;
key_mount_angle=7.5;
key_mount_cross_diameter=6;
key_mount_cross_thick=1.5;
key_mount_cross_depth=key_mount_height;

cut_well_top_offset=2;

    //rotate([-25+90,0,0])
difference()
{

difference()
{
union()
{
    
translate([key_well_origin,0,-key_well_depth]) 
rotate([0,key_mount_angle,0])
{
    cylinder(d=key_mount_diameter,h=key_mount_height);
    

}

    difference() {    
        translate([0,0,0 -1* key_well_depth/2])
        rotate([180,0,0])
        linear_extrude (height = key_well_depth, center = true, convexity = 10, scale=key_well_scale)
            square (key_rim_diameter,true);

        cube ([key_rim_diameter*2,key_rim_diameter*2,cut_well_top_offset*2],center = true);
    }
}

translate([0,0,-1.01*key_well_depth])
{
    translate([-1*key_rim_diameter,-key_wall_thick/2,0])
    cube([key_rim_diameter*2,key_wall_thick,key_wall_height]);

    translate([key_well_origin-key_wall_thick/2,-1*key_rim_diameter,0])
    cube([key_wall_thick,key_rim_diameter*2,key_wall_height]);
       
    
    rotate([0,key_mount_angle,0])
    translate([key_well_origin,0,-key_wall_height])
    cylinder(d=key_mount_diameter*1.2,h=key_wall_height*2);
    
    rotate([0,key_mount_angle,0])
    translate([key_well_origin,0,-key_mount_cross_depth+0.01])
    {
    translate([-key_mount_cross_diameter/2,-key_mount_cross_thick/2,key_mount_height])
    cube([key_mount_cross_diameter,key_mount_cross_thick,key_mount_cross_depth*2]);
    
    rotate([0,0,90])
    translate([-key_mount_cross_diameter/2,-key_mount_cross_thick/2,key_mount_height])
    cube([key_mount_cross_diameter,key_mount_cross_thick,key_mount_cross_depth*2]);
    }
}

}
    //rotate([25,0,0])
    //rotate([180,0,0])
    //translate([0,key_rim_diameter/2,0])
    //cube ([key_rim_diameter*2,key_rim_diameter,key_well_depth*3],center=true);
}