if(distance_to_point(mouse_x,mouse_y)< radius){
//wall edges
x1=x-bwx/2;
y1=y-bwy/2;
x2=x1;
y2=y+bwy/2;
x3=x+bwx/2;
y3=y2
x4=x3
y4=y1

//shadow points
dirc = point_direction(mouse_x,mouse_y ,x1,y1);
x11 = x1 + lengthdir_x(500 , dirc)//500 is shadow length
y11 = y1 + lengthdir_y(500 , dirc);

dirc = point_direction(mouse_x,mouse_y ,x2,y2);
x21 = x2 + lengthdir_x(500 , dirc)//500 is shadow length
y21 = y2 + lengthdir_y(500 , dirc);

dirc = point_direction(mouse_x,mouse_y ,x3,y3);
x31 = x3 + lengthdir_x(500 , dirc)//500 is shadow length
y31 = y3 + lengthdir_y(500 , dirc);

dirc = point_direction(mouse_x,mouse_y ,x4,y4);
x41 = x4 + lengthdir_x(300 , dirc)//500 is shadow length
y41 = y4 + lengthdir_y(300 , dirc);


//drawing shadows
draw_primitive_begin(pr_trianglestrip)

draw_vertex(x1,y1)
draw_vertex(x11,y11)

draw_vertex(x2,y2)
draw_vertex(x21,y21)

draw_vertex(x3,y3)
draw_vertex(x31,y31)

draw_vertex(x4,y4)
draw_vertex(x41,y41)

draw_vertex(x1,y1)
draw_vertex(x11,y11)  //closes the polygon

draw_primitive_end();


}