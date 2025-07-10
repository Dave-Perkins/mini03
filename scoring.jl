#=
Modularity score function for weighted graphs,
entirely written by Copilot + Claude Sonnet
=#

function get_score(g, edge_weights, node_info, node_color_indices)
    # Calculate modularity score for weighted graphs
    # Q = (1/2m) * Σ[A_ij - (k_i * k_j)/(2m)] * δ(c_i, c_j)
    
    n = nv(g)  # number of vertices
    
    # Calculate total weight (2m) and weighted degrees
    total_weight = 0.0
    weighted_degrees = zeros(Float64, n)
    
    # Get edge weights and calculate total weight and degrees
    for edge in edges(g)
        i, j = src(edge), dst(edge)
        # Get the actual weight from edge_weights dictionary
        weight = get(edge_weights, (i, j), 1.0)
        
        total_weight += weight
        weighted_degrees[i] += weight
        weighted_degrees[j] += weight
    end
    
    # For undirected graphs, we've double-counted, so 2m = total_weight
    two_m = total_weight
    
    # Calculate modularity
    modularity = 0.0
    
    for i in 1:n
        for j in i:n  # Only iterate j >= i to avoid double counting
            # Check if nodes i and j are in the same community
            if node_color_indices[i] == node_color_indices[j]
                # Get actual edge weight A_ij
                A_ij = 0.0
                if has_edge(g, i, j)
                    # Get the actual weight from edge_weights dictionary
                    A_ij = get(edge_weights, (i, j), 1.0)
                end
                
                # Expected weight under null model
                expected_weight = (weighted_degrees[i] * weighted_degrees[j]) / two_m
                
                # Contribution to modularity
                contribution = A_ij - expected_weight
                
                # For diagonal terms (i == j), count once
                # For off-diagonal terms (i != j), count twice (since we're only iterating upper triangle)
                if i == j
                    modularity += contribution
                else
                    modularity += 2 * contribution
                end
            end
        end
    end
    
    # Normalize by 2m
    modularity = modularity / two_m
    
    return modularity
end