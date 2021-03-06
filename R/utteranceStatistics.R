#' @title Utterance Statistics
#' @description This method calculates the length of each utterance, organised by figure and drama.
#' @param t The dramatic text(s)
#' @param numberOfFigures The maximal number of figures per drama to include. Default: 10. Set to FALSE to include all figures.
#' @param normalizeByDramaLength Logical value. If true, the resulting values will be normalized by the length of the drama.
#' @export
#' @examples
#' data(rksp.0)
#' ustat <- utteranceStatistics(rksp.0$mtext, numberOfFigures = 5)
#' \dontrun{
#' boxplot(ustat$utteranceLength ~ ustat$figure,
#'    col=qd.colors[1:5],
#'    las=2, frame=FALSE)
#' }
#' @importFrom stats aggregate
utteranceStatistics <- function(t, numberOfFigures=10, normalizeByDramaLength = TRUE) {

  if (typeof(numberOfFigures) == "double") {
    t <- limitFigures(t, by="rank", threshold = numberOfFigures)
  }
  # utterance statistics
  ulength <- aggregate(t$Token.surface, by=list(t$corpus,t$drama, t$Speaker.figure_surface, t$begin), length)

  colnames(ulength) <- c("corpus","drama", "figure", "begin", "utteranceLength")

  # normalize by drama length
  if (normalizeByDramaLength == TRUE) {
    dlength <- aggregate(t$Token.surface, by=list(corpus=t$corpus, drama=t$drama), length)
    ulength <- merge(ulength,dlength, by.x=c("corpus","drama"),by.y=c("corpus","drama"))
    ulength$utteranceLength <- ulength$utteranceLength / ulength$x
  }
  # skip empty factor levels
  ulength <- droplevels(ulength)

  # make nicer names
  ulength$figure <- sapply(strsplit(x = as.character(ulength$figure), split="[,.]"),"[", 1)

  # order them by drama and alphabetically
  ulength$figure <- factor(ulength$figure, levels=unique(ulength[order(ulength$drama, ulength$figure),]$figure))

  ulength
}


utterance_statistics <- function(...) {
  .Deprecated("utteranceStatistics")
  utteranceStatistics(...)
}
