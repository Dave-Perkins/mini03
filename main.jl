# MINI03 - Community Detection for 3-SAT Research
# Main entry point

# Add src to load path
push!(LOAD_PATH, joinpath(@__DIR__, "src"))

# Import core modules
include("src/scoring.jl")
include("src/plot_graph.jl")
include("src/mini03.jl")
include("src/sat3_markdown_generator.jl")
include("src/research_pipeline.jl")

"""
    MINI03 - Community Detection for 3-SAT Research

Main functions:
    • run_graph(filename) - Analyze a graph file
    • run_graph_interactive(filename) - Interactive analysis
    • research_pipeline(vars, clauses; seed=nothing) - Generate and analyze 3-SAT instances
    • generate_random_3sat(vars, clauses; seed=nothing) - Create 3-SAT instances

Examples:
    # Analyze existing graph
    julia> run_graph("graphs/graph03.txt")
    
    # Interactive analysis
    julia> run_graph_interactive("graphs/graph03.txt")
    
    # Generate and analyze 3-SAT instance
    julia> research_pipeline(5, 15, seed=123)
    
    # Generate markdown 3-SAT
    julia> instance = generate_random_3sat(4, 10)
    julia> md = to_markdown(instance, "My Test Instance")
"""

# Welcome message
println("🌟 MINI03 - Community Detection for 3-SAT Research")
println("=" ^60)
println("📚 Core functions loaded:")
println("   • run_graph(filename) - Simple analysis workflow") 
println("   • run_graph_interactive(filename) - Interactive menu")
println("   • research_pipeline(vars, clauses; seed=nothing) - 3-SAT research")
println("   • generate_random_3sat(vars, clauses; seed=nothing) - Generate instances")
println()
println("🚀 Quick start:")
println("   julia> run_graph(\"graphs/graph03.txt\")")
println("   julia> research_pipeline(5, 15, seed=123)")
println()

# List available graph files
println("📁 Available graph files:")
println("=" ^60)
graph_dir = "graphs"
if isdir(graph_dir)
    for file in readdir(graph_dir)
        if endswith(file, ".txt")
            println("   • graphs/$file")
        end
    end
else
    println("   (No graphs directory found)")
end

research_dir = "research"  
if isdir(research_dir)
    println()
    println("📊 Research instances:")
    for file in readdir(research_dir)
        if endswith(file, ".md")
            println("   • research/$file")
        end
    end
end
