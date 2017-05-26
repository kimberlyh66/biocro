# Do the calculations inside an empty list so that temporary variables are not created in .Global.
willow_parameters = with(list(), {
    datalines =
    "symbol value
     timestep      1
     lat           40
     seneLeaf       1600
     seneStem       5500
     seneRoot       5500
     seneRhizome    5500
     Tfrosthigh    5   
     Tfrostlow     0   
     leafdeathrate 5
     iSp                 1.1      
     SpD                0        
     nlayers            10       
     kd                 0.37     
     mrc1             0.02
     mrc2             0.03
     heightf       3        
     growth_respiration_fraction 0.3
     vmax1   100 
     alpha1  0
     jmax   180 
     Rd     1.1 
     Catm   400 
     O2     210 
     b0     0.08
     b1     5   
     theta  0.7 
     water_stress_approach     0   
     tp1       250   
     tp2       350   
     tp3       900   
     tp4       1200  
     tp5       3939  
     tp6       7000  
     kStem1    0.01  
     kLeaf1    0.98  
     kRoot1    0.01  
     kRhizome1 -8e-04
     kStem2    0.01  
     kLeaf2    0.98  
     kRoot2    0.003 
     kRhizome2 0.007 
     kStem3    0.7   
     kLeaf3    0.15  
     kRoot3    0.045 
     kRhizome3 0.105 
     kStem4    0.7   
     kLeaf4    0.15  
     kRoot4    0.045 
     kRhizome4 0.105 
     kStem5    0.7   
     kLeaf5    1e-05 
     kRoot5    0.15  
     kRhizome5 0.15  
     kStem6    0.7   
     kLeaf6    1e-06 
     kRoot6    0.15  
     kRhizome6 0.15  
     kGrain6   0     
     tbase     0     
     FieldC     -1       
     WiltP      -1       
     phi1       0.01     
     phi2       10       
     soilDepth  1        
     soilType   6        
     soilLayers 1        
     soilDepths1 0
     soilDepths2 1
     wsFun      0        
     scsf       1        
     transpRes  5e+06    
     leafPotTh  -800     
     hydrDist   0        
     rfl        0.2      
     rsec       0.2      
     rsdf       0.44   
     LeafN_0   2   
     kln      0.5 
     vmaxb1  0   
     alphab1 0   
     kpLN     0.2 
     lnb0     -5  
     lnb1     18  
     lnfun    0
     electrons_per_carboxylation    4.5
     electrons_per_oxygenation 5.25"
    
    data_frame = read.table(textConnection(datalines), header=TRUE)
    values = as.list(data_frame$value)
    names(values) = data_frame$symbol
    values
})

