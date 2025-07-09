# 🌟 Julia Graph Analysis Project

A robust community detection and modularity scoring system for weighted graphs with both interactive and stable workflows.

## 🚀 Quick Start

### Option 1: Main Launcher (Recommended)
```bash
julia launcher.jl
```
- Menu-driven interface
- Both interactive (GLMakie) and stable (CairoMakie) workflows
- Automatic package installation
- Batch processing support

### Option 2: Interactive Launcher
```bash
julia interactive_launcher.jl [filename]
```
- Interactive workflows only (GLMakie)
- Command-line argument support
- Menu-driven file selection

### Option 3: Direct Usage
```bash
# Stable workflow (saves PNG files)
julia -e "include(\"mini03_stable.jl\"); run_stable_workflow(\"graphs/graph03.txt\")"

# Interactive workflow (opens windows)
julia -e "include(\"mini03.jl\"); run_graph(\"graphs/graph03.txt\")"
```

## 📁 Project Structure

```
mini03/
├── launcher.jl              # Main launcher (interactive + stable)
├── interactive_launcher.jl  # Interactive-only launcher
├── mini03.jl                # Interactive workflow (GLMakie)
├── mini03_stable.jl         # Stable workflow (CairoMakie)
├── plot_graph.jl            # GLMakie plotting functions
├── plot_graph_stable.jl     # CairoMakie plotting functions
├── scoring.jl               # Original modularity scoring
├── scoring_stable.jl        # Adjacency-list modularity scoring
└── graphs/                  # All graph files and visualizations
    ├── graph01.txt          # Test graph files
    ├── graph02.txt
    ├── ...
    ├── graph_input.txt      # Default input file
    └── *.png               # Generated visualizations
```

## 🎯 Features

### Interactive Workflow (GLMakie)
- ✅ Real-time interactive graph visualization
- ✅ Click nodes to change community assignments
- ✅ Drag nodes to rearrange layout
- ✅ Live modularity score updates
- ✅ Automatic graphics backend restart on errors

### Stable Workflow (CairoMakie)
- ✅ Reliable PNG file output
- ✅ No hanging or graphics issues
- ✅ Batch processing support
- ✅ Consistent visualization quality
- ✅ Perfect for automated workflows

### Launcher Features
- ✅ Automatic package installation
- ✅ Robust error handling
- ✅ Menu-driven interface
- ✅ World age issue resolution
- ✅ Clean workspace organization

## 📊 Graph File Format

Graph files should contain edges (one per line):
```
# Community 1
1 2
2 3
3 1

# Community 2
4 5
4 6
5 6
```

## 🛠️ Available Functions

### Interactive Functions (mini03.jl)
- `run_graph(filename)` - Simple interactive workflow
- `run_graph_interactive(filename)` - Interactive with menu
- `restart_graphics()` - Fix graphics backend issues

### Stable Functions (mini03_stable.jl)
- `run_stable_workflow(filename)` - Single file processing
- `run_stable_batch(directory)` - Batch processing

## 🔧 Requirements

- Julia 1.10+
- Packages: GLMakie, CairoMakie, GraphMakie, Graphs, Colors
- All packages are automatically installed by the launchers

## 📈 Usage Examples

### Process a single graph interactively
```bash
julia interactive_launcher.jl graphs/graph03.txt
```

### Batch process all graphs (stable)
```bash
julia launcher.jl
# Choose option 6: Batch process all test graphs - STABLE PNG
```

### Quick test
```bash
julia launcher.jl
# Choose option 7: Run quick test (stable workflow)
```

## 🎨 Output

- **Interactive workflow**: Opens interactive windows with GLMakie
- **Stable workflow**: Saves PNG files to `graphs/` directory
- **Visualizations**: Color-coded communities with modularity scores
- **File naming**: `{filename}_visualization.png` or `batch_{n}_visualization.png`

## 🚨 Troubleshooting

### Graphics Issues
- Use the stable workflow (CairoMakie) for reliable output
- The launcher includes automatic graphics backend restart
- Call `restart_graphics()` in interactive mode if needed

### Package Issues
- Launchers automatically install missing packages
- Run `julia -e "using Pkg; Pkg.instantiate()"` for manual setup

### File Issues
- All graph files should be in the `graphs/` directory
- Use absolute paths or run from the project directory
- Check that graph files are properly formatted

## 🔧 Recent Updates

### December 2024 - Batch Processing Fix
- ✅ **Fixed batch processing output location**: All batch visualization files now save to `graphs/` subfolder
- ✅ **Consistent file organization**: Both single file and batch processing outputs go to the same location
- ✅ **Clean workspace**: No more visualization files scattered in the main directory

## 🎯 Recommendations

1. **For reliable output**: Use the stable workflow (options 4-6 in main launcher)
2. **For exploration**: Use the interactive workflow (options 1-3 in main launcher)
3. **For automation**: Use direct function calls with `mini03_stable.jl`
4. **For testing**: Use the interactive launcher with command-line arguments

---

**Status**: ✅ Complete and fully functional
**Last Updated**: December 2024
