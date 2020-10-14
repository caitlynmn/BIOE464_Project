function energy=compute_E(r,rcut)
U=zeros(1,1);
epsil=1;
rc=1;
if r<=rcut
    Ulj(r,1)=4*epsil*(((rc/r)^12)-((rc/r)^6));
    U(r,1)=Ulj;
end
