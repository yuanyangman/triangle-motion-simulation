clear all;
clc;
close all;
%构造刚体
x=[0 10 -10 0 0];
y=[10 -10 -10 10 0];
fill(x,y,'b')
hold on;
%画布大小
axis([-200,200,-200,200])
g=[x;y];
%规定运行区域
center_x = -150;
center_y = -150;
center_width = 300;
center_high = 300;
rectangle('Position',[center_x,center_y,center_high,center_width],'Curvature', [0 0], 'edgecolor','r')
right_flag = 0;
left_flag = 0;
go_up = 1;
go_flag = 1;
go_down = 0;
 
  for i = 0:1:200
      if(go_up == 1)
          g = go_ahead(g,0,1);
          pause(0.05);
          fill(g(1,:),g(2,:),'b');
      end;
      if(go_down == 1)
          g = go_ahead(g,0,-1);
          pause(0.05);
          fill(g(1,:),g(2,:),'b'); 
      end;
      if(left_flag == 1)
          g = go_ahead(g,-1,0);
          pause(0.05);
          fill(g(1,:),g(2,:),'b');
      end;
      if(right_flag == 1)
         
          g = go_ahead(g,1,0);
          pause(0.05);
          fill(g(1,:),g(2,:),'b'); 
      end;
      %向上走碰到边界左转
      if((go_up == 1) && (150 - g(2,5))<11)
          g = left(g);
          left_flag = 1;
          go_down =0;
          right_flag = 0;
          go_up = 0;
      end;
        %向左走碰到边界左转，向下走
      if((left_flag == 1) && (150-g(2,5))<11 && (g(1,5)+150)<11)
          g = left(g);
          left_flag = 0;
          go_down =1;
          right_flag = 0;
          go_up = 0;
      end;
      %向下走碰到边界左转，向右走
      if((go_down == 1) && (g(2,5)+150)<11 && (g(1,5)+150)<11)
           g = left(g);
          left_flag = 0;
          go_down =0;
          right_flag = 1;
          go_up = 0;
      end;
      %向右走碰到边界左转，向上走
       if((right_flag == 1) && (g(2,5)+150)<11 && (150-g(1,5))<11)
          g = left(g);
          left_flag = 0;
          go_down =0;
          right_flag = 0;
          go_up = 1;
      end;
  end;
          
