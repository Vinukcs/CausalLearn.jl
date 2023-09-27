function fci(
    csv_file::AbstractString,
    test_method::AbstractString,
    alpha::Float64=0.01,
    depth::Int=1,
    max_path_length::Int=-1,
    verbose::Bool=false
)

    df = CSV.read(csv_file,DataFrame) |> DataFrame
    data=Matrix(df)

    column_names = names(df)
    node_labels = ["x$i" for i in 1:length(column_names)]
    #println("Column Names: $column_names") 
    #Julia wrapper for causal-learn

    cl_fci = pyimport("causallearn.search.ConstraintBased.FCI")
    cl_graph=pyimport("causallearn.utils.GraphUtils")
    fci = cl_fci.fci
    GraphUtils=cl_graph.GraphUtils

  
    #G, edges = fci(data,"fisherz")
    G, edges = fci(data,test_method,alpha,depth,max_path_length,verbose)

    pdy=GraphUtils.to_pydot(G, labels=column_names)
    pdy.write_png("pic.png")
   
end
