
function newMagnitudeImage = NonMaximalSuppression(magnitude,orientation)

% 0 0.25 0.5 0.75 
% 1 1.25 1.5 1.75

X = zeros(size(orientation));

% if orientation>-0.125*pi & orientation<=0.125*pi | orientation>0.875*pi & orientation<=1.125*pi;
% X = 0;
% end

if orientation>0.125*pi & orientation<=0.375*pi | orientation>1.125*pi & orientation<=1.375*pi;
X = 1;
end

if orientation>0.375*pi & orientation<=0.625*pi | orientation>1.375*pi & orientation<=1.625*pi;
X = 2;
end

if orientation>0.625*pi & orientation<=0.875*pi | orientation>1.625*pi & orientation<=1.875*pi;
X = 3;
end



for i=2:159

    for j=2:179
        
        if X(i,j) == 0
            if magnitude(i,j)<magnitude(i,j-1) || magnitude(i,j)<magnitude(i,j+1)
                magnitude(i,j) = 0;
            end
        end
        
        if X(i,j) == 1
            if magnitude(i,j)<magnitude(i-1,j-1) || magnitude(i,j)<magnitude(i+1,j+1)
                magnitude(i,j) = 0;
            end
        end
        
        if X(i,j) == 2
            if magnitude(i,j)<magnitude(i-1,j) || magnitude(i,j)<magnitude(i+1,j)
                magnitude(i,j) = 0;
            end
        end
        
        if X(i,j) == 3
            if magnitude(i,j)<magnitude(i+1,j-1) || magnitude(i,j)<magnitude(i-1,j+1)
                magnitude(i,j) = 0;
            end
        end
        
    end
end
newMagnitudeImage = zeros(size(magnitude));
newMagnitudeImage = magnitude;