clear;clc;
f=fopen('arquivo_eof.txt','r');
if -1==f
    error=printf('arquivo_feof.txt non existe');
end
while ~feof(f)
    x=fscanf(f,'%i',1);
    fprintf('%i ',x)
end
fprintf('\n')
fclose(f);
