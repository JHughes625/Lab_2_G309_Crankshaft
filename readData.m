%% Input
%filename vector

function[dataStruct] = readData(filename)
dataStruct = struct();

for i = 1:6
    dataStruct(i).filename = filename(i);
    dataStruct(i).data = readtable(filename(i));
end

for i = 1:6
    for j = 2:height(dataStruct(i).data)
        if dataStruct(i).data.Var3(j) > dataStruct(i).data.Var3(j-1) && dataStruct(i).data.Var3(j) < 5
            start = j-1;
            break
        end
    end
    dataStruct(i).data = dataStruct(i).data(start:end, :);
end
end