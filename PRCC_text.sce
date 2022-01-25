funcprot(0);
clc();
clear();

Dir="/home/felix/Documents/About_Fake_New/Memoire/Mon_memoire/Données_scilab/N=200/";

Parameter=["$\theta$","$\iota$"];
//disp(Parameter)

n=size(Parameter)(2)
Range=ones(n,2);
Range(1,1)=0;
Range(1,2)=1;
Range(2,1)=0;
Range(2,2)=1;
//disp(Range)

function res=pk(k,teta)
    if (I==1) then
        res=factorial(N-2)/(factorial(k-1)*factorial(N-1-k));
        res=res*(teta^(k-1))*((1-teta)^(N-k-1));
    else
        if (I==2) then
            if (teta>0) then
                res=teta*((1-teta)^(k-1))/(1-(1-teta)^(N-1));
            else
                res=(k-1)/(N-1);
            end
        else
            res=0
            if (teta>0) then	
                for j=1:N-1
                    temp=factorial(k-1)/factorial(j-1);
                    res=res+temp*(teta^(j-k));
                end
                res=1/res
            end
        end
    end
endfunction

function res=phi(X)
    res=pk(1,X(1))
    for k=2:N-1
        //disp(int(k))
        res=res+pk(k,X(1))*((X(2))^(k-1))/k
    end
endfunction

//disp(phi(ones(2,1)))

function res=Rang(X)
    res=zeros(length(X),1);
    for i=1:length(X)
        res(i)=1+length(find(X<X(i)))
    end
endfunction
//disp(Rang([4,3,3,2]))

m=1000;
N=200;
I=1;
Mat=zeros(m,n+1);
for i=1:n
    Mat(:,i)=grand(m, 1, "unf", Range(i,1), Range(i,2));
end
for i=1:m
    Mat(i,n+1)=phi(Mat(i,:));
end
for i=1:n+1
    Mat(:,i)=Rang(Mat(:,i));
end
PRCC=zeros(n,1);
for i=1:n
    PRCC(i)=correl(Mat(:,i),Mat(:,n+1));
end
//disp(PRCC)

scf(1)
clf(1)
bar(PRCC,1,'blue')
aa=gca();
aa.box="off";
//aa.data_bounds=[0,0;10,10];
aa.children.children.thickness=3;
aa.x_ticks.labels =Parameter';
axx=gda();
axx.title.font_size =4;
axx.x_label.font_size = 4;
axx.y_label.font_size = 4;

xlabel('Parametres');
ylabel('Effet sur $\phi$');
//xtitle("$\text{Sensitivity to } \phi$");
xs2pdf(gcf(),Dir + "Phi1"+".pdf");
xs2eps(gcf(),Dir + "Phi1"+".eps");

m=1000;
N=200;
I=2;
Mat=zeros(m,n+1);
for i=1:n
    Mat(:,i)=grand(m, 1, "unf", Range(i,1), Range(i,2));
end
for i=1:m
    Mat(i,n+1)=phi(Mat(i,:));
end
for i=1:n+1
    Mat(:,i)=Rang(Mat(:,i));
end
PRCC=zeros(n,1);
for i=1:n
    PRCC(i)=correl(Mat(:,i),Mat(:,n+1));
end
//disp(PRCC)

scf(2)
clf(2)
bar(PRCC,1,'blue')
aa=gca();
aa.box="off";
//aa.data_bounds=[0,0;10,10];
aa.children.children.thickness=3;
aa.x_ticks.labels =Parameter';
axx=gda();
axx.title.font_size =4;
axx.x_label.font_size = 4;
axx.y_label.font_size = 4;

xlabel('Parametres');
ylabel('Effet sur $\phi$');
//xtitle("$\text{Sensitivity to } \phi$");
xs2pdf(gcf(),Dir + "Phi2"+".pdf");
xs2eps(gcf(),Dir + "Phi2"+".eps");


m=1000;
N=200;
I=3;
Range(1,1)=1;
Range(1,2)=N-1;
Mat=zeros(m,n+1);
for i=1:n
    Mat(:,i)=grand(m, 1, "unf", Range(i,1), Range(i,2));
end
for i=1:m
    Mat(i,n+1)=phi(Mat(i,:));
end
for i=1:n+1
    Mat(:,i)=Rang(Mat(:,i));
end
PRCC=zeros(n,1);
for i=1:n
    PRCC(i)=correl(Mat(:,i),Mat(:,n+1));
end
//disp(PRCC)

scf(3)
clf(3)
bar(PRCC,1,'blue')
aa=gca();
aa.box="off";
//aa.data_bounds=[0,0;10,10];
aa.children.children.thickness=3;
aa.x_ticks.labels =Parameter';
axx=gda();
axx.title.font_size =4;
axx.x_label.font_size = 4;
axx.y_label.font_size = 4;

xlabel('Parametres');
ylabel('Effet sur $\phi$');
//xtitle("$\text{Sensitivity to } \phi$");
xs2pdf(gcf(),Dir + "Phi3"+".pdf");
xs2eps(gcf(),Dir + "Phi3"+".eps");
