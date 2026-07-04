using RheoModels
using Test

@testset "RheoModels.jl" begin

    @testset "Temperature Models" begin

        # Constant Temperature
        c = Constant(10.0)
        @test c(300.0) == 10.0

        # Arrhenius
        a = Arrhenius(Aref=1.0, Tref=2.0, E=8.314)
        @test a(1.0) ≈ exp(0.5) atol=1E-3

        # WLF
        w = WLF(Aref=1.0, Tref=0.0, C1=1.0, C2=1.0)
        @test w(1.0) ≈ 10^(-0.5)

    end

    @testset "Rheology Models" begin

        # Newtonian
        n = Newtonian(Constant(10.0))
        @test n(1.0, 500.0) == 10.0

        # Newtonian (temperature dependent)
        n = Newtonian(Arrhenius(Aref=1.0, Tref=2.0, E=8.314))
        @test n(1.0, 1.0) ≈ exp(0.5) atol=1E-3

        # Power law (constant temperature, n = 2)
        p = PowerLaw(K=Constant(10.0), n=2)
        @test p(1.0, 1.0) ≈ 10.0

        p = PowerLaw(K=Constant(10.0), n=2)  # temperature (in)dependence
        @test p(1.0, 10.0) ≈ 10.0

        # Power law (n = 3)
        p = PowerLaw(K=Constant(10.0), n=3)
        @test p(10.0, 10.0) ≈ 1000.0

        # Cross
        c = Cross(
            η0=Constant(10.0),
            ηinf=Constant(1.0),
            τ=2.0,
            n=2.0)
        @test c(1.0, 1.0) ≈ 8.5

        # Carreau
        c = Carreau(
            η0=Constant(10.0),
            ηinf=Constant(1.0),
            λ=Constant(0.5),
            n=2.0)
        @test c(1.0, 1.0) ≈ 11.062 atol=1E-3

        # Carreau-Yasuda
        cy = CarreauYasuda(
            η0=Constant(10.0),
            ηinf=Constant(1.0),
            λ=Constant(0.5),
            n=2.0,
            a=2.0)
        @test cy(1.0, 1.0) ≈ 11.062 atol=1E-3

    end

end
