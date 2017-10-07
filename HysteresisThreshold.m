
function BinaryEdgeImage = HysteresisThreshold(magnitudeImage,minThresh,maxThresh)

    min = magnitudeImage > minThresh;     
    
    [max_x, max_y] = find(magnitudeImage > maxThresh);   
    
    BinaryEdgeImage = bwselect(min, max_y, max_x, 8);
   