Import given data from 3 position (XYZ) sensors monitoring position of the end of a moving robotic arm.  
Filter data to highlight periods when arm was idle and not moving.  
Average the position sensor data during halt period to get one XYZ plane point, repeat for all data to get 150 XYZ points.  
Calculate Repeatability based on given formulas.  
Plot raw data, filtered data, XYZ points.  
  
IMPORTANT:  
Change file path in line: load('C:\Users\Patryk\Desktop\dane_w_cm.mat')  
to file path on your computer, you must apply this change to both .m files to run them correctly.
