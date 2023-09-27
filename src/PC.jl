

function pc(
    csv_file::AbstractString,
    alpha::Float64=0.01,
    test_method::AbstractString="fisherz",
    stable::Bool=true,
    uc_rule::Int=0,
    uc_priority::Int=2,
    mvpc::Bool=false,
    verbose::Bool=false
)

    df = CSV.read(csv_file,DataFrame) |> DataFrame
    data=Matrix(df)

    column_names = names(df)
    node_labels = ["x$i" for i in 1:length(column_names)]
     

    cl_pc = pyimport("causallearn.search.ConstraintBased.PC")
    cl_graph=pyimport("causallearn.utils.GraphUtils")
    pc = cl_pc.pc
    GraphUtils=cl_graph.GraphUtils

  
   
    cg = pc(data,alpha,test_method,stable,uc_rule,uc_priority,mvpc,verbose)

    pdy=GraphUtils.to_pydot(cg.G, labels=column_names)
    pdy.write_png("pic.png")
   
end



