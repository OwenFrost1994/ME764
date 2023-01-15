%================= SHAPE FUNCTIONS ==================================
%
% Calculates shape functions for various element types
%
function N=shapefunctions(nNoEl,nDof,xi)
N=zeros(nNoEl,1);
%
%  1D elements
%
if nDof == 1
    if nNoEl == 2
      N(1) = 0.5*(1.+xi(1));
      N(2) = 0.5*(1.-xi(1));
    elseif nNoEl == 3
      N(1) = -0.5*xi(1)*(1.-xi(1));
      N(2) =  0.5*xi(1)*(1.+xi(1));
      N(3) = (1.-xi(1))*(1.+xi(1));
    end
end
%
%  2D elements: Rectangular element
%
if nDof == 2               
 if nNoEl == 4
        N(1) = 0.25*(1.-xi(1))*(1.-xi(2));
        N(2) = 0.25*(1.+xi(1))*(1.-xi(2));
        N(3) = 0.25*(1.+xi(1))*(1.+xi(2));
        N(4) = 0.25*(1.-xi(1))*(1.+xi(2));
    elseif nNoEl == 8
        N(1) = -0.25*(1.-xi(1))*(1.-xi(2))*(1.+xi(1)+xi(2));
        N(2) = 0.25*(1.+xi(1))*(1.-xi(2))*(xi(1)-xi(2)-1.);
        N(3) = 0.25*(1.+xi(1))*(1.+xi(2))*(xi(1)+xi(2)-1.);
        N(4) = 0.25*(1.-xi(1))*(1.+xi(2))*(xi(2)-xi(1)-1.);
        N(5) = 0.5*(1.-xi(1)*xi(1))*(1.-xi(2));
        N(6) = 0.5*(1.+xi(1))*(1.-xi(2)*xi(2));
        N(7) = 0.5*(1.-xi(1)*xi(1))*(1.+xi(2));
        N(8) = 0.5*(1.-xi(1))*(1.-xi(2)*xi(2));
end
%
if nDof==3
    if nNoEl == 8
        N(1) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3))/8.;
        N(2) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3))/8.;
        N(3) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3))/8.;
        N(4) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3))/8.;
        N(5) = (1.-xi(1))*(1.-xi(2))*(1.+xi(3))/8.;
        N(6) = (1.+xi(1))*(1.-xi(2))*(1.+xi(3))/8.;
        N(7) = (1.+xi(1))*(1.+xi(2))*(1.+xi(3))/8.;
        N(8) = (1.-xi(1))*(1.+xi(2))*(1.+xi(3))/8.;
    elseif nNoEl == 20
        N(1) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3))*(-xi(1)-xi(2)-xi(3)-2.)/8.;
        N(2) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3))*(xi(1)-xi(2)-xi(3)-2.)/8.;
        N(3) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3))*(xi(1)+xi(2)-xi(3)-2.)/8.;
        N(4) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3))*(-xi(1)+xi(2)-xi(3)-2.)/8.;
        N(5) = (1.-xi(1))*(1.-xi(2))*(1.+xi(3))*(-xi(1)-xi(2)+xi(3)-2.)/8.;
        N(6) = (1.+xi(1))*(1.-xi(2))*(1.+xi(3))*(xi(1)-xi(2)+xi(3)-2.)/8.;
        N(7) = (1.+xi(1))*(1.+xi(2))*(1.+xi(3))*(xi(1)+xi(2)+xi(3)-2.)/8.;
        N(8) = (1.-xi(1))*(1.+xi(2))*(1.+xi(3))*(-xi(1)+xi(2)+xi(3)-2.)/8.;
        N(9)  = (1.-xi(1)^2)*(1.-xi(2))*(1.-xi(3))/4.;
        N(10) = (1.+xi(1))*(1.-xi(2)^2)*(1.-xi(3))/4.;
        N(11) = (1.-xi(1)^2)*(1.+xi(2))*(1.-xi(3))/4.;
        N(12) = (1.-xi(1))*(1.-xi(2)^2)*(1.-xi(3))/4.;
        N(13) = (1.-xi(1)^2)*(1.-xi(2))*(1.+xi(3))/4.;
        N(14) = (1.+xi(1))*(1.-xi(2)^2)*(1.+xi(3))/4.;
        N(15) = (1.-xi(1)^2)*(1.+xi(2))*(1.+xi(3))/4.;
        N(16) = (1.-xi(1))*(1.-xi(2)^2)*(1.+xi(3))/4.;
        N(17) = (1.-xi(1))*(1.-xi(2))*(1.-xi(3)^2)/4.;
        N(18) = (1.+xi(1))*(1.-xi(2))*(1.-xi(3)^2)/4.;
        N(19) = (1.+xi(1))*(1.+xi(2))*(1.-xi(3)^2)/4.;
        N(20) = (1.-xi(1))*(1.+xi(2))*(1.-xi(3)^2)/4.;
    end
end

end