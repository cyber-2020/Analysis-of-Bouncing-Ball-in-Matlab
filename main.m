% Author: K******
    clc; close all; clear;

    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    disp ('Author: K******');
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');

    
 % Task 1: 	Load & Display the data using the load function, input the data from the file zzp4data.txt.
 %          The data consists of values for the  initial height (hin), initial rebound coefficient (rin),
 %          the initial number of bounces (nin),  and a target height (htar).

    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('Task 1: Load the data and display the variables with corresponding values')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')

    load zzp4data.txt

    %Store the values in the indicated variables and display them clearly
    %labeled, assuming heights are in units of meters.

        data=zzp4data;
        hin = data(1);
        rin = data(2);
        nin = data(3);
        htar= data(4);

    fprintf('The initial height (hin) is equal to %7.4f meters.\n',hin)
    fprintf('The initial rebound coefficient (rin) is equal to %7.4f.\n',rin)
    fprintf('The initial number of bounces (nin) is equal to %7.4f.\n',nin)
    fprintf('The target height (htar) is equal to %7.4f meters.\n',htar)
    disp('        ')
    disp ('        ')

% Task 2:   Defining a function that calculates the height of the ball after n bounces
    
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('Task 2: Defining a function that calculates the height of the ball after n bounces')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')

    SpecificPoint = Height(15,.25,3);   %Evaluating Height at a given point
    fprintf('The height of the ball that has been evaluated at Height is %6.5f\n',SpecificPoint)

    nn = [0:nin];                       %number of bounces in the form of a vector
    hnn = Height(hin,rin,nn);           %Height when nn = nin(from zzzp4data.txt) in the form of a vector
    twoColTable =[nn;hnn];              %arranging the nn & hnn arrays as a two column array                                                                                                                                                       

    %displaying the nn & hnn arrays as a two column table
    disp('                  value of n                corresponding height         ')
    disp ('        ')
    fprintf('     %18.0f            %21.4f   \n',twoColTable)
    disp ('        ')  
    disp ('        ')
    
    
% Task 3    Plot the rebound height as a function of n using the vectors nn and hnn 
%           from Task 2 in figure 1. Plot the motion of the ball in figure 2.
    
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('  Task 3: Plot the rebound height as a function of n using the vectors nn and hnn obtained  ')
    disp ('          from Task2 for figure1. Plot the motion of the bouncing ball for figure 2.         ')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')
    
    %Plotting the maximum heights at each bounce
    nn = [0:0.5:nin];                               %getting m points for nn to make our plots look smooth
    hnn = Height(hin,rin,nn);                       %getting m points of max height for each nn value
    plot(nn,hnn),xlabel('nn (number of bounces)'),ylabel('hnn  (max heights in meters)')    %Displays plot of maximum heights at each bounce
                                                                                
    disp('See figure 1, press any key to continue...        ')                                                  
    pause;
    
    %Plotting the motion of the bouncing ball as figure 2
    nne=[0:.5:nin+.5];                              
    nn = [0:nin];                                   %Obtaining the values for nn from Task 2 as directed
    hnn = Height(hin,rin,nn);                       %Obtaining the values for hnn from Task 2 as directed
    d = length(hnn);                                %Determining the length of hnn so we can create zero matrix of equal size
    c(1:d)=0;
    newhnn=[hnn;c];                                 %Creating a motion variable for the bouncing ball                             
    newhnn=((newhnn(:)'));                          %Turning newhnn into a row vector
    plot(nne,newhnn),xlabel('nne (number of bounces)'),ylabel('hnn (height in meters)')    %Displays plot of bouncing ball's motion     
    
    disp('See figure 2, press any key to continue...        ')
    pause;
    disp ('        ')  
    disp ('        ')
    
    
    
% Task 4:   Find the total vertical distance traveled by the ball from the initial drop to the apex of 4th height bounce
%           and develop a function that will find the total vertical distance traveled from the initial drop to the apex 
%           of the nth bounce.
    
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('  Task 4: Find the total vertical distance traveled by the ball from the initial drop to    ')
    disp ('          the apex of 4th height bounce, develop a function that will find the total        ')
    disp ('          vertical distance traveled from the intial drop to the apex of the nth bounce.    ')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')
    
    %finding the vertical distance travelled by the bouncing ball to the apex of 4h bounce
    %Find it by summing the initial, last, and 2 times the middle bounces.
    %General form of this function is Height(0)+Height(n)+Height[1:(n-1)]
    vd_apex4=(sum(Height(15,.25,[1:3]))*2)+Height(15,.25,0)+Height(15,.25,4);   
    fprintf('The vertical distance traveled by the bouncing ball to the apex of 4th is: %7.4f\n',vd_apex4)
    
    %Now develop a general function file that will calculate the vertical distance travelled by 
    %the bouncing ball to the apex of 4h bounce. General form of this function is distance(h0,r,n).
    
    verDis_1=distance(20,.3,1);
    fprintf('The vertical distance travelled by the bouncing ball to the apex of 1st bounce is: %3.0f\n',verDis_1)
    
    
    %Calculating the vertical distance travelled by the ball to the apex of 100h bounce.
    %n=100;
    verDis_100=sum(distance(hin,rin,100));
    fprintf('The vertical distance travelled by the bouncing ball to the apex of 100th bounce is: %7.4f\n',verDis_100)
    
    disp ('        ')
    disp ('        ')
    clear verDis_1 verDis_100 vd_apex4;
    
    
% Task 5:   Construct a five column table using the distance function. 1st column should show the number of 
%           bounces, from 0 to nin. The remaining columns should show the distance traveled after that many
%           bounces for a ball with rebound coefficient rin if the initial heights are 5,10,15, and
%           20 meters, respectively.
    
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('  Task 5: Construct a five column table using the distance function. 1st column should show ')
    disp ('          the number of bounces, from 0 to nin. The remaining columns should show the       ')
    disp ('          distance traveled after that many bounces for a ball with rebound coefficient     ')
    disp ('          rin if the initial heights are 5,10,15, and 20 meters, respectively.              ')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')
    
    %h0 equals to 5
    n=[0:nin]
    h0=5;
    verDis_5=distance(h0,rin,n)
        
    %h0 equals to 10
    h0=10;
    verDis_10=distance(h0,rin,n);
    
    %h0 equals to 15
    h0=15;
    verDis_15=distance(h0,rin,n);
    
    %h0 equals to 20
    h0=20;
    verDis_20=distance(h0,rin,n);
    
    %Combining all the vertical distance computed with n=[0:nin],h0=[5:5:20],r=rin.
    allVerDis=([n;verDis_5;verDis_10;verDis_15;verDis_20])';
    
    %Output the results
    disp('  number of |distance |distance |distance |distance ')
    disp('   bounces  |  h0=5   |  h0=10  |  h0=15  |  h0=20  ')
    disp('---------------------------------------------------')
    disp(allVerDis)
    disp ('        ')
    
    
    
% Task 6:   Analyze the motion of a ball whose rebound coefficient depends on how hard it strikes the ground. 
%           Define a rebound(h)function,where h is the current height,and
%           if h<10, rebound coefficient = 0.6, else it is = 0.8
    
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('  Task 5: Construct a five column table using the distance function. 1st column should show ')
    disp ('          Define a rebound(h)function,where h is the current height,and if h<10, rebound    ')
    disp ('          coefficient is equal to 0.6, else it is equal to 0.8                              ')
    disp ('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~')
    disp ('        ')
    
    rebCof_h1=rebound(5);
    fprintf('The value obtained by the rebound(h)function when the h is equal to 5 is: %7.4f\n',rebCof_h1)

    
    
    
    clear SpecificPoint twoColTable;
    clear d c newhnn nn hnn nne;
    clear n r h0;
    clear n h0 verDis_5 verDis_10 verDis_15 verDis_20 allVerDis;
    clear rebCof_h1 data;
    

    
   
    