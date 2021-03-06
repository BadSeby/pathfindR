% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/core_functions.R
\name{run_pathfindR}
\alias{run_pathfindR}
\title{Wrapper Function for pathfindR Workflow}
\usage{
run_pathfindR(input, p_val_threshold = 0.05, visualize_pathways = TRUE,
  human_genes = TRUE, enrichment_threshold = 0.05,
  adj_method = "bonferroni", search_method = "GR",
  use_all_positives = FALSE, saTemp0 = 1, saTemp1 = 0.01,
  saIter = 10000, gaPop = 400, gaIter = 200, gaThread = 5,
  gaMut = 0, grMaxDepth = 1, grSearchDepth = 1, grOverlap = 0.5,
  grSubNum = 1000, iterations = 10, n_processes = NULL,
  pin_name_path = "Biogrid", score_quan_thr = 0.8, sig_gene_thr = 10,
  gene_sets = "KEGG", custom_genes = NULL, custom_pathways = NULL,
  bubble = TRUE, output_dir = "pathfindR_Results",
  list_active_snw_genes = FALSE, silent_option = TRUE)
}
\arguments{
\item{input}{the input data that pathfindR uses. The input must be a data
  frame with three columns: \enumerate{
  \item Gene Symbol (HGNC Gene Symbol)
  \item Change value, e.g. log(fold change) (Not obligatory)
  \item adjusted p value associated with test, e.g. differential expression/methylation
}}

\item{p_val_threshold}{the adjusted-p value threshold to use when filtering
the input data frame. Must a numeric value between 0 and 1.}

\item{visualize_pathways}{Boolean value to indicate whether or not to create pathway diagrams.}

\item{human_genes}{boolean to indicate whether the input genes are
human gene symbols or not (default = TRUE)}

\item{enrichment_threshold}{threshold used when filtering individual iterations' pathway
enrichment results}

\item{adj_method}{correction method to be used for adjusting p-values of
pathway enrichment results (Default: 'bonferroni', see ?p.adjust)}

\item{search_method}{algorithm to use when performing active subnetwork
search. Options are greedy search (GR), simulated annealing (SA) or genetic
algorithm (GA) for the search (Default:GR. Can be one of c("GR", "SA",
"GA"))}

\item{use_all_positives}{if TRUE: in GA, adds an individual with all positive
nodes. In SA, initializes candidate solution with all positive nodes.
(Default = FALSE)}

\item{saTemp0}{Initial temperature for SA (Default = 1.0)}

\item{saTemp1}{Final temperature for SA (Default = 0.01)}

\item{saIter}{Iteration number for SA (Default = 10000)}

\item{gaPop}{Population size for GA (Default = 400)}

\item{gaIter}{Iteration number for GA (Default = 200)}

\item{gaThread}{Number of threads to be used in GA (Default = 5)}

\item{gaMut}{For GA, applies mutation with given mutation rate (Default = 0, i.e. mutation off)}

\item{grMaxDepth}{Sets max depth in greedy search, 0 for no limit (Default = 1)}

\item{grSearchDepth}{Search depth in greedy search (Default = 1)}

\item{grOverlap}{Overlap threshold for results of greedy search (Default = 0.5)}

\item{grSubNum}{Number of subnetworks to be presented in the results (Default = 1000)}

\item{iterations}{number of iterations for active subnetwork search and
enrichment analyses (Default = 10. Gets set to 1 for Genetic Algorithm)}

\item{n_processes}{optional argument for specifying the number of processes
used by foreach. If not specified, the function determines this
automatically (Default == NULL. Gets set to 1 for Genetic Algorithm)}

\item{pin_name_path}{Name of the chosen PIN or path/to/PIN.sif. If PIN name,
must be one of c("Biogrid", "GeneMania", "IntAct", "KEGG"). If
path/to/PIN.sif, the file must comply with the PIN specifications. Defaults
to "Biogrid".}

\item{score_quan_thr}{active subnetwork score quantile threshold (Default = 0.80)}

\item{sig_gene_thr}{threshold for minimum number of significant genes (Default = 10)}

\item{gene_sets}{the gene sets to be used for enrichment analysis. Available gene sets
are KEGG, Reactome, BioCarta, GO-All, GO-BP, GO-CC, GO-MF or Custom. If "Custom", the arguments
custom_genes and custom pathways must be specified. (Default = "KEGG")}

\item{custom_genes}{a list containing the genes involved in each custom pathway. Each element
is a vector of gene symbols located in the given pathway. Names correspond to
the ID of the pathway.}

\item{custom_pathways}{A list containing the descriptions for each custom pathway. Names of the
list correspond to the ID of the pathway.}

\item{bubble}{boolean value. If TRUE, a bubble chart displaying the enrichment
results is plotted. (default = TRUE)}

\item{output_dir}{the directory to be created under the current working
directory where the output and intermediate files are saved (default: "pathfindR_Results")}

\item{list_active_snw_genes}{boolean value indicating whether or not to report
the non-DEG active subnetwork genes for the active subnetwork which was enriched for
the given pathway with the lowest p value (default = FALSE)}

\item{silent_option}{boolean value indicating whether to print the messages to the console (FALSE)
or print to a file (TRUE) during active subnetwork search (default = TRUE). This option was added
because during parallel runs, the console messages get mixed up.}
}
\value{
Data frame of pathfindR enrichment results. Columns are: \describe{
  \item{ID}{KEGG ID of the enriched pathway}
  \item{Pathway}{Description of the enriched pathway}
  \item{Fold_Enrichment}{Fold enrichment value for the enriched pathway (Calculated using ONLY the input genes)}
  \item{occurrence}{the number of iterations that the given pathway was found to enriched over all iterations}
  \item{lowest_p}{the lowest adjusted-p value of the given pathway over all iterations}
  \item{highest_p}{the highest adjusted-p value of the given pathway over all iterations}
  \item{non_DEG_Active_Snw_Genes (OPTIONAL)}{the non-DEG active subnetwork genes, comma-separated}
  \item{Up_regulated}{the up-regulated genes in the input involved in the given pathway, comma-separated}
  \item{Down_regulated}{the down-regulated genes in the input involved in the given pathway, comma-separated}
}
 The function also creates an HTML report with the pathfindR enrichment
 results linked to the visualizations of the pathways in addition to
 the table of converted gene symbols. This report can be found in
 "`output_dir`/results.html" under the current working directory.

 Optionally, a bubble chart of enrichment results are plotted. The x-axis
 corresponds to fold enrichment values while the y-axis indicates the enriched
 pathways. Size of the bubble indicates the number of DEGs in the given pathway.
 Color indicates the -log10(lowest-p) value; the more red it gets, the more significant
 the pathway is.
}
\description{
\code{run_pathfindR} is the wrapper function for the pathfindR workflow
}
\details{
This function takes in a data frame consisting of Gene Symbol, log-fold-change
and adjusted-p values. After input testing, any gene symbols that are not in
the PIN are converted to alias symbols if the alias is in the PIN. Next,
active subnetwork search is performed. Pathway enrichment analysis is
performed using the genes in each of the active subnetworks. Pathways with
adjusted-p values lower than \code{enrichment_threshold} are discarded. The
lowest adjusted-p value (over all subnetworks) for each pathway is kept. This
process of active subnetwork search and enrichment is repeated  for a selected
number of \code{iterations}, which is done in parallel. Over all iterations,
the lowest and the highest adjusted-p values, as well as number of occurrences
are reported for each enriched pathway.
}
\section{Warning}{
 Especially depending on the protein interaction network,
 the algorithm and the number of iterations you choose, active subnetwork
 search component of pathfindR may take a very long time to finish.
}

\examples{
\dontrun{
run_pathfindR(RA_input)
}
}
\seealso{
\code{\link{input_testing}} for input testing, \code{\link{input_processing}} for input processing,
\code{\link{active_snw_search}} for active subnetwork search and subnetwork filtering,
\code{\link{enrichment_analyses}} for enrichment analysis (using the active subnetworks),
\code{\link{summarize_enrichment_results}} for summarizing the active-subnetwork-oriented enrichment results,
\code{\link{annotate_pathway_DEGs}} for annotation of affected genes in the given gene sets,
\code{\link{visualize_pws}} for visualization of pathway diagrams,
\code{\link{enrichment_chart}} for a visual summary of the pathfindR enrichment result,
\code{\link[foreach]{foreach}} for details on parallel execution of looping constructs,
\code{\link{cluster_pathways}} for clustering the resulting enriched pathways and partitioning into clusters.
}
