% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clustering.R
\name{cluster_graph_vis}
\alias{cluster_graph_vis}
\title{Graph Visualization of Pathway Clustering}
\usage{
cluster_graph_vis(clu_obj, kappa_mat, enrichment_res,
  kappa_threshold = 0.35, use_names = FALSE)
}
\arguments{
\item{clu_obj}{clustering result (either a matrix obtained via
`fuzzy_pw_clustering` or a vector obtained via `hierarchical_pw_clustering`)}

\item{kappa_mat}{matrix of kappa statistics (output of `create_kappa_matrix`)}

\item{enrichment_res}{data frame of pathway enrichment results}

\item{kappa_threshold}{threshold for kappa statistics, defining strong relation (default = 0.35)}

\item{use_names}{boolean to indicate whether to use pathway names instead of IDs (default = FALSE, i.e. use IDs)}
}
\value{
Plots a graph diagram of clustering results. Each node is a term from `enrichment_res`.
Size of node corresponds to -log(lowest_p). Thickness of the edges between nodes correspond to the
kappa statistic between the two terms. Color of each node corresponds to distinct clusters. For fuzzy
clustering, if a term is in multiple clusters, multiple colors are utilized.
}
\description{
Graph Visualization of Pathway Clustering
}
\examples{
\dontrun{
cluster_graph_vis(clu_obj, kappa_mat, enrichment_res)
}
}
