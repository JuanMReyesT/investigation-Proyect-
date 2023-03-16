function [Cl,Cd]=airfoilCpCd(Re,alpha)
 Rtext=num2str(round(Re,0));
 AoA=num2str(alpha);
 Airfoil  = 'CH10.dat'; 
saveFlnmAoA = 'CH10alpha.txt'; 
saveFlnmAoA2 = 'CH10alpha2.txt'; 
if (exist(saveFlnmAoA,'file'))
    delete(saveFlnmAoA);
end
if (exist(saveFlnmAoA2,'file'))
    delete(saveFlnmAoA2);
end

fid = fopen('xfoil_input1.txt','w');
fprintf(fid,['Load ' Airfoil '\n']);
fprintf(fid,'GDES\n');
fprintf(fid,'CADD\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'CADD\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'CADD\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'exec\n');
fprintf(fid,'\n');
fprintf(fid,'PPAR\n');
fprintf(fid,'n\n');
fprintf(fid,'310\n');
fprintf(fid,'\n');
fprintf(fid,'\n');
fprintf(fid,'oper\n');
fprintf(fid,'v\n');
fprintf(fid,[Rtext '\n']);
fprintf(fid,'iter\n');
fprintf(fid,'200\n');
fprintf(fid, 'vpar\n');
fprintf(fid, 'n\n');
fprintf(fid, ['5' '\n']);
fprintf(fid,'\n');
fprintf(fid,'a\n');
fprintf(fid, '0\n');
fprintf(fid,'pacc\n');
fprintf(fid,[saveFlnmAoA '\n']);
fprintf(fid,'\n');
fprintf(fid,'a\n');
fprintf(fid,[AoA '\n']);
fprintf(fid,'quit\n');
% fprintf(fid,['aseq' AoA1 AoA2 AoAstep '\n']);
% fprintf(fid,['aseq' AoA1 AoA2 AoAstep '\n']);
fclose(fid);
cmd = 'xfoil.exe < xfoil_input1.txt';
[status,result] = system(cmd);



saveFlnmAoA = 'CH10alpha.txt';
fidsaveFlnmAoA = fopen(saveFlnmAoA);
dataBuffer = textscan(fidsaveFlnmAoA,'%f %f %f %f %f %f %f ','HeaderLines',12,...                  % Ready data from file
                            'CollectOutput',1,...
                            'Delimiter','');
fclose(fidsaveFlnmAoA);
delete(saveFlnmAoA);
alpha = dataBuffer{1,1}(:,1);                                               
Cl= dataBuffer{1,1}(:,2);                                              
Cd = dataBuffer{1,1}(:,3); 
end