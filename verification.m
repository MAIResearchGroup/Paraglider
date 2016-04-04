function verification(visualize)
    PATH = strcat(pwd, '\verification');
    addpath( PATH )
    
        testPIDController;
    
    rmpath( PATH )
end