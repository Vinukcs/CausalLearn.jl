using CausalLearn
using Test

@testset "CausalLearn.jl" begin
    csv_file= "auto-mpg.csv"
    @test CausalLearn.pc(csv_file,0.05,"fisherz")
end
