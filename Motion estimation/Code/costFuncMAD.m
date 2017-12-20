% Computes the Mean Absolute Difference (MAD) for the given two blocks
% currentBlk : The block for which we are finding the MAD
% refBlk : the block w.r.t. which the MAD is being computed
% n : the side of the two square blocks
% cost : The MAD for the two blocks

function cost = costFuncMAD(currentBlk,refBlk, n)
                
 err = int32(0);
 delta = int32(0);
 for i = 1:n
     for j = 1:n
         delta = int32(int32(currentBlk(i,j)) - int32(refBlk(i,j))); %Calulating MAD
         if delta<0 
             delta=int32(delta*-1);             
         end    
         err = int32( err + delta);         
     end
 end
 cost = err;
end