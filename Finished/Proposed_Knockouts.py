import pyscescbm as cbm

# Set values
biomass = 'R_BiomassAuto'
fuel = 'R_EX_ac_e'

knockouts = ['sll0542', 'sll1299']

# Set growth conditions
model = cbm.CBRead.readSBML3FBC('ModelinRefCondition.xml')
model.createGeneAssociationsFromAnnotations()
model.setObjectiveFlux(biomass, osense = 'maximize')

model.setReactionBounds('R_EX_photon_e', -30, 0.0)
model.setReactionBounds('R_EX_hco3_e', -3.7, 0.0)
model.setReactionBounds('R_EX_glc_e', 0.0, 99999.0)

cbm.CBSolver.analyzeModel(model)

ObjValueInit = model.getReaction(biomass).getValue()
AcetateInit = model.getReaction(fuel).getValue()

# Apply Knockouts
for g_ in knockouts:
        #model.setReactionBounds(g_, 0.0, 0.0)
        model.setGeneInactive(g_, update_reactions=True)

cbm.CBSolver.analyzeModel(model)

ObjValue = model.getReaction(biomass).getValue()

model.setReactionLowerBound(biomass, ObjValue)
model.setReactionUpperBound(biomass, ObjValue)

cbm.CBSolver.analyzeModel(model, oldlpgen=False)

test = cbm.FluxVariabilityAnalysis(model, selected_reactions = [fuel])

print 'Original biomass value: {}'.format(ObjValueInit)
print 'Original acetate value: {}'.format(AcetateInit)
print 'New biomass value: {}'.format(ObjValue)
print 'Acetate lower bound: {}'.format(test[0][0][2])
print 'Acetate lower bound: {}'.format(test[0][0][3])
