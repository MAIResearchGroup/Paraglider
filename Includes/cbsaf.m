% Confuse, bewilder, or stupefy all m-files
function cbsaf
    dir = '.sources';
    if exist(dir, 'dir') == 7
        prevPath = pwd;
        p = strcat( pwd, '\', dir);
        addpath(p)
        cd(p)
        files = ls('*.m');
        cd(prevPath)
        len = size(files);
        
        for i= 1:len(1)
            pcode( strtrim( files(i, :) ) );
        end
        
        rmpath(p)
    end
end

