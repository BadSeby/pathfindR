% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/visualization_functions.R
\name{visualize_pw_interactions}
\alias{visualize_pw_interactions}
\title{Visualize Interactions of Genes Involved in the Given Pathways}
\usage{
visualize_pw_interactions(result_df, pin_name_path)
}
\arguments{
\item{result_df}{Data frame of enrichment results. Must-have columns
are: "Pathway", "Up_regulated" and "Down_regulated"}

\item{pin_name_path}{Name of the chosen PIN or path/to/PIN.sif. If PIN name,
must be one of c("Biogrid", "GeneMania", "IntAct", "KEGG"). If
path/to/PIN.sif, the file must comply with the PIN specifications. Defaults
to Biogrid.}
}
\value{
Creates PNG files visualizing the interactions of genes involved
in the given pathways (annotated in the `result_df`) in the PIN used for enrichment
analysis (specified by `pin_name_path`). The PNG files are saved in the folder
"pathway_visualizations" under the current working directory.
}
\description{
Visualize Interactions of Genes Involved in the Given Pathways
}
\details{
The following steps are performed for the visualization of interactions
of genes involved in the given pathways: \enumerate{
  \item shortest paths between all affected genes are determined (via `igraph`)
  \item the nodes of all shortest pathways are merged
  \item the PIN is subsetted using the merged nodes (genes)
  \item using the PIN subset, the graph showing the interactions is generated
  \item the final graph is visualized using `igraph`, colored by changed status and saved as a PNG file.
}
}
\examples{
\dontrun{
visualize_pw_interactions(result_df, pin_name_path = "IntAct")
}
}
\seealso{
See \code{\link{visualize_pws}} for the wrapper function
  for creating pathway diagrams. See \code{\link{run_pathfindR}} for the
  wrapper function of the pathfindR workflow.
}
