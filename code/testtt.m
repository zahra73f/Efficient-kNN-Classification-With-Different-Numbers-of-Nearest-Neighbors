function =testtt()
for i=1:n
    c=0;
   for j=1:n
        if w(j,i) > 0.00001
           
            c=c+1;
        
        end
   end
    label(i)=c;
end