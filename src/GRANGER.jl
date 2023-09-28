
function granger_test_2d(
    csv_file::AbstractString,

)

    df = CSV.read(csv_file,DataFrame) |> DataFrame
    data=Matrix(df)

    cl_granger = pyimport("causallearn.search.Granger.Granger")
    Granger=cl_granger.Granger()

    p_value_matrix = Granger.granger_test_2d(df)


    return p_value_matrix
end


function granger_lasso(
    csv_file::AbstractString,

)

    df = CSV.read(csv_file,DataFrame) |> DataFrame
    data=Matrix(df)

    cl_granger = pyimport("causallearn.search.Granger.Granger")
    Granger=cl_granger.Granger()

    coeff = Granger.granger_lasso(data)

    return coeff
end








