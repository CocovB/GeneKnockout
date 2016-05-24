"""
    pyOptKnock 1.0
    ==============
    
    A Python implementation of the OptKnock algorithm
    Copyright (C) 2014 Coco van Boxtel and Brett G. Olivier, VU University Amsterdam, Amsterdam, The Netherlands
    
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
    
    Authors: Coco van Boxtel and Brett G. Olivier
    Contact email: c.van.boxtel@vu.com
    Contact email: bgoli@users.sourceforge.net
    
    Notes:
    
    - primal and dual variable FVA not tested
    - although in principle code should be ready for inner problems with multiple
    terms e.g. max: J1 + J2 this has not beed tested
    - by default all inner problem variables are included in the MILP search space if
    they are able to attain a zero value, search subsets can be implemented
    - CPLEX pool solution are ready to be implemented for optimal solution
    - subobtimal solutions, with a smaller sum(KO) are not implemented yet
    
    - this code is NOT OPTIMIZED and CPLEX SPECIFIC, although the LP itself is generic. CPLEX optimizations will significantly reduced model construction time
    
    
"""

import os
cDir = os.path.dirname(os.path.abspath(os.sys.argv[0]))
import pyOpt


### User input ######

# modelFile = 'ModelinRefCondition.xml'
# modelFile = 'iTM686_biofuels.sbml3.xml'
# modelFile = 'toy_model_biofuel.l3.xml'
# modelFile = 'iaz_sbml3.xml'
modelFile = 'imm_sbml3.xml'

product_dict = {
'iaz_sbml3.xml':'R_EX_succ_e_',
'imm_sbml3.xml':'R_EX_succ_e_',
'toy_model_biofuel.l3.xml':'R09',
'iTM686_biofuels.sbml3.xml':'R_EX_etoh_e',
'ModelinRefCondition.xml':'R_EX_ac_e'
}
bilevelObjective = (product_dict[modelFile], 1)

biomass_dict = {
'iaz_sbml3.xml':'R_biomass_core',
'imm_sbml3.xml': 'R_biomass_SC5_notrace',
'toy_model_biofuel.l3.xml':'R17',
'iTM686_biofuels.sbml3.xml':'R_BiomassHetero',
'ModelinRefCondition.xml':'R_BiomassAuto'
}
bio_reaction = biomass_dict[modelFile]

print bilevelObjective, bio_reaction    
# percentage of bio_reaction that should be maintained
objMinFactor = 0.1
# the minimum number of fluxes that need to be potentially active (total number of fluxes - deletions)
maxDelete = 3
    
# Define value that indicates 'unbounded' in sbml file, to be translated to cplex.inf
# If boundaries are already defined infinite, make sure this value is high
infinityValue = 99999
    
# Use gene knockouts instead of reaction knockouts
# Warning, the model needs to have well defined GPR associations; '(G1 and G2 or G3) or (G6)'
USE_GENE = True
    
# Reduce number of knockouts
# Keep alpha value small enough to avoid potential dilution of the bilevel objective
# Can only be used if bilevelObjective is maximization
USE_KNOCKOUT_WEIGHTING = False
KNOCKOUT_WEIGHTING_ALPHA = 0.0002
    
# Allow a near optimal solution (e.g. 5% less than maximum)
# This will increase the solution speed.
SOLUTION_FROM_OPTIMUM = 0.05
#####################

NoGene = pyOpt.runOptKnock(modelFile, bilevelObjective, bio_reaction, objMinFactor, maxDelete, infinityValue, USE_GENE, USE_KNOCKOUT_WEIGHTING, KNOCKOUT_WEIGHTING_ALPHA, SOLUTION_FROM_OPTIMUM)






