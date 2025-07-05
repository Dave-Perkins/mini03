include("plot_graph.jl")
include("scoring.jl")
using Makie.Colors 
using Random
using StatsBase
using Colors

mutable struct NodeInfo
    label::Int
    neighbors::Vector{Int}
end

#=
> Shuffle the nodes.
> Iterate through the nodes.
>   Change the current node's label to the neighbor's label that increases the score the most.
>   (Break ties at random, and skip the node if no label change improves the score.)
>   
=#

function our_algorithm(g, node_info)
    shuffled_nodes = shuffle(1:nv(g))
    current_colors = [node_info[k].label for k in 1:nv(g)]
    current_score = get_score(g, node_info, current_colors)
    for n in shuffled_nodes
        # @show n
        score_changes = Dict{Int, Int}()
        new_coloring = [node_info[k].label for k in 1:nv(g)]
        # @show node_info[n].neighbors 
        for nbr in node_info[n].neighbors
            new_coloring[n] = node_info[nbr].label 
            score_changes[nbr] = get_score(g, node_info, new_coloring) - current_score
        end
        # @show score_changes
        max_change = maximum(values(score_changes))
        if max_change > 0
            keys_at_max = [key for (key, value) in score_changes if value == max_change]
            best_key = rand(keys_at_max)
            # @show best_key
            node_info[n].label = node_info[best_key].label
            # @show node_info
        end
    end
end

function label_propagation(g, node_info)
    label_changed = true
    while label_changed
        label_changed = false
        shuffled_nodes = shuffle(1:nv(g))
        for n in shuffled_nodes
            neighbor_labels = [node_info[j].label for j in node_info[n].neighbors]
            most_common = findmax(countmap(neighbor_labels))[2]
            if node_info[n].label != most_common
                node_info[n].label = most_common
                label_changed = true
            end
        end
    end
end


function main(filename = "graph03.txt")
    edge_list = read_edges(filename)
    g = build_graph(edge_list)

    # Build a dictionary mapping node indices to the node's info
    node_info = Dict{Int, NodeInfo}()
    for n in 1:nv(g)
        node_info[n] = NodeInfo(n, collect(neighbors(g, n)))
    end
    
    # Run label propagation
    @show node_info
    our_algorithm(g, node_info)
    @show node_info
    our_algorithm(g, node_info)
    @show node_info
    our_algorithm(g, node_info)

    # Use a fixed-size color palette for cycling, e.g., 16 colors
    palette_size = 16
    color_palette = Makie.distinguishable_colors(palette_size)

    # Assign initial color indices based on label (but allow cycling through all palette colors)
    labels = unique([node.label for node in values(node_info)])
    label_to_color_index = Dict(labels[i] => mod1(i, palette_size) for i in eachindex(labels))
    node_color_indices = [label_to_color_index[node_info[n].label] for n in 1:nv(g)]
    node_colors = [color_palette[i] for i in node_color_indices]
    node_text_colors = [Colors.Lab(RGB(c)).l > 50 ? :black : :white for c in node_colors]

    interactive_plot_graph(g, node_info, node_colors, node_text_colors, node_color_indices, color_palette)

    # Report the score
    score = get_score(g, node_info, node_color_indices)
    println("score is $score")
end

main()