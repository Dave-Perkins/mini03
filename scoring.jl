#=
Consider each pair of nodes in the graph; if the two nodes in the pair have the same color and
there is an edge between them, increase the score by 1, but if there is no edge between them,
decrease the score by 1; if the two nodes have different colors, and there is an edge between
them, decrease the score by 1. Ignore any pair where the nodes have different colors and there
is no edge between them.
=#

using Combinatorics

function get_score(g, node_info, node_color_indices)
    score = 0
    for (i, j) in combinations(1:nv(g), 2)
        same_color = node_color_indices[i] == node_color_indices[j]
        if same_color
            if j in node_info[i].neighbors
                score += 1
            else
                score -= 1
            end
        else
            if j in node_info[i].neighbors
                score -= 1
            end
        end
    end
    return score
end