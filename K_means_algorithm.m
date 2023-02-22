
%------------ Applying K-means Algortihm in Data Clustering --------------%

clc;

%--------------- Initializing the IRIS dataset---------------------%
load irisdataset.txt 
DataSet=irisdataset; 
Dim=size(DataSet);

      
%----------------------- Selecting k = 3 random centres ----------------------% 
Selection=rand(1,3);

Selection=Selection*Dim(1,1);

Selection=ceil(Selection); %Round toward and select the row number.


%--------------------------- 3 random centres ----------------------------%
Centroid1=DataSet(Selection(1),:);

Centroid2=DataSet(Selection(2),:);

Centroid3=DataSet(Selection(3),:);


n=input('Number of iterations : ')
%-------------------------- K means Algorithm ----------------------------%
for j=1:1:n
count1=0;
Mean1=zeros(1,4);
count2=0;
group1=[];
Mean2=zeros(1,4);
group2=[];
count3=0;
group3=[];
Mean3=zeros(1,4);

%Finding the minimum distance
for i=1:1:Dim(1,1)


Distance1(i)=sqrt((Centroid1(1,1)-DataSet(i,1))^2+(Centroid1(1,2)-DataSet(i,2))^2+(Centroid1(1,3)-DataSet(i,3))^2+(Centroid1(1,4)-DataSet(i,4))^2);
Distance2(i)=sqrt((Centroid2(1,1)-DataSet(i,1))^2+(Centroid2(1,2)-DataSet(i,2))^2+(Centroid2(1,3)-DataSet(i,3))^2+(Centroid2(1,4)-DataSet(i,4))^2);
Distance3(i)=sqrt((Centroid3(1,1)-DataSet(i,1))^2+(Centroid3(1,2)-DataSet(i,2))^2+(Centroid3(1,3)-DataSet(i,3))^2+(Centroid3(1,4)-DataSet(i,4))^2);

LessDist=[Distance1(i) Distance2(i) Distance3(i)];
Minimum=min(LessDist);

%Finding the new centre




hold on


if (Minimum==Distance1(i))
    count1=count1+1;
    Mean1=Mean1+DataSet(i,:);
    group1=[group1 i];
    plot(DataSet(i, 1),DataSet(i, 2),'r*');
    
else if (Minimum==Distance2(i))
        count2=count2+1;
        Mean2=Mean2+DataSet(i,:);
        group2=[group2 i];
        plot(DataSet(i, 1),DataSet(i, 2),'g+');

    else count3=count3+1;
        Mean3=Mean3+DataSet(i,:);
        group3=[group3 i];
        plot(DataSet(i, 1),DataSet(i, 2),'b.');
    end
end


end

%----------------------------- New Centres -------------------------------%
Centroid1=Mean1/count1;
Centroid2=Mean2/count2;
Centroid3=Mean3/count3;

%Plot cluster centres
plot(Centroid1(1,1),Centroid1(1, 2),'ko', 'LineWidth',3);
plot(Centroid2(1,1),Centroid2(1, 2),'ko', 'LineWidth',3);
plot(Centroid3(1,1),Centroid3(1, 2),'ko', 'LineWidth',3);
end

hold off

% specify the indexed color for each point
icolor = ceil((DataSet(:,4)/max(DataSet(:,4)))*256);
figure,
scatter3(DataSet(:,1),DataSet(:,2),DataSet(:,3),DataSet(:,4),icolor,'filled');
figure,
scatter3(DataSet(:,1),DataSet(:,2),DataSet(:,3),[],DataSet(:,4),'filled');

Centroid1
Centroid2
Centroid3


count1
count2
count3


group1
group2
group3

