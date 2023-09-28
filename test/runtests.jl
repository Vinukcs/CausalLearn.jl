using CausalLearn
using Test

@testset "CausalLearn.jl" begin
    csv_file= "auto-mpg.csv"
    @test CausalLearn.granger_lasso(csv_file)
end
