(* ::Package:: *)

(* ::Input:: *)
(**)
(**)
(*Quiet[<<HighEnergyPhysics`FeynCalc`;]*)


(* ::Input:: *)
(**)
(*(* Kinematic part *) (*k4 is 4-vector for initial photon*)*)
(*k1k2[a1_,b1_,a2_,b2_]:=b2^2/a2+b1^2/a1 + a1*a2^3 +a1^3*a2 - 3(a1+a2)(1-a1-a2)(1-a1-a2+a1*a2);*)
(*kk4[a_,b_]:=a+b^2/a+a^3; (*both for k1 and k2*)*)
(*ksq[a_]:=2a^4; (*squared momentum, k1 or k2 *)*)
(**)
(*(*Matrix element*)     (*FourVector[u,\[Lambda]1]FourVector[u,\[Mu]1]*)*)
(*sp[p_,q_]:=ScalarProduct[p,q];*)
(*T[k_,p_,\[Mu]_,\[Nu]_]:=2sp[p,k]MT[\[Mu],\[Nu]]-2FourVector[p,\[Mu]]FourVector[k,\[Nu]];   (*4 terms reduces to two*)*)
(*Tdual[k_,p_,c_,d_]:=4FourVector[k,a]FourVector[p,b]LeviCivita[c,a,d,b]//Contract;  (*4 terms reduces to one*)*)
(*MFirstEuHeisTerm=8(T[k1,k2,\[Lambda]1,\[Lambda]2]T[k3,k4,\[Lambda]3,\[Lambda]4]+T[k1,k3,\[Lambda]1,\[Lambda]3]T[k2,k4,\[Lambda]2,\[Lambda]4]+T[k1,k4,\[Lambda]1,\[Lambda]4]T[k2,k3,\[Lambda]2,\[Lambda]3])//Contract//FullSimplify (*full symmetry factor = 4! = 4*3*2 \[Rule] 3 different terms * 8 same  *)*)
(*MDualEuHeisTerm=8(Tdual[k1,k2,\[Lambda]1,\[Lambda]2]Tdual[k3,k4,\[Lambda]3,\[Lambda]4]+Tdual[k1,k3,\[Lambda]1,\[Lambda]3]Tdual[k2,k4,\[Lambda]2,\[Lambda]4]+Tdual[k1,k4,\[Lambda]1,\[Lambda]4]Tdual[k2,k3,\[Lambda]2,\[Lambda]3])//Contract//FullSimplify*)
(*MTotEuHeis=(MFirstEuHeisTerm+7/16MDualEuHeisTerm);*)
(*MTotEuHeisConj=ComplexConjugate[MTotEuHeis]/.{\[Lambda]1->\[Mu]1,\[Lambda]2->\[Mu]2,\[Lambda]3->\[Mu]3,\[Lambda]4->\[Mu]4};*)
(*(*The first term --- all polarization sums are Lorentz-invariant*)*)
(*(*AMP1=Contract[MTotEuHeisConj*MTotEuHeis MT[\[Lambda]1,\[Mu]1]MT[\[Lambda]2,\[Mu]2]MT[\[Lambda]3,\[Mu]3]MT[\[Lambda]4,\[Mu]4]]//Simplify;*)
(*R1[a1_,a2_,b1_,b2_]:=AMP1/.{sp[k1,k1]\[Rule] ksq[a1],sp[k2,k2]\[Rule] ksq[a2],sp[k4,k4]\[Rule] 2,*)
(*sp[k1,k2]\[Rule] k1k2[a1,b1,a2,b2],*)
(*sp[k4,k2]\[Rule]kk4[a2,b2],sp[k1,k4]\[Rule] kk4[a1,b1],*)
(*sp[k3,k4]\[Rule] 2-kk4[a1,b1]-kk4[a2,b2],*)
(*sp[k1,k3]\[Rule] kk4[a1,b1]-k1k2[a1,b1,a2,b2]- ksq[a1],*)
(*sp[k2,k3]\[Rule]kk4[a2,b2] - k1k2[a1,b1,a2,b2]- ksq[a2],sp[k3,k3]\[Rule] 2+ ksq[a1]+ksq[a2]-2kk4[a1,b1]-2kk4[a2,b2]+2k1k2[a1,b1,a2,b2]}//FullSimplify //Expand *)
(*R1[a1,a2,b1,b2]*)*)
(*(*Notation -- FV[u,\[Mu]] is fixed timelike vector (1,0,0,0)*)*)
(*(*The 2nd term --- LV correction to the 1st polarization sum, others are Lorentz-invariant*)*)
(*AMPFULL=Contract[MTotEuHeisConj*MTotEuHeis (MT[\[Lambda]1,\[Mu]1]+ 2aa1^2FV[u,\[Lambda]1]FV[u,\[Mu]1] )(MT[\[Lambda]2,\[Mu]2]+ 2aa2^2FV[u,\[Lambda]2]FV[u,\[Mu]2] )(MT[\[Lambda]3,\[Mu]3]+ 2aa3^2FV[u,\[Lambda]3]FV[u,\[Mu]3] )(MT[\[Lambda]4,\[Mu]4]+ 2FV[u,\[Lambda]4]FV[u,\[Mu]4] )]//FullSimplify//Expand*)
(*RFULL[a1_,a2_,b1_,b2_]:=AMPFULL/.{sp[u,k1]->a1, sp[u,k2]->a2,sp[u,k3]->1-a1-a2,sp[u,k4]-> 1, sp[u,u]-> 1,*)
(*aa1 -> a1, aa2 -> a2, aa3 -> 1-a1-a2,*)
(*sp[k1,k1]-> ksq[a1],sp[k2,k2]-> ksq[a2],sp[k4,k4]-> 2,*)
(*sp[k1,k2]-> k1k2[a1,b1,a2,b2],*)
(*sp[k4,k2]->kk4[a2,b2],sp[k1,k4]-> kk4[a1,b1],*)
(*sp[k3,k4]-> 2-kk4[a1,b1]-kk4[a2,b2],*)
(*sp[k1,k3]-> kk4[a1,b1]-k1k2[a1,b1,a2,b2]- ksq[a1],*)
(*sp[k2,k3]->kk4[a2,b2] - k1k2[a1,b1,a2,b2]- ksq[a2],sp[k3,k3]-> 2+ ksq[a1]+ksq[a2]-2kk4[a1,b1]-2kk4[a2,b2]+2k1k2[a1,b1,a2,b2]}//FullSimplify //Expand *)
(*RFULL[a1,a2,b1,b2]*)
(**)
(**)
(**)
(**)


(* ::Input:: *)
(*RFULL[0.5,0.5,0.3,0.3]*)


(* ::Input:: *)
(*Print["Phase Volume   a1  a2"];*)
(*a10=0.0;*)
(*While[a10<0.999,*)
(*a10=a10+0.01;*)
(*a20=0.0;*)
(*While [a20<0.999 - a10,*)
(*a20=a20+0.01;*)
(*f[a1_,a2_]:=3(a1+a2)(1-a1-a2)(1-a1-a2+a1*a2);*)
(*cosPhi2[a1_,a2_,b1_,b2_]:=1/(2b1 b2) (f[a1,a2]-(1-a2)/a1 b1^2-(1-a1)/a2 b2^2);*)
(*Region[a1_,a2_,b1_,b2_]:=Boole[Abs[cosPhi2[a1,a2,b1,b2]]<=1];*)
(*RegionA[a1_,a2_]:=Boole[a1+a2<1];*)
(*M[a1_,a2_,b1_,b2_]:=a2^2/a1^4*b1^8 + a1^2/a2^4*b2^8;*)
(*sinPhi2[a1_,a2_,b1_,b2_]:=Sqrt[1-cosPhi2[a1,a2,b1,b2]^2];*)
(*\[CapitalPhi]=Re[NIntegrate[(Region[a10,a20,b1,b2]RegionA[a10,a20]RFULL[a10,a20,b1,b2])/(a10*a20*sinPhi2[a10,a20,b1,b2]),{b1,0,1.5},{b2,0,1.5}]];*)
(*(*,Method\[Rule]{"MonteCarlo","MaxPoints"\[Rule]10^6}]];*)*)
(*RFULL2[aa1_,aa2_]:=\[CapitalPhi]/.{a10->aa1,a20->aa2};*)
(*Print[\[CapitalPhi],"      ",a10, "   ",a20]]]*)


(* ::Input:: *)
(*a10=0.0; Summ2=0;*)
(*While[a10<0.999,*)
(*Summ=0;*)
(*a10=a10+0.01;*)
(*a20=0.0;*)
(*While [a20<0.999 - a10,*)
(*a20=a20+0.01;*)
(*f[a1_,a2_]:=3(a1+a2)(1-a1-a2)(1-a1-a2+a1*a2);*)
(*cosPhi2[a1_,a2_,b1_,b2_]:=1/(2b1 b2) (f[a1,a2]-(1-a2)/a1 b1^2-(1-a1)/a2 b2^2);*)
(*Region[a1_,a2_,b1_,b2_]:=Boole[Abs[cosPhi2[a1,a2,b1,b2]]<=1];*)
(*RegionA[a1_,a2_]:=Boole[a1+a2<1];*)
(*sinPhi2[a1_,a2_,b1_,b2_]:=Sqrt[1-cosPhi2[a1,a2,b1,b2]^2];*)
(*If[((a10>a20)&&(a20>(1-a10)/2) ),*)
(*\[CapitalPhi]=Re[NIntegrate[(Region[a10,a20,b1,b2]RegionA[a10,a20]RFULL[a10,a20,b1,b2])/(a10*a20*sinPhi2[a10,a20,b1,b2]),{b1,0,1.5},{b2,0,1.5}]],*)
(*(*If[((a10==a20)||(a20==(1-a10)/2) ),\[CapitalPhi]=0.5*Re[NIntegrate[(Region[a10,a20,b1,b2]RegionA[a10,a20]RFULL[a10,a20,b1,b2])/(a10*a20*sinPhi2[a10,a20,b1,b2]),{b1,0,1.5},{b2,0,1.5}]],\[CapitalPhi]=0],*)\[CapitalPhi]=0];*)
(*(*,Method\[Rule]{"MonteCarlo","MaxPoints"\[Rule]10^6}]];*)*)
(*Summ = Summ+ \[CapitalPhi] * 0.01;*)
(*]*)
(*Print[Summ,"      ",a10];*)
(*Summ2=Summ2+Summ*0.01;*)
(*]*)
(*Print[Summ2]*)



