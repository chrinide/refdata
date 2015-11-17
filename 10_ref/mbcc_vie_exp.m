#! /usr/bin/octave

list={...
       "CH3","ClO","HCO","NH2","NH",...
       "NO2","NO","O2","OH","S2",...
       "SiH3","H2","Cl2","ClF","CO",...
       "CS","F2","HCl","HF","N2",...
       "P2","SiO","NaCl","CO2","H2O",...
       "H2S","HCN","SO2","CS2","SiF2",...
       "F2O","NNO","NSF","O3","OCS",...
       "FCN","HOCl","CH2O","H2O2","NH3",...
       "PH3","C2N2","HCCF","AlCl3","BCl3",...
       "BF3","CF2O","ClF3","H2CS","NF3",...
       "PF3","C2H2","C3O2","CBrF3","CCl2F2",...
       "CCl3H","CCl4","CClF3","CF4","CFCl3",...
       "CH2Cl2","CH2CO","CH2F2","CH3Cl","CH3F",...
       "CH4","CHF3","HCCCN","HCOOH","NSF3",...
       "SiF4","SiH4","C2F4","C2H4","CF3CN",...
       "CH2CF2","CH3CN","CH3NC","CH3OH","CH3SH",...
       "CHFCF2","Z-CHF-CHF","Cl2CCF2","Chloroethene","Fluoroethene",...
       "H2CCCl2","HCCCCH","HCCCHO","HCONH2","N2H4",...
       "NCCCCN","OCHCHO","Acrylonitrile","CH2CCH2","CH3CCH",...
       "CH3CClO","CH3NO2","Cyclopropene","Ethylene_oxide","Thiirane",...
       "HCCCCCN","SF6","Acrolein","CH3CCCN","CH3CH2Cl",...
       "CH3CH3","CH3SiH3","CH4N2O","Ethylenimine","1_1-Dicyanoethylene",...
       "Si2H6","s-Tetrazine","2-Propenoic_acid","CH3CH2OH","CH3CONH2",...
       "CH3OCH3","Cyclopropane","Furan","Propene","Thiophene",...
       "1_3-Butadiene","2-Propen-1-ol","2-Propenamide","CH3CCCH3","CH3COCH3",...
       "CH3NHCH3","CH3SOCH3","Cyclobutene","Pyrrole","Methoxyethene",...
       "Methylacrylonitrile","Pyrazine","Pyrimidine","Pyridine","1-Chloropropane",...
       "Butenone","CH3CH2CH3","Fulvene","Vinyl_acetate","Methyl_prop-2-enoate",...
       "Isoprene","NC3H9","2-Methylpropene","Isobutane","2-Vinylpyridine",...
       "Styrene","Benzene","Naphthalene","Anthracene","Tetracene",...
       "Pentacene","Hexacene"};

eref_exp = [...
             9.84, 11.01, 9.31, 12.0, 13.49,...
             11.23, 9.26, 12.3, 13.02, 9.55,...
             8.74, 16.51, 11.49, 12.77, 14.01,...
             11.34, 15.7, 12.75, 16.12, 15.58,...
             10.65, 11.61, 9.0, 13.79, 12.62,...
             10.5, 13.61, 12.5, 10.09, 11.08,...
             13.26, 12.89, 11.82, 12.73, 11.19,...
             13.65, 11.22, 10.9, 11.7, 10.8,...
             10.59, 13.51, 11.5, 12.01, 11.64,...
             15.96, 13.6, 13.05, 9.38, 13.6,...
             12.2, 11.49, 10.8, 12.08, 12.24,...
             11.5, 11.69, 13.08, 16.33, 11.73,...
             11.4, 9.64, 13.3, 11.29, 13.6,...
             14.4, 14.8, 11.75, 11.5, 12.5,...
             16.4, 12.85, 10.69, 10.68, 14.3,...
             10.7, 12.46, 11.32, 10.96, 9.44,...
             10.62, 10.62, 9.82, 10.2, 10.63,...
             10.0, 10.3, 10.8, 10.4, 10.07,...
             11.99, 10.6, 10.92, 10.2, 10.54,...
             11.03, 11.29, 9.86, 10.57, 9.05,...
             10.57, 15.7, 10.1, 10.95, 11.06,...
             12.7, 11.6, 10.33, 9.85, 11.38,...
             10.53, 9.72, 10.78, 10.64, 10.0,...
             10.1, 10.9, 9.0, 9.91, 8.90,...
             9.03, 10.22, 10.0, 9.79, 9.8,...
             8.95, 9.1, 9.59, 8.23, 9.05,...
             10.37, 9.63, 9.73, 9.6, 10.88,...
             9.61, 12.1, 8.55, 9.85, 10.74,...
             8.85, 8.54, 9.45, 11.6, 8.92,...
             8.48, 9.45, 8.15, 7.44, 6.97,...
             6.61, 6.36];

eref_cc = [...
            9.74, 10.95, 9.18, 12.03, 13.44,...
            11.00, 9.54, 12.27, 12.98, 9.38,...
            8.8, 16.4, 11.53, 12.72, 13.95,...
            11.32, 15.76, 12.68, 16.17, 15.55,...
            10.58, 11.51, 9.05, 13.81, 12.69,...
            10.39, 13.77, 12.4, 10.05, 11.15,...
            13.24, 12.92, 11.78, 12.8, 11.21,...
            13.61, 11.22, 10.93, 11.62, 10.96,...
            10.53, 13.58, 11.41, 12.0, 11.72,...
            16.04, 13.58, 12.86, 9.35, 13.6,...
            12.21, 11.46, 10.73, 11.93, 12.18,...
            11.47, 11.77, 13.01, 16.45, 11.74,...
            11.56, 9.72, 13.45, 11.36, 13.44,...
            14.39, 14.95, 11.81, 11.55, 12.49,...
            16.58, 12.81, 10.54, 10.69, 14.24,...
            10.63, 12.54, 11.27, 11.11, 9.46,...
            10.53, 10.54, 9.91, 10.21, 10.61,...
            10.06, 10.29, 10.83, 10.41, 10.28,...
            12.04, 10.61, 11.12, 10.26, 10.55,...
            11.11, 11.51, 10.01, 10.74, 9.06,...
            10.73, 15.76, 10.18, 11.0, 11.12,...
            12.74, 11.73, 10.32, 9.94, 11.54,...
            10.63, 9.7, 10.87, 10.86, 9.95,...
            10.21, 10.92, 9.06, 10.01, 9.09,...
            9.22, 10.42, 9.98, 9.79, 9.81,...
            9.07, 9.11, 9.72, 8.39, 9.25,...
            10.59, 9.7, 9.81, 9.74, 10.96,...
            9.77, 12.16, 8.63, 9.82, 10.57,...
            9.05, 8.59, 9.53, 11.73, 8.97,...
            8.65, 9.43, 8.24, 7.47, 6.95,...
            6.57, 6.43];

printf("| Name | Exp. | CCSD(T) |\n")
for i = 1:length(list)
  printf("| %20s | %7.2f | %7.2f |\n",list{i},eref_exp(i),eref_cc(i));
endfor
