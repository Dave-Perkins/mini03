# Plan for 3-SAT and Community Detection

### Need to:
- Create 3-SAT instances of any size.
- Convert a 3-SAT instance to an edge-weighted graph.
- Run community detection on the graph.
- Run my algorithm on the communities.

## Breakdown:

# Create 3-SAT instances of any size.
- Specify a number of variables.
- Specify a number of clauses.
- Generate random clauses or specify them manually.
- **Use Markdown format for human-readable input files!**

## Proposed Markdown Format for 3-SAT Instances

### Example: `3sat_instance_01.md`
```markdown
# 3-SAT Instance: Random 5-variable, 10-clause

## Variables
- x₁, x₂, x₃, x₄, x₅

## Clauses
1. (x₁ ∨ ¬x₂ ∨ x₃)
2. (¬x₁ ∨ x₄ ∨ ¬x₅)
3. (x₂ ∨ x₃ ∨ x₄)
4. (¬x₃ ∨ x₅ ∨ x₁)
5. (x₄ ∨ ¬x₁ ∨ ¬x₂)
6. (¬x₄ ∨ x₂ ∨ x₅)
7. (x₃ ∨ ¬x₅ ∨ ¬x₁)
8. (x₅ ∨ x₁ ∨ ¬x₃)
9. (¬x₂ ∨ ¬x₄ ∨ x₃)
10. (x₁ ∨ x₅ ∨ ¬x₄)

## Metadata
- Variables: 5
- Clauses: 10
- Ratio: 2.0 (clauses/variables)
- Generated: random
- Satisfiable: unknown
```

## Implementation Steps

### 1. Create 3-SAT Generator
- Function to generate random instances
- Function to parse markdown 3-SAT files
- Function to validate 3-SAT instances

### 2. Convert to Graph Format
- Parse clauses to extract literal co-occurrences
- Generate edge weights (frequency of co-occurrence)
- Output to our standard `.txt` graph format

### 3. Analysis Pipeline
- Load markdown 3-SAT → Convert to graph → Community detection → Algorithm

## Advantages of Markdown Format
- **Human readable** - Easy to understand and verify
- **Documented** - Can include metadata, notes, and analysis
- **Version controllable** - Git-friendly format
- **Extensible** - Can add satisfying assignments, analysis results, etc.
- **Research friendly** - Perfect for academic work and publications

## ✅ Implementation Status

### Completed Components

1. **3-SAT Markdown Generator** (`sat3_markdown_generator.jl`)
   - ✅ Random 3-SAT instance generation with configurable parameters
   - ✅ Markdown format output with proper structure
   - ✅ Graph format conversion for community detection
   - ✅ Node-to-literal mapping preservation

2. **Research Pipeline** (`research_pipeline.jl`)
   - ✅ End-to-end workflow automation
   - ✅ Multiple SAT difficulty regions (easy/critical/hard)
   - ✅ Command-line interface with flexible parameters
   - ✅ Integration with existing community detection tools

3. **Community Detection Integration**
   - ✅ Seamless conversion from markdown → graph → analysis
   - ✅ Interactive visualization with manual cluster refinement
   - ✅ Modularity scoring for SAT instance structure

### Example Usage

```bash
# Generate single research instance
julia research_pipeline.jl 5 15 123

# Run systematic study across SAT regions
julia research_pipeline.jl

# Interactive analysis mode
julia research_pipeline.jl 4 12 42 interactive
```

### Generated Files Example

For a 3-variable, 5-clause instance:

**research_3vars_5clauses_seed42.md:**
```markdown
# Research Instance: 3 variables, 5 clauses

## Variables
- x1, x2, x3

## Clauses
1. (x2 ∨ ¬x2 ∨ ¬x3)
2. (x2 ∨ ¬x2 ∨ x2)
3. (¬x2 ∨ x2 ∨ x1)
4. (¬x2 ∨ x1 ∨ x1)
5. (¬x2 ∨ x2 ∨ ¬x1)

## Metadata
- Variables: 3
- Clauses: 5
- Ratio: 1.67 (clauses/variables)
- Generated: random
- Seed: 42
```

**research_3vars_5clauses_seed42.txt:** (graph format)
```
3 4 3
1 2 1
2 3 2
4 5 1
1 4 2
```

**Community Detection Results:**
- Modularity improvements through literal clustering
- Visual identification of variable relationships
- Interactive refinement of clause groupings

## Research Advantages

1. **Reproducibility**: Seeded random generation ensures consistent results
2. **Human Readability**: Markdown format enables easy inspection and modification
3. **Version Control**: Text-based formats work seamlessly with Git
4. **Systematic Studies**: Pipeline supports batch processing across difficulty regions
5. **Integration**: Direct connection between SAT instances and graph analysis tools

## 🎯 Workspace Organization Status

### ✅ COMPLETED - Professional Structure Implemented

The workspace has been completely reorganized with a clean, professional structure:

```
mini03/
├── 📄 main.jl                 # Single entry point for all functionality
├── 📄 README.md               # Complete documentation
├── 📄 workspace_summary.jl    # Organization status checker
├── 📄 plan.md                 # Research planning and implementation status
├── ⚙️  Project.toml & Manifest.toml  # Julia package configuration
│
├── 📁 src/                    # Core source code (7 files)
│   ├── mini03.jl             # Main community detection engine  
│   ├── scoring.jl            # Modularity calculation
│   ├── plot_graph.jl         # Visualization components
│   ├── sat3_markdown_generator.jl  # 3-SAT instance generation
│   ├── research_pipeline.jl   # Research automation
│   ├── interactive_launcher.jl # Interactive interface
│   └── repl_setup.jl         # REPL configuration
│
├── 📁 examples/               # Example outputs (3 files)
│   ├── example_3sat.md       # Sample markdown 3-SAT instance
│   ├── example_3sat_graph.txt # Sample graph format
│   └── example_3sat_mapping.txt # Sample node mapping
│
├── 📁 research/               # Research instances and results
│   ├── research_3vars_5clauses_seed42.md
│   ├── research_5vars_10clauses_seed100.md  (Easy region)
│   ├── research_5vars_21clauses_seed200.md  (Critical region)
│   └── research_5vars_30clauses_seed300.md  (Hard region)
│
├── 📁 graphs/                 # Graph data files (14 files)
│   ├── graph01.txt → graph08.txt  # Original test graphs
│   ├── graph09-4comm.txt          # 4-community example
│   ├── graph11-3sat-practice.txt  # 3-SAT practice instances
│   └── graph14-modularity.txt     # Modularity test case
│
├── 📁 docs/                   # Documentation (10 files)
│   ├── README.md             # Additional documentation
│   ├── PROJECT_STATUS.md     # Development status
│   ├── 3SAT_*.md            # Research documentation
│   └── *.md                 # Other documentation files
│
├── 📁 test/                   # Test suite
│   ├── test_basic.jl         # Basic functionality tests
│   └── test_output/          # Test output directory
│
└── 📁 archive/                # Archived development files
    ├── backup_files/         # Code backups
    ├── debug_files/          # Debug sessions
    ├── test_files/           # Old test files
    └── analysis_files/       # Analysis artifacts
```

### 🚀 Usage Modes

**1. Quick Start:**
```bash
julia main.jl                    # Load everything with examples
```

**2. Research Mode:**
```bash
julia main.jl
julia> research_pipeline(5, 15, seed=123)
```

**3. Analysis Mode:**
```bash
julia main.jl  
julia> run_graph("graphs/graph03.txt")
julia> run_graph_interactive("graphs/graph03.txt")
```

**4. Development/Testing:**
```bash
julia test/test_basic.jl         # Run test suite
julia workspace_summary.jl      # Check organization
```

### ✅ Benefits Achieved

1. **Clean Separation**: Source, examples, research, and tests clearly separated
2. **Single Entry Point**: `main.jl` loads everything with clear documentation
3. **Professional Structure**: Standard Julia package layout with `src/` directory
4. **Complete Documentation**: README, inline documentation, and usage examples
5. **Test Infrastructure**: Basic test suite with output validation
6. **Research Organization**: Systematic storage of generated instances and results
7. **Archive System**: Historical development files preserved but separated

### 🎯 Ready for Research

The workspace is now perfectly organized for:
- **Systematic 3-SAT studies** across difficulty regions
- **Community detection research** with reproducible results  
- **Interactive analysis** with visual refinement
- **Educational use** with clear examples and documentation
- **Collaborative development** with professional structure

