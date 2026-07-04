# ================================================================
# Predefined models
# ================================================================

"""
    PEEK

Cross rheology model for the temperature-dependent viscosity of PEEK,
with Arrhenius-type temperature dependence, as measured and fitted by Pierik.

# Usage
- `η = PEEK(γ̇, T)`

# Arguments
- `γ̇`: Shear rate [1/s], must be non-negative
- `T`: Temperature [K]

# Returns
- `η`: Viscosity [Pa⋅s]
"""
PEEK = Cross(
    η0 = Arrhenius(Aref=733.67, Tref=370.0+273.15, E=5.57E4),
    ηinf = Constant(0.0),
    τ = 6.05E4,
    n = 0.38
)

"""
    LMPAEK

Cross rheology model for the temperature-dependent viscosity of LM-PAEK,
with Arrhenius-type temperature dependence, as measured and fitted by Pierik.

# Usage
- `η = LMPAEK(γ̇, T)`

# Arguments
- `γ̇`: Shear rate [1/s], must be non-negative
- `T`: Temperature [K]

# Returns
- `η`: Viscosity [Pa⋅s]
"""
LMPAEK = Cross(
    η0 = Arrhenius(Aref=681.90, Tref=345.0+273.15, E=5.13E4),
    ηinf = Constant(0.0),
    τ = 2.53E5,
    n = 0.42
)

"""
    PPS

Cross rheology model for the temperature-dependent viscosity of PPS,
with Arrhenius-type temperature dependence, as measured and by Grouve.

# Usage
- `η = PPS(γ̇, T)`

# Arguments
- `γ̇`: Shear rate [1/s], must be non-negative
- `T`: Temperature [K]

# Returns
- `η`: Viscosity [Pa⋅s]
"""
PPS = Cross(
    η0 = Arrhenius(Aref=223.21, Tref=300.0+273.15, E=6.86E4),
    ηinf = Constant(0.0),
    τ = 7.41E5,
    n = 0.28
)
