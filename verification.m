function verification
    PATH = strcat(pwd, '\verification');
    addpath( PATH )
    
        testPIDController;
    
    rmpath( PATH )
end