module RheoModels

# Exported types and functions
export TemperatureModel, RheologyModel
export Constant, Arrhenius, WLF  # Temperature models
export Newtonian, PowerLaw, Cross, Carreau, CarreauYasuda  # Rheology models
export PPS, PEEK, LMPAEK

# Include sub-files
include("models.jl")
include("materials.jl")

end
