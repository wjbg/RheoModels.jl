# RheoModels.jl

RheoModels.jl is a Julia package with temperature-dependent rheological models for fluids. It provides a flexible framework for common temperature dependency models and various constitutive rheological equations, along with a (small) collection of predefined material models for easy access to common polymer rheology data.


## Features

*   **Abstract Interfaces:** Defines `TemperatureModel` and `RheologyModel` abstract types for extensibility.
*   **Temperature Models:** Implementations for `Constant`, `Arrhenius`, and Williams-Landel-Ferry (`WLF`) equations to describe temperature dependency of material properties.
*   **Rheology Models:** Implementations for common constitutive models including `Newtonian`, `PowerLaw`, `Cross`, `Carreau`, and `CarreauYasuda` models, which can incorporate temperature-dependent parameters.
*   **Unified Interface:** A consistent function call `(model)(γ̇, T)` for all rheology models and `(model)(T)` for temperature models.

## Usage

The package includes three predefined material models, which are instances of the `Cross` rheology model with specific, pre-fitted parameters.

```julia
using RheoModels

gamma_dot = 10.0 # 1/s
temperature = 380.0 + 273.15 # K

# PEEK model
η_PEEK = PEEK(gamma_dot, temperature)
println("PEEK viscosity at γ̇=$(gamma_dot) and T=$(temperature)K: ", η_peek, " Pa⋅s")

# LM-PAEK model
η_LMPAEK = LMPAEK(gamma_dot, temperature)
println("LM-PAEK viscosity at γ̇=$(gamma_dot) and T=$(temperature)K: ", η_lmpaeK, " Pa⋅s")

# PPS model
η_PPS = PPS(gamma_dot, temperature)
println("PPS viscosity at γ̇=$(gamma_dot) and T=$(temperature)K: ", η_pps, " Pa⋅s")
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
