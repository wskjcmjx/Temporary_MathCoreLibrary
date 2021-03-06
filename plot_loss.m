filename = 'D:\Research\FaceRecognition\setup\log\INFO.txt20170304-035627.9884';
fid=fopen(filename,'r');
regpat = 'Test net output #0: accuracy = [0-9\.]+';
% regpat = 'Iteration [0-9]+, loss = [0-9\.]+';
iter = zeros(100000,1);
loss = zeros(100000,1);
p = 1;
while ~feof(fid)
    newline=fgetl(fid);
    o3=regexpi(newline,regpat,'match');
    if ~isempty(o3)
        iterloss = sscanf(o3{1},'Test net output #0: accuracy = %f');
%         iterloss = sscanf(o3{1},'Iteration %d, loss = %f');
        iter(p) = p;
%         iter(p) = iterloss(1);
        loss(p) = iterloss(1);
        p=p+1;
    end;
end;
fclose(fid);
iter = iter(1:p-1);
loss = loss(1:p-1);
plot(iter,loss);
title('Top-1 Accuracy')